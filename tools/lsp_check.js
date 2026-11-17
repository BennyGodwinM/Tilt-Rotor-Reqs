const {spawn}=require('child_process');const fs=require('fs');const path=require('path');
const server=path.join(__dirname,'js/node_modules/sysml-v2-lsp/dist/server/server.js');
const files=process.argv.slice(2);
const p=spawn('node',[server,'--stdio'],{stdio:['pipe','pipe','inherit']});
let buf=Buffer.alloc(0);const diags={};let id=0;const pend={};
function send(m){const s=JSON.stringify(m);p.stdin.write(`Content-Length: ${Buffer.byteLength(s)}\r\n\r\n${s}`);}
function req(method,params){return new Promise(r=>{const i=++id;pend[i]=r;send({jsonrpc:'2.0',id:i,method,params});});}
p.stdout.on('data',d=>{buf=Buffer.concat([buf,d]);for(;;){const h=buf.indexOf('\r\n\r\n');if(h<0)return;const len=+/Content-Length: (\d+)/i.exec(buf.slice(0,h).toString())[1];if(buf.length<h+4+len)return;const m=JSON.parse(buf.slice(h+4,h+4+len).toString());buf=buf.slice(h+4+len);
 if(m.id&&pend[m.id]&&!m.method){pend[m.id](m.result);}
 else if(m.method==='textDocument/publishDiagnostics'){diags[m.params.uri]=m.params.diagnostics;}
 else if(m.id&&m.method){send({jsonrpc:'2.0',id:m.id,result:null});}}});
(async()=>{
 await req('initialize',{processId:process.pid,rootUri:null,capabilities:{},workspaceFolders:null});
 send({jsonrpc:'2.0',method:'initialized',params:{}});
 for(const f of files){const uri='file://'+path.resolve(f);send({jsonrpc:'2.0',method:'textDocument/didOpen',params:{textDocument:{uri,languageId:'sysml',version:1,text:fs.readFileSync(f,'utf8')}}});}
 await new Promise(r=>setTimeout(r,8000));
 for(const f of files){const d=diags['file://'+path.resolve(f)];console.log('==',f,d===undefined?'NO DIAGNOSTICS PUBLISHED':d.length+' diagnostics');
  for(const x of d||[])console.log(` L${x.range.start.line+1}:${x.range.start.character+1} sev${x.severity} ${x.message}`);}
 p.kill();process.exit(0);})();
