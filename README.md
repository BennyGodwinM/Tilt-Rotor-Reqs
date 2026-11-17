# Tilt-Rotor-Reqs

SysML v2 models for a twin-rotor tiltrotor UAV (GoPro on a nose gimbal, 30 min flight time, Part 107).

- `models/TiltrotorProgramModel.sysml`: top-level program and ten discipline programs, each with its requirements and review milestone.
- `models/TiltrotorVehicleRequirements.sysml`: aircraft requirements, traced to the program model.
- `models/AFRC_TiltrotorRequirementsDocument.sysml`: Armstrong-style requirements document (numbered paragraphs as aliases).
- `docker-compose.yml` runs SysON (web modeler) at http://localhost:8080 with PostgreSQL. In SysON, create a project and upload a `.sysml` file.
- `tools/lsp_check.js` parses files: `npm i sysml-v2-lsp`, then `node tools/lsp_check.js models/*.sysml`.

## Configuration management

Git is the record. Baselines are tags: `baseline-srr`, `baseline-pdr`, `baseline-cdr`, `baseline-sir`, `baseline-orr`. Changes go on a branch and merge by pull request after review (the change control board). Parse the models before each merge.

Revision A parses with no syntax errors. Not yet checked in SysON itself.

## Derived files (rev-C)

The two `.sysml` models are the source. `python3 tools/derive.py` regenerates the Armstrong chapters 3 and 4, `docs/verification_matrix.md` and `docs/tbd_register.md`; `--check` only reports counts. `tools/req_meta.py` holds the basis, source and rationale of each program requirement and `tools/annotate.py` writes them into the model.

## Website

`python3 tools/derive.py && python3 tools/site.py` builds `docs/index.html`, a single self-contained page. To publish with GitHub Pages: Settings, Pages, deploy from branch `main`, folder `/docs`.
