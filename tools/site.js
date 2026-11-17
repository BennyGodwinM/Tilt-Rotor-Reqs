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
