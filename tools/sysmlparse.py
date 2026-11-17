import re

def blocks(t):
    """Parse nested requirement usages into a flat list of dicts with path, doc, attrs."""
    out=[];stack=[]  # (name,depth)
    pat=re.compile(r"requirement <'([\w.-]+)'> (\w+) : \w+ \{")
    i=0
    for m in pat.finditer(t):
        # find matching close brace
        d=1;j=m.end()
        while d:
            c=t[j]; d+= (c=='{')-(c=='}'); j+=1
        body=t[m.end():j-1]
        head=re.sub(r"requirement <.*",'',body,flags=re.S) # text before first nested requirement
        doc=re.search(r"doc /\* (.*?) \*/",head,re.S).group(1).strip()
        attrs={}
        for a in re.finditer(r"attribute (?::>> )?(\w+)(?: *: *\w+)?(?: *= *(?:\"([^\"]*)\"|(\w+::\w+)|([-\d.eE]+)))?;",head):
            attrs[a.group(1)]=a.group(2) or a.group(3) or a.group(4)
        out.append(dict(id=m.group(1),name=m.group(2),start=m.start(),end=j,doc=doc,attrs=attrs))
    for b in out:
        b['parent']=None
        for c in out:
            if c is not b and c['start']<b['start']<c['end'] and (b['parent'] is None or c['start']>b['parent']['start']): b['parent']=c
    for b in out:
        path=[];c=b
        while c: path.append(c['name']);c=c['parent']
        b['path']='::'.join(reversed(path))
    return out
def num(i): return [int(x) if x.isdigit() else x for x in re.split(r'[-.]',i)[1:]]
