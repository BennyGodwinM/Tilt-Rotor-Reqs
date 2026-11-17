import re,sys
sys.path.insert(0,'tools')
from req_meta import M,OWN
p='models/TiltrotorProgramModel.sysml'
t=open(p).read()
if 'Basis' not in t:
    t=t.replace("    requirement def ProgramRequirement {\n        attribute milestone : Milestone;\n    }",
"""    // Where a requirement comes from. placeholder means the value needs a decision before baselining.
    enum def Basis { enum directive; enum adoptedDefault; enum projectChoice; enum placeholder; }
    enum def Discipline { enum systemsEngineering; enum aerodynamics; enum loads; enum structures; enum structuralIntegrity; enum rotorEffects; enum flutter; enum flightTest; enum safetyOfFlight; enum configurationManagement; }

    requirement def ProgramRequirement {
        attribute milestone : Milestone;
        attribute basis : Basis;
        attribute owner : Discipline;
        attribute source : String;
        attribute rationale : String;
    }""")
def sub(m):
    i=m.group(1)
    if i not in M or ':>> basis' in t[m.end():m.end()+400].split('requirement <')[0]: return m.group(0)
    b,s,r=M[i]; ind=m.group(2)
    return (m.group(0)+f'\n{ind}attribute :>> basis = Basis::{b};\n{ind}attribute :>> owner = Discipline::{OWN[i.split("-")[0]]};'
            f'\n{ind}attribute :>> source = "{s}";\n{ind}attribute :>> rationale = "{r}";')
t=re.sub(r"requirement <'([A-Z]+-\d+)'> \w+ : ProgramRequirement \{\n(\s*)doc /\*.*?\*/",sub,t,flags=re.S)
open(p,'w').write(t)
