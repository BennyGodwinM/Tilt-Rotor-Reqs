#!/usr/bin/env python3
"""Load the four models into a fresh SysON project on localhost:8080 and delete older projects.
Start SysON first (docker compose up -d). Run from the repo root: python3 tools/load_syson.py"""
import json, urllib.request, uuid, collections
B = "http://localhost:8080"
def g(q, v=None):
    r = urllib.request.Request(B + "/api/graphql", json.dumps({"query": q, "variables": v or {}}).encode(), {"content-type": "application/json"})
    return json.load(urllib.request.urlopen(r))
def rest(path): return json.load(urllib.request.urlopen(B + path))
old = [e['@id'] for e in rest("/api/rest/projects")]
pid = g("mutation($i:CreateProjectInput!){createProject(input:$i){__typename ... on CreateProjectSuccessPayload{project{id}}}}",
        {"i": {"id": str(uuid.uuid4()), "name": "Tiltrotor UAV", "templateId": "sysmlv2-template", "libraryIds": []}})['data']['createProject']['project']['id']
ec = g('{viewer{project(projectId:"%s"){currentEditingContext{id}}}}' % pid)['data']['viewer']['project']['currentEditingContext']['id']
root = [e['@id'] for e in rest("/api/rest/projects/%s/commits/%s/elements" % (pid, pid)) if e['@type'] == 'Package'][0]
for f in ['TiltrotorProgramModel', 'TiltrotorVehicleRequirements', 'TiltrotorVehicleDecomposition', 'AFRC_TiltrotorRequirementsDocument']:
    p = g("mutation($i:InsertTextualSysMLv2Input!){insertTextualSysMLv2(input:$i){__typename ... on SuccessPayload{messages{body}}}}",
          {"i": {"id": str(uuid.uuid4()), "editingContextId": ec, "objectId": root, "textualContent": open('models/%s.sysml' % f).read()}})['data']['insertTextualSysMLv2']
    print(f, p['__typename'], [m['body'][:110] for m in p.get('messages', [])][:5])
for o in old:
    g("mutation($i:DeleteProjectInput!){deleteProject(input:$i){__typename}}", {"i": {"id": str(uuid.uuid4()), "projectId": o}})
els = rest("/api/rest/projects/%s/commits/%s/elements" % (pid, pid))
c = collections.Counter(e['@type'] for e in els)
print(len(els), {k: c[k] for k in ('RequirementUsage', 'ConnectionUsage', 'PortUsage', 'PartUsage', 'SatisfyRequirementUsage', 'Dependency')})
