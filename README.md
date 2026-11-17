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
