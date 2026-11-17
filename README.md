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

## SysML views

`python3 tools/views.py` writes the diagrams to `docs/views.md` (GitHub renders them), `docs/views/*.mmd`, the traceability matrix, and the impact graph to `docs/impact.json` and `docs/impact.md`. Views: block definition, internal block (ports and connections), requirements with satisfy and verify links, flight-mode state machine, endurance constraint (parametric), and program structure. The parts, ports and connections in the vehicle model are a proposed architecture to confirm.

## Using SysON

SysON is the graphical modeler for the same `.sysml` files. Git stays the record; SysON is for browsing and editing diagrams.

1. `docker compose up -d`, then open http://localhost:8080 (first start takes about a minute).
2. Create a project from the SysMLv2 template.
3. In the project, use the explorer's upload action (Upload Model) and select the three files in `models/`, program model first.
4. Add a General View or Interconnection View on the model to see block and interconnection diagrams, and use the explorer to follow requirement relationships.
5. Export edited text back into `models/` and commit; then run `tools/derive.py`, `tools/views.py` and `tools/site.py`.

Status: the stack starts and its project API answers, but I could not load the models into it automatically. The upload call returned a generic server error even for a one-line file, so I have not confirmed that SysON accepts these files, and I have not seen how it shows the paragraph-number aliases. Report any load error and I will adjust the models.

## Decomposition (vehicle requirements below the top level)

`models/TiltrotorVehicleDecomposition.sysml` holds 394 atomic requirements, nested under the requirement each one refines, with a `dependency` to its vehicle-level parent. **Do not edit it by hand.** It is generated:

1. Edit the rows in `tools/decomp/*.txt` (`ID|parent|name|text|verify|phase|basis|rationale`; verify is T, A, D or I).
2. Run `python3 tools/gen_decomp.py` to write the model and `docs/checklists.md`.
3. Run `python3 tools/derive_decomp.py` to write `docs/decomposition_matrix.md`, `decomposition_tbd.md`, `decomposition_outline.md` and `decomposition_summary.json`.

Rules: one "shall" per row; a number you cannot derive is written `[TBD]` with basis `placeholder`; a row's parent must exist. Checklist items in `tools/decomp/checklists.csv` must trace to a requirement ID.

## Loading into SysON

`docker compose up -d`, then `python3 tools/load_syson.py` creates a fresh project, loads the four models in order and removes older projects. SysON starts with an empty database each time the stack is recreated. Expect three unresolved-name warnings from `EnduranceConstraint`; they do not affect the requirements.
