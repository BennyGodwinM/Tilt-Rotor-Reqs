#!/usr/bin/env python3
"""Build docs/index.html (GitHub Pages) from docs/model_summary.json. Run tools/derive.py first."""
import json,os,sys
root=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
D=json.load(open(os.path.join(root,'docs','model_summary.json')))
G={'systemsEngineering':'Systems engineering','aerodynamics':'Aerodynamics','loads':'Loads','structures':'Structures','structuralIntegrity':'Structural integrity','rotorEffects':'Rotor effects','flutter':'Flutter','flightTest':'Flight test','safetyOfFlight':'Safety of flight','configurationManagement':'Configuration mgmt'}
rows=[dict(para=p,id=i,text=t,owner=G.get(o,o),ms=ms,basis=b,src=s,why=D['rationale'].get(i,'')) for p,i,t,o,ms,b,s in D['program']]
veh=[dict(para=p,id=i,text=t,owner='Vehicle',ms=ph,basis=b,src='Vehicle model',why=D['rationale'].get(i,''),method=m,crit=c,fac=f) for p,i,t,m,b,c,f,ph in D['vehicle']]
tbd=[dict(n=k,id=i,what=w,detail=d,by=m) for k,(i,w,d,o,m) in enumerate(D['tbd'],1)]
data=json.dumps(dict(prog=rows,veh=veh,tbd=tbd,views=json.load(open(os.path.join(root,'docs','views.json'))),impact=json.load(open(os.path.join(root,'docs','impact.json')))),separators=(',',':')).replace('</','<\\/')
bas={};[bas.__setitem__(r['basis'],bas.get(r['basis'],0)+1) for r in rows]
CSS=open(os.path.join(root,'tools','site.css')).read()
BODY=open(os.path.join(root,'tools','site_body.html')).read()
JS=open(os.path.join(root,'tools','site.js')).read()
stats=dict(prog=len(rows),veh=len(veh),tbd=len(tbd),**{f'b_{k}':v for k,v in bas.items()})
for k,v in stats.items(): BODY=BODY.replace('{{'+k+'}}',str(v))
frag=f'<title>Tiltrotor Requirements</title>\n<meta name="claude:viewport-fit-sides" content="cover">\n<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap">\n<style>\n{CSS}\n</style>\n{BODY}\n<script>\nconst DATA={data};\n{JS}\n</script>\n'
full='<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1">\n'+frag+'</head>\n</html>\n'
# body must follow head: rebuild properly
head,rest=frag.split('</style>\n',1)
mer='<script src="https://cdnjs.cloudflare.com/ajax/libs/mermaid/10.9.3/mermaid.min.js"></script>\n<script>mermaid.initialize({startOnLoad:true,theme:matchMedia("(prefers-color-scheme: dark)").matches?"dark":"neutral"});</script>\n'
full='<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1">\n'+head+'</style>\n</head>\n<body>\n'+rest+mer+'</body>\n</html>\n'
open(os.path.join(root,'docs','index.html'),'w').write(full)
open(os.path.join(root,'docs','.nojekyll'),'w').write('')
if len(sys.argv)>1: open(sys.argv[1],'w').write(frag)
print('site built',len(full),'bytes')
