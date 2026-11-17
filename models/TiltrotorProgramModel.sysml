package TiltrotorProgramModel {
    private import ScalarValues::*;

    enum def Milestone { enum SRR; enum PDR; enum CDR; enum SIR; enum ORR; enum PostFlight; }

    // Where a requirement comes from. placeholder means the value needs a decision before baselining.
    enum def Basis { enum directive; enum adoptedDefault; enum projectChoice; enum placeholder; }
    enum def Discipline { enum systemsEngineering; enum aerodynamics; enum loads; enum structures; enum structuralIntegrity; enum rotorEffects; enum flutter; enum flightTest; enum safetyOfFlight; enum configurationManagement; }

    requirement def ProgramRequirement {
        attribute milestone : Milestone;
        attribute basis : Basis;
        attribute owner : Discipline;
        attribute source : String;
        attribute rationale : String;
    }

    // Hazard scales. Severity III is called minor for human safety and moderate for asset or mission loss.
    enum def HazardSeverity { enum catastrophic; enum critical; enum minor; enum negligible; }

    // Probability classes: A expected (over 1e-1), B probable (1e-1 to 1e-2), C likely (1e-2 to 1e-3), D unlikely (1e-3 to 1e-6), E improbable (under 1e-6)
    enum def HazardProbability { enum expected; enum probable; enum likely; enum unlikely; enum improbable; }

    part def DisciplineProgram { attribute wbsCode : String; }

    part tiltrotorProgram {
        part systemsEngineering : DisciplineProgram { attribute :>> wbsCode = "1.1"; }
        part aerodynamics : DisciplineProgram { attribute :>> wbsCode = "1.2"; }
        part loads : DisciplineProgram { attribute :>> wbsCode = "1.3"; }
        part structures : DisciplineProgram { attribute :>> wbsCode = "1.4"; }
        part structuralIntegrity : DisciplineProgram { attribute :>> wbsCode = "1.5"; }
        part rotorEffects : DisciplineProgram { attribute :>> wbsCode = "1.6"; }
        part flutter : DisciplineProgram { attribute :>> wbsCode = "1.7"; }
        part flightTest : DisciplineProgram { attribute :>> wbsCode = "1.8"; }
        part safetyOfFlight : DisciplineProgram { attribute :>> wbsCode = "1.9"; }
        part configurationManagement : DisciplineProgram { attribute :>> wbsCode = "1.10"; }
    }

    requirement <'PRG-0'> programReqs : ProgramRequirement {
        doc /* The tiltrotor program shall reach ORR with every discipline deliverable released and baselined. */
        attribute :>> milestone = Milestone::ORR;

        requirement <'SE-0'> seReqs : ProgramRequirement {
            doc /* Systems engineering: requirements, conceptual design, trade studies. */
            requirement <'SE-5'> standardsTailoring : ProgramRequirement {
                doc /* Design standards shall be chosen for the aircraft, and any relaxation shall be recorded with its rationale, such as real-time monitoring or operating limits. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20150022108";
                attribute :>> rationale = "Relaxing a standard without a record hides risk from later reviewers.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-1'> semp : ProgramRequirement {
                doc /* A systems engineering management plan, or equivalent, shall be signed off before SRR. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Sets the plan every discipline works to; needed before SRR so requirements are written once.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-2'> trades : ProgramRequirement {
                doc /* Conceptual design and trade studies shall be documented and shall recommend one configuration. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "Records why this tiltrotor layout was picked over alternatives.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-3'> vvPlan : ProgramRequirement {
                doc /* The verification and validation plan shall be baselined. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Every requirement needs a closing method and a baseline to close it against.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SE-9'> criticalTechnologies : ProgramRequirement {
                doc /* New technologies the aircraft needs, such as the tilt mechanism, conversion control and the nose gimbal, shall be identified as critical technology elements and agreed with the approving authority, and an initial technology readiness assessment shall record the readiness level of each. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20205003605";
                attribute :>> rationale = "New technology is where schedule and performance surprises come from.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-10'> readinessLevel : ProgramRequirement {
                doc /* Each critical technology element shall reach the readiness level below by PDR, the readiness of any assembly shall not be rated above its least mature element, and the assessment shall be updated at PDR. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20205003605";
                attribute :>> rationale = "TRL 6 at PDR is the common gate before committing to detailed design.";
                attribute requiredTrl : Real = 6;
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-11'> predictBeforeTest : ProgramRequirement {
                doc /* Analysis predictions shall be recorded before each development test, and a test result outside the predicted uncertainty shall have its variance explained and its root cause reviewed. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "A prediction written after the test cannot show the model was wrong.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SE-12'> requirementForm : ProgramRequirement {
                doc /* Each requirement shall be a complete statement with one shall, a quantitative measure where it states performance, and a recorded rationale that gives the reason, assumptions and link to the concept of operations. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "A requirement without one shall, a number and a rationale cannot be verified.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-13'> requirementValidation : ProgramRequirement {
                doc /* Requirements shall be validated before baselining: written to the form in SE-12, technically correct with bidirectional traceability, accepted by stakeholders, feasible, verifiable, and neither redundant nor over-specified. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "Errors found at baselining cost far less than errors found at test.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-14'> drivingRequirements : ProgramRequirement {
                doc /* Key driving requirements, those that would move cost or schedule by more than the amount the chief engineer sets, shall be identified, and technical performance measures shall be tracked against planned values at each review. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "Driving requirements need early management attention.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-15'> systemOverview : ProgramRequirement {
                doc /* The system overview shall be written before requirements: a synopsis, the operating contexts, a context diagram, the external entities and the preliminary system goals, and it shall be kept current. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "Goals and contexts written first keep later requirements tied to why the aircraft exists.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-16'> systemBoundary : ProgramRequirement {
                doc /* The system boundary shall be defined early as the monitored variables the aircraft senses, the controlled variables it commands and the environmental variables it must tolerate, each with type, range, precision and units, and every physical interface shall be defined. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "A fixed boundary says what the requirements may and may not talk about.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-17'> operationalConcepts : ProgramRequirement {
                doc /* Operational concepts shall be written as use cases titled by their goal and traced to system goals, each with a primary actor, preconditions and postconditions, normal flow first, then exception cases and alternate courses, and without operator interface details. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "Use cases expose missing functions before design hardens.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-18'> environmentalAssumptions : ProgramRequirement {
                doc /* Each environmental assumption shall state type, range, precision and units, shall carry its rationale, and shall be grouped by the entity it constrains. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "An unstated assumption is a hidden requirement on the environment.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-19'> modeLogic : ProgramRequirement {
                doc /* Major flight modes and the transitions between them shall be identified, including any mode added for a discontinuity the pilot can see. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "The tilt conversion changes behavior sharply and needs explicit modes.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-20'> detailedRequirementForm : ProgramRequirement {
                doc /* Each controlled variable shall be specified as a condition and an assigned value, with its latency and tolerance, and the set shall be complete, consistent and free of duplication; latency and tolerance shall not be set on internal variables. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "Specifying outputs with conditions makes gaps and overlaps findable.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-21'> derivedRequirements : ProgramRequirement {
                doc /* Each design decision that constrains the design further shall be flagged as a derived requirement, and its latency and accuracy shall be confirmed against the top-level values. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "Derived requirements must be visible to the owners of the level above.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-22'> allocationToSubsystems : ProgramRequirement {
                doc /* When requirements are allocated to a subsystem, the subsystem shall have its own overview, monitored and controlled variables and operational concept, shared assumptions shall be identified, and latencies and tolerances shall be consistent with the system level. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "FAA DOT/FAA/AR-08/32";
                attribute :>> rationale = "Allocation without a boundary at each level loses accuracy and timing budget.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-23'> workBreakdownStructure : ProgramRequirement {
                doc /* One product-oriented work breakdown structure shall cover the whole scope of work, including enabling work such as project management and safety, shall be drafted as early as project definition allows, and shall be changed only by formal approval after it is baselined. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SP-2010-3404";
                attribute :>> rationale = "Work outside the structure goes unplanned, and a second structure splits cost and technical tracking.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-24'> wbsDictionary : ProgramRequirement {
                doc /* A work breakdown structure dictionary shall define each element with its title, code, content, interfaces, associated specification and revision history, shall be clear enough to remove overlap between elements, and shall be a baselined controlled document. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SP-2010-3404";
                attribute :>> rationale = "A dictionary entry is what keeps two disciplines from each assuming the other does a task.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-25'> verificationMatrix : ProgramRequirement {
                doc /* A verification matrix shall list every shall statement by unique identifier, source document and paragraph, with its success criteria, method, facility or laboratory, phase, and whether it is also checked at acceptance and before each flight. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SP-2016-6105";
                attribute :>> rationale = "Only a statement with a stated way to close it can be verified.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-26'> performanceMeasures : ProgramRequirement {
                doc /* Measures of effectiveness shall be derived from the goals, measures of performance from those, and the technical performance measures that matter to flight success shall be tracked against their planned values at each review. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SP-2016-6105";
                attribute :>> rationale = "Tracking planned against actual performance shows trouble before the next review.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-27'> requirementQuality : ProgramRequirement {
                doc /* Each requirement shall be checked before baselining for: active form, a stated tolerance, no implementation, positive wording, no unverifiable terms, and traceability up to a parent and down to a verification; TBD values shall be kept few, each with a best estimate, an owner and a closing review. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SP-2016-6105";
                attribute :>> rationale = "The checklist catches vague words and open values while they are cheap to fix.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-4'> integrationPlan : ProgramRequirement {
                doc /* The integration plan shall be updated. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "Interfaces between disciplines drift unless a plan is kept current.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'SE-6'> technicalAssessment : ProgramRequirement {
                doc /* The project chief engineer shall assess technical performance against design allocations, margins and trades every month, and shall report the assessment to the approving authority. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20120014193";
                attribute :>> rationale = "The chief engineer owns technical performance and must see it measured.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-7'> riskBasedInsight : ProgramRequirement {
                doc /* The program shall apply a risk-based method to set how deeply each discipline program is independently reviewed, and the top technical risks shall be reported with each monthly assessment. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20120014193";
                attribute :>> rationale = "Review depth scales with risk so effort goes where failure costs most.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-8'> issueEscalation : ProgramRequirement {
                doc /* Technical issues shall go up the chief engineer chain without filtering, and late-breaking or potential issues shall be briefed to the approving authority before the next review. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::systemsEngineering;
                attribute :>> source = "NTRS 20120014193";
                attribute :>> rationale = "Unfiltered escalation stops technical issues being softened on the way up.";
                attribute :>> milestone = Milestone::SRR;
            }
        }

        requirement <'AER-0'> aerodynamicsReqs : ProgramRequirement {
            doc /* Aerodynamics program deliverables. */
            requirement <'AER-11'> sensorErrors : ProgramRequirement {
                doc /* The effect of sensor errors on the derived quantity, such as pressure error on angle of attack, shall be analyzed, and temperature and tubing lag effects shall be accounted for. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Sensor error propagates into every derived coefficient.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'AER-12'> parameterEstimation : ProgramRequirement {
                doc /* Aerodynamic parameters shall be estimated with more than one technique, the differences shall be reviewed for data errors, and reported uncertainties shall be treated as lower bounds. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Agreement between techniques is the check on each one.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'AER-13'> flightDataArchive : ProgramRequirement {
                doc /* Flight data shall be archived with metadata, and the steps that convert raw data to engineering data shall be documented. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Flight data without metadata cannot be reused.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'AER-14'> codeCrossCheck : ProgramRequirement {
                doc /* Two independent CFD codes shall be compared before the production database runs, and each run shall be converged to the drag tolerance below. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Two codes agreeing guards against a single-code error; the drag tolerance is a starting value.";
                attribute dragStdDev : Real = 1e-5;
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-3'> modelRecord : ProgramRequirement {
                doc /* The aerodynamic model shall carry uncertainties, state its axis system, document its limits of use and data sources, and be kept under version control. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Users of the model need uncertainty and axes to apply it correctly.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-4'> cfdSetup : ProgramRequirement {
                doc /* CFD shall use one defined coordinate system and sign convention, validated codes, and grid independence studies on the most complex geometry and flow. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Sign and axis errors are a common cause of wrong results.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-5'> cadCheck : ProgramRequirement {
                doc /* The CAD model used for CFD shall be checked against measurements or photographs of the as-built aircraft. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "CFD on wrong geometry gives precise but wrong answers.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'AER-6'> cfdArchive : ProgramRequirement {
                doc /* The CAD models, grids, solver settings, scripts, solutions and code versions used in airworthiness reviews shall be archived. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Results cannot be reproduced without the inputs and code versions.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'AER-7'> instrumentation : ProgramRequirement {
                doc /* Aerodynamic instrumentation shall be defined early from the project objectives, with sensors sized and calibrated for the full envelope and the worst local environment, and with spare capacity. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Instrumentation added late rarely covers the flight objectives.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-8'> airData : ProgramRequirement {
                doc /* Air data accuracy requirements shall be stated before the air data system is designed, and an in-flight calibration shall be planned. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Air data accuracy limits every derived aerodynamic quantity.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-9'> instrumentCheck : ProgramRequirement {
                doc /* Sensor locations, labels and calibrations shall be checked twice before the flight campaign, and the instrumentation kept under configuration control. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Swapped or mislabeled sensors have lost flight data before.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'AER-10'> aeroFlightValidation : ProgramRequirement {
                doc /* The pre-flight aerodynamic model and its uncertainties shall be validated against flight data during envelope expansion, using more than one parameter estimation method, and updated as needed. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Flight data is the check on the pre-flight model.";
                attribute :>> milestone = Milestone::PostFlight;
            }
            requirement <'AER-1'> aeroDatabase : ProgramRequirement {
                doc /* An aerodynamic database covering hover, conversion and cruise shall be released. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "Hover, conversion and cruise are different aerodynamic regimes.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-2'> aeroUpdate : ProgramRequirement {
                doc /* The database shall be updated with the latest CFD and test data and re-released. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::aerodynamics;
                attribute :>> source = "NTRS 20230009292";
                attribute :>> rationale = "The database must follow the latest CFD and test data to stay usable by loads and flutter.";
                attribute :>> milestone = Milestone::CDR;
            }
        }

        requirement <'LDS-0'> loadsReqs : ProgramRequirement {
            doc /* Loads program deliverables: aero loads, inertial loads, load releases. */
            requirement <'LDS-1'> prelimLoads : ProgramRequirement {
                doc /* Aerodynamic and inertial loads shall be released as a preliminary loads set. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Structures needs preliminary loads to size primary structure.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'LDS-7'> modelQuality : ProgramRequirement {
                doc /* Finite element and dynamic models shall use one consistent unit system and a right-handed coordinate system, and the model mass and center of gravity shall be checked against the actual article. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20020085101";
                attribute :>> rationale = "Mixed units in structural models have caused major losses.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'LDS-2'> finalLoads : ProgramRequirement {
                doc /* Limit and ultimate loads shall be released for flight and ground conditions under revision control. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Limit and ultimate loads close the design load cases.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'LDS-3'> modelAssumptions : ProgramRequirement {
                doc /* Modeling assumptions that change results, such as whether the rotor and nacelle motion is inside or outside the structural modes, shall be documented and shared by the loads, structures and flutter programs. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Modeling assumptions that change results must be visible to the next user.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'LDS-4'> datasetChecks : ProgramRequirement {
                doc /* Sanity checks shall be run on each structural dataset before it is delivered to a downstream user. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Datasets passed between teams carry silent unit and format errors.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'LDS-5'> modalData : ProgramRequirement {
                doc /* Modal data shall keep double precision, and mode shapes shall be mass-normalized so that the transpose of the mode shape matrix times the mass matrix times the mode shape matrix equals the identity matrix. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Single precision and unnormalized shapes corrupt modal data.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'LDS-6'> toolchainChecks : ProgramRequirement {
                doc /* Regression tests shall exercise the finite element to dynamics model toolchain, and any modal-integral implementation shall be checked against an independent model, with accelerations agreeing within the tolerance below. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::loads;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Regression tests catch toolchain changes that move results; tolerance is a starting value.";
                attribute accelerationTolerance : Real = 1e-8;
                attribute :>> milestone = Milestone::CDR;
            }
        }

        requirement <'STR-0'> structuresReqs : ProgramRequirement {
            doc /* Aircraft structures program deliverables. */
            requirement <'STR-3'> staticApproach : ProgramRequirement {
                doc /* One static-strength approach shall be selected and documented: no test and no data, test and data, test and no data, or a justified alternative, with an ultimate factor of safety that fits the approach. The factor below is a placeholder until the project selects. */
                attribute :>> basis = Basis::placeholder;
                attribute :>> owner = Discipline::structures;
                attribute :>> source = "NTRS 20170005546";
                attribute :>> rationale = "The factor of safety sets structural mass; 2.25 is a stand-in until the chief engineer chooses.";
                attribute ultimateFactor : Real = 2.25;
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'STR-4'> flightLoadLimit : ProgramRequirement {
                doc /* The flight envelope shall be limited to the fraction of limit load that the selected approach supports, and where the aircraft is the proof article it shall be fully instrumented and calibrated. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::structures;
                attribute :>> source = "NTRS 20170005546";
                attribute :>> rationale = "A limited envelope can substitute for a test where the structure is untested to ultimate.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'STR-1'> stressNotes : ProgramRequirement {
                doc /* Stress notes shall show margins of safety for all primary structure. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::structures;
                attribute :>> source = "NTRS 20170005546";
                attribute :>> rationale = "Margins of safety are the structural closure record.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'STR-2'> conformity : ProgramRequirement {
                doc /* The as-built structure shall be shown to conform to the released drawings. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::structures;
                attribute :>> source = "NTRS 20170005546";
                attribute :>> rationale = "Analysis applies only to the structure as built.";
                attribute :>> milestone = Milestone::SIR;
            }
        }

        requirement <'SIN-0'> structuralIntegrityReqs : ProgramRequirement {
            doc /* Aircraft structural integrity program deliverables. */
            requirement <'SIN-3'> compositeBuildingBlock : ProgramRequirement {
                doc /* Composite structure shall be substantiated by a building-block approach: coupon tests, then design-feature tests, then proof loading on the aircraft, with a factor of safety of 3.0 on secondary structure of unproven equivalence. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::structuralIntegrity;
                attribute :>> source = "NTRS 20190000385";
                attribute :>> rationale = "Composite strength is shown by building up from coupons to the article; verify factor.";
                attribute secondaryFactor : Real = 3.0;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SIN-4'> proofLoad : ProgramRequirement {
                doc /* Where the aircraft is the proof-test article, the proof load shall be applied and its results compared with analysis before first flight. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::structuralIntegrity;
                attribute :>> source = "NTRS 20190000385";
                attribute :>> rationale = "A proof load that damages the flight article defeats its purpose.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'SIN-5'> inspectionInterval : ProgramRequirement {
                doc /* Inspection intervals shall be set from fatigue-crack growth analysis so that the smallest crack the inspection method can detect cannot grow to failure within the interval, and the interval shall reflect each aircraft's actual usage. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::structuralIntegrity;
                attribute :>> source = "NTRS 19710021280";
                attribute :>> rationale = "Inspection intervals need a crack-growth basis, not a guess.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'SIN-1'> criteria : ProgramRequirement {
                doc /* Structural design criteria shall be defined: factors of safety, load cases and fatigue approach. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::structuralIntegrity;
                attribute :>> source = "NTRS 20190000385";
                attribute :>> rationale = "Criteria fix the factors and load cases everything else is checked against.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SIN-2'> groundTest : ProgramRequirement {
                doc /* A structural ground test shall verify the design before flight. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::structuralIntegrity;
                attribute :>> source = "NTRS 20190000385";
                attribute :>> rationale = "Ground test finds structural problems before flight.";
                attribute :>> milestone = Milestone::SIR;
            }
        }

        requirement <'ROT-0'> rotorEffectsReqs : ProgramRequirement {
            doc /* Rotor effects program deliverables. */
            requirement <'ROT-1'> rotorLoads : ProgramRequirement {
                doc /* Rotor loads and rotor-induced aerodynamic effects shall be characterised for the loads and aerodynamics programs. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::rotorEffects;
                attribute :>> source = "NTRS 20205011606";
                attribute :>> rationale = "Rotor loads drive nacelle, wing and flutter results.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'ROT-2'> rotorDynamics : ProgramRequirement {
                doc /* A rotor and nacelle dynamics model shall be released to the flutter program. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::rotorEffects;
                attribute :>> source = "NTRS 20205011606";
                attribute :>> rationale = "Flutter needs a rotor and nacelle model with stated assumptions.";
                attribute :>> milestone = Milestone::CDR;
            }
        }

        requirement <'FLU-0'> flutterReqs : ProgramRequirement {
            doc /* Flutter and whirl flutter program deliverables. */
            requirement <'FLU-1'> instabilities : ProgramRequirement {
                doc /* The aeroelastic instabilities likely in the flight envelope, including whirl flutter, shall be identified, and any excluded shall be recorded with the reason. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Whirl flutter is the instability specific to tilting rotors.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-2'> approach : ProgramRequirement {
                doc /* Flutter clearance shall use flutter analysis, ground vibration test and flight flutter test, because the aircraft is new. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "No single method clears flutter; analysis, GVT and flight test support each other.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-3'> femModel : ProgramRequirement {
                doc /* A finite element model of the airframe, rotors and nacelles shall be built and its modes calculated; an equivalent-beam model is the minimum. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Flutter analysis needs a model of airframe, rotors and nacelles together.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-5'> aseMargins : ProgramRequirement {
                doc /* Every feedback loop of the flight control system shall have at least the gain and phase margins below. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Control loops can couple with structure; 8 dB and 60 degrees are starting values.";
                attribute gainMarginDb : Real = 8;
                attribute phaseMarginDeg : Real = 60;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'FLU-6'> massProps : ProgramRequirement {
                doc /* Weight, centre of gravity and moments of inertia shall be measured to correlate the model. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Mass properties feed the model; measured values beat estimates.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FLU-8'> femCorrelation : ProgramRequirement {
                doc /* The model shall be correlated to the ground vibration test: frequency error on significant modes at most the first limit below, and off-diagonal orthogonality terms at most the second. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "An uncorrelated model cannot predict flutter; 5 percent and 0.1 are starting values.";
                attribute frequencyErrorPercent : Real = 5;
                attribute orthogonalityLimit : Real = 0.1;
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FLU-9'> finalFlutter : ProgramRequirement {
                doc /* If the structural or aerodynamic model was updated, the flutter analysis shall be repeated at the key flight points. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Flutter results go stale when the model changes.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FLU-10'> flightFlutterPlan : ProgramRequirement {
                doc /* A flight flutter test plan shall define the instrumentation, build-up test points and real-time monitoring with test point clearance. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "A flutter flight test needs a plan with build-up and abort criteria.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'FLU-11'> flightFlutterTest : ProgramRequirement {
                doc /* Flight flutter testing shall show no instability within the flight envelope, and the models shall be correlated to flight data. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Flight is the last check that no instability exists in the envelope.";
                attribute :>> milestone = Milestone::PostFlight;
            }
            requirement <'FLU-12'> nacelleModal : ProgramRequirement {
                doc /* Where body inertia changes with deformation or the nacelle rotates, modal integrals shall be included, and results with and without them shall be compared side by side. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "A rotating nacelle changes the modes with tilt angle.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-13'> modelSensitivity : ProgramRequirement {
                doc /* Uncertain model parameters shall be varied to bound the flutter envelope, a margin of at least the largeMarginPercent value shall be confirmed under all variations, and critical parameter combinations shall be identified. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Uncertain parameters bound the envelope instead of hiding in one run.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-14'> testRelief : ProgramRequirement {
                doc /* Flight flutter testing shall be omitted only where the margin on a high-confidence model exceeds the value below, and the omission shall be recorded as a deviation. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "Testing can be skipped only with a large margin; 100 percent is a starting value.";
                attribute largeMarginPercent : Real = 100;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'FLU-4'> prelimFlutter : ProgramRequirement {
                doc /* A preliminary flutter analysis at the key flight points, including whirl flutter across the conversion corridor, shall show at least the margin below on equivalent airspeed and Mach number. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "A margin on flutter speed covers model error; 15 percent is a starting value.";
                attribute marginPercent : Real = 15;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'FLU-7'> gvt : ProgramRequirement {
                doc /* A ground vibration test shall measure mode shapes, frequencies and damping in every relevant configuration. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flutter;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "GVT gives the measured modes the model is correlated to.";
                attribute :>> milestone = Milestone::SIR;
            }
        }

        requirement <'FTP-0'> flightTestReqs : ProgramRequirement {
            doc /* Flight test program deliverables. */
            requirement <'FTP-3'> simulation : ProgramRequirement {
                doc /* Flight maneuvers and test conditions shall be designed and practised in flight simulation before flight. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "Practice in simulation finds problems cheaply.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FTP-4'> envelopeExpansion : ProgramRequirement {
                doc /* The envelope expansion plan shall include a bail-out plan for the edges and corners of the envelope, and shall watch in flight for any cliffs found in CFD or wind tunnel data. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "Edge-of-envelope points need a planned way out.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'FTP-5'> techBrief : ProgramRequirement {
                doc /* A technical briefing shall close out all open items, peer review the plan and the current risks, and end with signed approval to fly. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "A briefing closes open items before the next flight.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'FTP-7'> instrumentationPlan : ProgramRequirement {
                doc /* Instrumentation shall be designed early, to show safety, experiment success and experiment failure, and its reliability and maintainability shall be planned for the full program. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "Instrumentation designed late rarely meets objectives.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FTP-6'> debrief : ProgramRequirement {
                doc /* Each flight shall be followed by a debrief, and discrepancies and results shall be documented and compared with predictions. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "Debrief captures discrepancies while memory is fresh.";
                attribute :>> milestone = Milestone::PostFlight;
            }
            requirement <'FTP-1'> testPlan : ProgramRequirement {
                doc /* A flight test plan and test cards shall be released. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "No test point flies without a released plan and card.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FTP-2'> readiness : ProgramRequirement {
                doc /* No flight shall start until the operational readiness review is closed. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::flightTest;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Flight starts only after the operational readiness review closes.";
                attribute :>> milestone = Milestone::ORR;
            }
        }

        requirement <'SOF-0'> safetyOfFlightReqs : ProgramRequirement {
            doc /* Safety of flight program deliverables. */
            requirement <'SOF-3'> hazardManagement : ProgramRequirement {
                doc /* Hazards shall be identified, evaluated for cause and effect, and scored for severity and probability on the hazard scales, with mitigations recorded, and the analysis kept current through the life cycle. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Severity and probability scoring gives a common risk language.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-4'> riskAcceptance : ProgramRequirement {
                doc /* No human-safety risk shall be accepted by the project team; any exception needs a recorded decision by the approving authority named in the configuration management plan. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Human-safety risk is not the project team's to accept.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SOF-5'> reviewLevel : ProgramRequirement {
                doc /* The level of independent review shall be chosen to match the complexity, criticality and risk of the flights, and the choice recorded. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Review level should match complexity and risk.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-6'> independentReview : ProgramRequirement {
                doc /* A flight readiness review by reviewers outside the project team shall examine the analyses, procedures, hazard analyses and qualification results, and the project shall respond to each finding. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Reviewers outside the team give independent judgement.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-8'> lostLink : ProgramRequirement {
                doc /* A lost-link procedure shall be defined with a predesignated contingency landing site and verified in ground and flight test. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "NTRS 20205011606";
                attribute :>> rationale = "A lost link needs a pre-decided response; DAA and BVLOS are not modelled.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-9'> hazardStandard : ProgramRequirement {
                doc /* The hazard analysis shall follow ASTM F3178-16, which the NASA memo cites for small unmanned aircraft under 55 pounds. */
                attribute :>> basis = Basis::placeholder;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "NTRS 20205011606";
                attribute :>> rationale = "The cited ASTM F3178-16 came from a draft circular and must be checked.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-10'> pilotOverride : ProgramRequirement {
                doc /* The remote pilot shall be able to command or override the vehicle at all times. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "NTRS 20205011606";
                attribute :>> rationale = "The remote pilot must always be able to take control.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-7'> flightApproval : ProgramRequirement {
                doc /* A written recommendation quantifying residual risk, with accepted risks named, shall be signed by the approving authority before the first flight. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Approval needs a written statement of residual risk.";
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-1'> hazards : ProgramRequirement {
                doc /* A preliminary hazard analysis shall be completed. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Hazards must be known before a review can judge them.";
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-2'> sofReview : ProgramRequirement {
                doc /* A safety of flight review shall be completed with open items dispositioned. */
                attribute :>> basis = Basis::directive;
                attribute :>> owner = Discipline::safetyOfFlight;
                attribute :>> source = "AFPR";
                attribute :>> rationale = "Open hazard items need a recorded disposition.";
                attribute :>> milestone = Milestone::ORR;
            }
        }

        requirement <'CMG-0'> configurationManagementReqs : ProgramRequirement {
            doc /* Configuration management program deliverables. */
            requirement <'CMG-4'> asBuiltLink : ProgramRequirement {
                doc /* Design, analysis and manufacturing shall stay linked so that the as-built performance is confirmed against the analysis. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::configurationManagement;
                attribute :>> source = "NTRS 20170005548";
                attribute :>> rationale = "The as-built article must link back to design and analysis.";
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'CMG-5'> simControl : ProgramRequirement {
                doc /* Flight simulations shall be under version control as part of configuration control. */
                attribute :>> basis = Basis::adoptedDefault;
                attribute :>> owner = Discipline::configurationManagement;
                attribute :>> source = "NTRS 20170005549";
                attribute :>> rationale = "Simulation changes alter test planning, so they are configuration items.";
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'CMG-1'> cmp : ProgramRequirement {
                doc /* A configuration management plan shall be approved. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::configurationManagement;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "The plan states how baselines and changes are handled.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'CMG-2'> reqBaseline : ProgramRequirement {
                doc /* The requirements shall be baselined and changed only through change control. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::configurationManagement;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "An unbaselined requirement cannot be verified against.";
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'CMG-3'> designBaseline : ProgramRequirement {
                doc /* Document, load and data releases shall be recorded, and the design baselined. */
                attribute :>> basis = Basis::projectChoice;
                attribute :>> owner = Discipline::configurationManagement;
                attribute :>> source = "NASA SE Handbook 4.2";
                attribute :>> rationale = "Releases must be recorded to know what flew.";
                attribute :>> milestone = Milestone::CDR;
            }
        }
    }

    satisfy programReqs by tiltrotorProgram;
    satisfy programReqs::seReqs by tiltrotorProgram::systemsEngineering;
    satisfy programReqs::aerodynamicsReqs by tiltrotorProgram::aerodynamics;
    satisfy programReqs::loadsReqs by tiltrotorProgram::loads;
    satisfy programReqs::structuresReqs by tiltrotorProgram::structures;
    satisfy programReqs::structuralIntegrityReqs by tiltrotorProgram::structuralIntegrity;
    satisfy programReqs::rotorEffectsReqs by tiltrotorProgram::rotorEffects;
    satisfy programReqs::flutterReqs by tiltrotorProgram::flutter;
    satisfy programReqs::flightTestReqs by tiltrotorProgram::flightTest;
    satisfy programReqs::safetyOfFlightReqs by tiltrotorProgram::safetyOfFlight;
    satisfy programReqs::configurationManagementReqs by tiltrotorProgram::configurationManagement;
}
