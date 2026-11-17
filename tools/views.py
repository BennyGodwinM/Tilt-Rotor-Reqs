#!/usr/bin/env python3
"""Generate SysML views as Mermaid (BDD, IBD, requirements, state, parametric, program) plus the impact graph.
Run from the repo root after editing the models: python3 tools/views.py"""
import re,os,json,sys
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
from sysmlparse import blocks,num
root=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
rd=lambda f:open(os.path.join(root,'models',f)).read()
vt,pt=rd('TiltrotorVehicleRequirements.sysml'),rd('TiltrotorProgramModel.sysml')
veh=blocks(vt);prog=blocks(pt)
vpath={b['path']:b for b in veh};ppath={b['path']:b for b in prog}
def vid(p): return vpath[p]['id']
def pid(p): return ppath[p.replace('TiltrotorProgramModel::','')]['id']
# ---- part definitions and the tiltrotor usage
def body_of(text,start):
    i=text.find('{',start); j=text.find(';',start)
    if i<0 or (0<=j<i): return ''
    d=1;k=i+1
    while d:
        d+=(text[k]=='{')-(text[k]=='}');k+=1
    return text[i+1:k-1]
pdefs={}
for m in re.finditer(r"part def (\w+)",vt):
    body=body_of(vt,m.end())
    pdefs[m.group(1)]=dict(ports=re.findall(r"port (\w+) : (\w+);",body),parts=re.findall(r"part (\w+) : (\w+);",body))
tr=re.search(r"part tiltrotor : Vehicle \{(.*?)\n        part boundary",vt,re.S).group(1)
tparts=re.findall(r"part (\w+) : (\w+);",tr)
conns=re.findall(r"connect (\w+)\.(\w+) to (\w+)\.(\w+);",tr)
pports={n:dict(d['ports']) for n,d in pdefs.items()}
ptype=dict(tparts)
sat=[(vid(a),b) for a,b in re.findall(r"satisfy (vehicleReqs[\w:]*) by tiltrotor((?:::\w+)?);",vt)]
sat=[(r,(p.strip(':') or 'tiltrotor')) for r,p in sat]
dep=[(vid(a),pid(b)) for a,b in re.findall(r"dependency from (vehicleReqs[\w:]*) to (TiltrotorProgramModel::[\w:]+);",vt)]
ver=[(n,vid(r)) for n,r in re.findall(r"verification def (\w+) \{[^}]*?verify (vehicleReqs[\w:]*);",vt)]
st=re.search(r"state def FlightModes \{(.*?)\n    \}",vt,re.S).group(1)
trans=re.findall(r"transition (\w+) first (\w+) then (\w+);",st)
V={}
# ---- BDD
b=["classDiagram","  direction LR"]
for n,d in pdefs.items():
    if n in('Vehicle',):continue
    b.append(f"  class {n}"+(" {\n"+"\n".join(f"    port {p} : {t}" for p,t in d['ports'])+"\n  }" if d['ports'] else ""))
b.append("  class Tiltrotor")
for n,t in tparts: b.append(f"  Tiltrotor *-- {t} : {n}")
for n,d in pdefs.items():
    for pn,t in d['parts']: b.append(f"  {n} *-- {t} : {pn}")
V['bdd']=("Block definition diagram","Part definitions and what contains what. Each arrow reads: the whole contains the part, labelled with the part name.","\n".join(b))
# ---- IBD
i=["flowchart LR"]
i.append('  subgraph tiltrotor["tiltrotor : Vehicle"]')
for n,t in tparts:
    d=pdefs.get(t,{})
    if d.get('parts'):
        i.append(f'    subgraph {n}["{n} : {t}"]')
        for pn,pt_ in d['parts']: i.append(f'      {n}_{pn}["{pn} : {pt_}"]')
        i.append('    end')
    else: i.append(f'    {n}["{n} : {t}"]')
i.append('  end')
for a,ap,bn,bp in conns:
    t=pports.get(ptype[a],{}).get(ap,'')
    kind='==>' if 'Power' in t else '-->'
    i.append(f'  {a} {kind}|"{ap} to {bp}"| {bn}')
V['ibd']=("Internal block diagram","Parts of the tiltrotor and the connections between their ports. Thick arrows carry power, thin arrows carry commands. Proposed architecture, to confirm.","\n".join(i))
# ---- requirements / traceability
r=["flowchart LR"]
for x in veh:
    if x['id']=='VEH-0':continue
    s=x['doc'][:58]+('...' if len(x['doc'])>58 else '')
    r.append(f'  {x["id"].replace("-","_").replace(".","_")}["{x["id"]}<br/>{s}"]')
    par=x['parent']
    if par and par['id']!='VEH-0': r.append(f'  {par["id"].replace("-","_").replace(".","_")} --> {x["id"].replace("-","_").replace(".","_")}')
key=lambda s:s.replace('-','_').replace('.','_')
for q,p in sat:
    if q=='VEH-0':continue
    r.append(f'  {key(q)} -. satisfied by .-> P_{p}[("{p}")]')
for n,q in ver: r.append(f'  {key(q)} -. verified by .-> V_{n}{{{{"{n}"}}}}')
V['req']=("Requirements and traceability","Vehicle requirements with decomposition (solid), allocation to parts (satisfy) and verification cases (verify). The program requirements that prove each one are in the traceability matrix below.","\n".join(r))
# ---- trace matrix
trace=[]
for x in sorted([y for y in veh if y['id']!='VEH-0'],key=lambda y:num(y['id'])):
    q=x['id']
    trace.append(dict(id=q,text=x['doc'],parent=(x['parent']['id'] if x['parent'] and x['parent']['id']!='VEH-0' else ''),parts=sorted({'tiltrotor' if p=='tiltrotor' else p for r_,p in sat if r_==q}),ver=sorted(n for n,r_ in ver if r_==q),proof=sorted(p for r_,p in dep if r_==q)))
# ---- state
s=["stateDiagram-v2","  [*] --> hover"]+[f"  {a} --> {c} : {n}" for n,a,c in trans]
V['state']=("Flight modes","Allowed transitions between hover, conversion and cruise (VEH-7).","\n".join(s))
# ---- parametric
V['par']=("Endurance constraint","Parametric view of VEH-2: endurance in minutes equals battery energy divided by average power, times 60.","flowchart LR\n  E[\"batteryEnergyWh\"] --> C{{\"EnduranceConstraint<br/>enduranceMin = E / P * 60\"}}\n  P[\"averagePowerW\"] --> C\n  C --> M[\"enduranceMin >= 30<br/>VEH-2\"]")
# ---- program structure
groups=[x for x in prog if x['parent'] and x['parent']['id']=='PRG-0']
g=["flowchart LR",'  PRG["PRG-0 Tiltrotor program"]']
for x in groups:
    n=len([y for y in prog if y['parent'] is x])
    g.append(f'  {key(x["id"])}["{x["id"]} {x["name"][:-4]}<br/>{n} requirements"]\n  PRG --> {key(x["id"])}')
V['prog']=("Program structure","The top program and its ten discipline programs, with the number of requirements each owns.","\n".join(g))
# ---- impact graph (change flows from source to target)
nodes={};edges=[]
def node(i,kind,label): nodes[i]=dict(kind=kind,label=label)
for x in veh:
    if x['id']!='VEH-0': node(x['id'],'vehicle requirement',x['doc'])
for x in prog:
    if x['id'] not in('PRG-0',) and not x['id'].endswith('-0'): node(x['id'],'program requirement',x['doc'])
for n,t in tparts: node('part:'+n,'part',f'{n} : {t}')
for pn,t in [(a,b) for a,b in pdefs['Nacelle']['parts']]:
    for nac in('leftRotorNacelle','rightRotorNacelle'): node(f'part:{nac}.{pn}','part',f'{nac}.{pn} : {t}'); edges.append((f'part:{nac}',f'part:{nac}.{pn}','contains'))
for pn,t in pdefs['Gimbal']['parts']: node(f'part:noseGimbal.{pn}','part',f'noseGimbal.{pn} : {t}'); edges.append(('part:noseGimbal',f'part:noseGimbal.{pn}','contains'))
node('part:tiltrotor','part','tiltrotor : Vehicle')
for n,_ in verification if False else []: pass
for n,q in ver: node('ver:'+n,'verification case',n); edges.append((q,'ver:'+n,'verified by'))
for x in veh:
    if x['id']!='VEH-0' and x['parent'] and x['parent']['id']!='VEH-0': edges.append((x['parent']['id'],x['id'],'decomposes to'))
for x in prog:
    p=x['parent']
    if p and x['id'] in nodes and p['id'] in nodes: edges.append((p['id'],x['id'],'decomposes to'))
for q,p in sat:
    if q!='VEH-0': edges.append((q,'part:'+p,'satisfied by'))
for q,p in dep: edges.append((q,p,'proven by'))
for a,ap,bn,bp in conns: edges.append(('part:'+a,'part:'+bn,f'{ap} to {bp}'))
# group-level program requirement dependencies with no leaf: map group ids to children
edges=[(a,b,k) for a,b,k in edges if a in nodes and b in nodes]
for q,p in dep:
    if p not in nodes:  # group requirement such as AER-0: link to its leaves
        for x in prog:
            if x['parent'] and x['parent']['id']==p and x['id'] in nodes: edges.append((q,x['id'],'proven by'))
os.makedirs(os.path.join(root,'docs','views'),exist_ok=True)
json.dump(dict(nodes=nodes,edges=edges),open(os.path.join(root,'docs','impact.json'),'w'),indent=1)
md=["# SysML views","","Generated by tools/views.py from the models. GitHub renders the diagrams below. The architecture in the block and interconnection views is a proposed one to confirm.",""]
for k,(t,desc,src) in V.items():
    open(os.path.join(root,'docs','views',k+'.mmd'),'w').write(src+"\n")
    md+=[f"## {t}","",desc,"","```mermaid",src,"```",""]
md+=["## Traceability matrix","","| Vehicle requirement | Parent | Allocated to | Verified by | Proven by program requirements |","|---|---|---|---|---|"]+[f"| {t_['id']} | {t_['parent']} | {', '.join(t_['parts'])} | {', '.join(t_['ver']) or 'none yet'} | {', '.join(t_['proof'])} |" for t_ in trace]+[""]
open(os.path.join(root,'docs','views.md'),'w').write("\n".join(md))
json.dump(dict(views={k:dict(title=t,desc=d,src=s_) for k,(t,d,s_) in V.items()},trace=trace),open(os.path.join(root,'docs','views.json'),'w'))
# impact matrix
adj={};radj={}
for a,b,_ in edges: adj.setdefault(a,set()).add(b);radj.setdefault(b,set()).add(a)
def reach(s,g):
    seen=set();st=[s]
    while st:
        x=st.pop()
        for y in g.get(x,()):
            if y not in seen: seen.add(y);st.append(y)
    return seen
im=["# Impact analysis","","Generated by tools/views.py. Change flows along decomposition, allocation, verification, proof and connection links. 'Impacts' lists everything reachable downstream; 'Impacted by' lists everything upstream.","","| Item | Impacts | Impacted by |","|---|---|---|"]
for i in [k for k in nodes if k.startswith('VEH') or k.startswith('part:')]:
    im.append(f"| {i} | {len(reach(i,adj))}: {', '.join(sorted(reach(i,adj))[:12])}{' ...' if len(reach(i,adj))>12 else ''} | {len(reach(i,radj))}: {', '.join(sorted(reach(i,radj))[:12])} |")
open(os.path.join(root,'docs','impact.md'),'w').write("\n".join(im)+"\n")
print(len(nodes),'nodes',len(edges),'edges; views:',', '.join(V))
