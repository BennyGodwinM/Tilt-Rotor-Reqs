const MS=['SRR','PDR','CDR','SIR','ORR','PostFlight'];
const all=[...DATA.veh,...DATA.prog];
const esc=s=>String(s).replace(/[&<>"]/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]));
const strip=document.getElementById('strip');
const counts=MS.map(m=>DATA.prog.filter(r=>r.ms===m).length), mx=Math.max(...counts);
strip.innerHTML=MS.map((m,i)=>`<div><div class="tb-label">${m}</div><div class="num">${counts[i]}</div><div class="bar" aria-hidden="true"><span style="height:${Math.max(4,counts[i]/mx*100)}%"></span></div></div>`).join('');
const own=document.getElementById('own');
[...new Set(all.map(r=>r.owner))].forEach(o=>{const e=document.createElement('option');e.textContent=o;own.appendChild(e)});
function render(){
  const q=document.getElementById('q').value.toLowerCase(),o=own.value,m=document.getElementById('ms').value,b=document.getElementById('bs').value;
  const rs=all.filter(r=>(!q||(r.id+' '+r.text+' '+r.why).toLowerCase().includes(q))&&(!o||r.owner===o)&&(!m||r.ms===m)&&(!b||r.basis===b));
  document.getElementById('rows').innerHTML=rs.map(r=>`<tr><td class="id">${esc(r.para)}</td><td class="id">${esc(r.id)}</td><td>${esc(r.text)}${r.crit?`<div class="why">Success: ${esc(r.crit)} (${esc(r.method)}, ${esc(r.fac)})</div>`:''}<div class="why">${esc(r.why)}${r.src&&r.src!=='Vehicle model'?' Source: '+esc(r.src)+'.':''}</div></td><td>${esc(r.owner)}</td><td>${esc(r.ms)}</td><td><span class="pill b-${esc(r.basis)}">${esc(r.basis)}</span></td></tr>`).join('');
  document.getElementById('cnt').textContent=rs.length+' of '+all.length;
}
['q','own','ms','bs'].forEach(i=>document.getElementById(i).addEventListener('input',render));
document.getElementById('tbd').innerHTML=DATA.tbd.map(t=>`<tr><td class="id">${t.n}</td><td class="id">${esc(t.id)}</td><td>${esc(t.what)}${t.detail&&t.detail!=='confirm or replace'?': '+esc(t.detail):''}</td><td>${esc(t.by)}</td></tr>`).join('');
render();

// views
const VIEWS=DATA.views.views;
document.getElementById('views').innerHTML=Object.entries(VIEWS).map(([k,v])=>`<div><h3>${esc(v.title)}</h3><p class="sub">${esc(v.desc)}</p><div class="scroll" style="padding:12px;margin-top:8px"><pre class="mermaid">${esc(v.src)}</pre></div></div>`).join('');
document.getElementById('trace').innerHTML=DATA.views.trace.map(t=>`<tr><td><span class="id mono">${esc(t.id)}</span><div class="why">${esc(t.text)}</div></td><td>${t.parts.map(esc).join(', ')||'<span class="pill b-placeholder">none</span>'}</td><td>${t.ver.map(esc).join(', ')||'<span class="pill b-placeholder">none yet</span>'}</td><td>${t.proof.map(esc).join(', ')||'<span class="why">through parent</span>'}</td></tr>`).join('');
// impact
const IM=DATA.impact,adj={},radj={};
IM.edges.forEach(([a,b,k])=>{(adj[a]=adj[a]||[]).push(b);(radj[b]=radj[b]||[]).push(a)});
const reach=(s,g)=>{const seen=new Set(),st=[s];while(st.length){const x=st.pop();(g[x]||[]).forEach(y=>{if(!seen.has(y)){seen.add(y);st.push(y)}})}return [...seen]};
const sel=document.getElementById('impsel');
Object.keys(IM.nodes).filter(k=>/^(VEH|part:)/.test(k)||true).sort().forEach(k=>{const o=document.createElement('option');o.value=k;o.textContent=k.replace('part:','part ')+' - '+IM.nodes[k].label.slice(0,70);sel.appendChild(o)});
sel.value='VEH-5';
function showImp(){
  const k=sel.value,list=(ids)=>ids.length?`<ul style="margin:6px 0 0;padding-left:18px">${ids.sort().map(i=>`<li><span class="mono">${esc(i.replace('part:',''))}</span> <span class="why">${esc(IM.nodes[i].kind)}</span></li>`).join('')}</ul>`:'<span class="why">nothing</span>';
  const d=reach(k,adj),u=reach(k,radj);
  document.getElementById('imp').innerHTML=`<div><b>Changing this impacts (${d.length})</b>${list(d)}</div><div><b>Impacted by (${u.length})</b>${list(u)}</div>`;
}
sel.addEventListener('input',showImp);showImp();
