package TiltrotorProgramModel {
    private import ScalarValues::*;

    enum def Milestone { enum SRR; enum PDR; enum CDR; enum SIR; enum ORR; enum PostFlight; }

    requirement def ProgramRequirement {
        attribute milestone : Milestone;
    }

    // Hazard scales. Severity III is called minor for human safety and moderate for asset or mission loss.
    enum def HazardSeverity { enum catastrophic; enum critical; enum minor; enum negligible; }

    // Probability classes: A expected (over 1e-1), B probable (1e-1 to 1e-2), C likely (1e-2 to 1e-3), D unlikely (1e-3 to 1e-6), E improbable (under 1e-6)
    enum def HazardProbability { enum expected; enum probable; enum likely; enum unlikely; enum improbable; }

    part def DisciplineProgram;

    part tiltrotorProgram {
        part systemsEngineering : DisciplineProgram;
        part aerodynamics : DisciplineProgram;
        part loads : DisciplineProgram;
        part structures : DisciplineProgram;
        part structuralIntegrity : DisciplineProgram;
        part rotorEffects : DisciplineProgram;
        part flutter : DisciplineProgram;
        part flightTest : DisciplineProgram;
        part safetyOfFlight : DisciplineProgram;
        part configurationManagement : DisciplineProgram;
    }

    requirement <'PRG-0'> programReqs : ProgramRequirement {
        doc /* The tiltrotor program shall reach ORR with every discipline deliverable released and baselined. */
        attribute :>> milestone = Milestone::ORR;

        requirement <'SE-0'> seReqs : ProgramRequirement {
            doc /* Systems engineering: requirements, conceptual design, trade studies. */
            requirement <'SE-5'> standardsTailoring : ProgramRequirement {
                doc /* Design standards shall be chosen for the aircraft, and any relaxation shall be recorded with its rationale, such as real-time monitoring or operating limits. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-1'> semp : ProgramRequirement {
                doc /* A systems engineering management plan, or equivalent, shall be signed off before SRR. */
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-2'> trades : ProgramRequirement {
                doc /* Conceptual design and trade studies shall be documented and shall recommend one configuration. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-3'> vvPlan : ProgramRequirement {
                doc /* The verification and validation plan shall be baselined. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SE-9'> criticalTechnologies : ProgramRequirement {
                doc /* New technologies the aircraft needs, such as the tilt mechanism, conversion control and the nose gimbal, shall be identified as critical technology elements and agreed with the approving authority, and an initial technology readiness assessment shall record the readiness level of each. */
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-10'> readinessLevel : ProgramRequirement {
                doc /* Each critical technology element shall reach the readiness level below by PDR, the readiness of any assembly shall not be rated above its least mature element, and the assessment shall be updated at PDR. */
                attribute requiredTrl : Real = 6;
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-11'> predictBeforeTest : ProgramRequirement {
                doc /* Analysis predictions shall be recorded before each development test, and a test result outside the predicted uncertainty shall have its variance explained and its root cause reviewed. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SE-4'> integrationPlan : ProgramRequirement {
                doc /* The integration plan shall be updated. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'SE-6'> technicalAssessment : ProgramRequirement {
                doc /* The project chief engineer shall assess technical performance against design allocations, margins and trades every month, and shall report the assessment to the approving authority. */
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'SE-7'> riskBasedInsight : ProgramRequirement {
                doc /* The program shall apply a risk-based method to set how deeply each discipline program is independently reviewed, and the top technical risks shall be reported with each monthly assessment. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SE-8'> issueEscalation : ProgramRequirement {
                doc /* Technical issues shall go up the chief engineer chain without filtering, and late-breaking or potential issues shall be briefed to the approving authority before the next review. */
                attribute :>> milestone = Milestone::SRR;
            }
        }

        requirement <'AER-0'> aerodynamicsReqs : ProgramRequirement {
            doc /* Aerodynamics program deliverables. */
            requirement <'AER-11'> sensorErrors : ProgramRequirement {
                doc /* The effect of sensor errors on the derived quantity, such as pressure error on angle of attack, shall be analyzed, and temperature and tubing lag effects shall be accounted for. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'AER-12'> parameterEstimation : ProgramRequirement {
                doc /* Aerodynamic parameters shall be estimated with more than one technique, the differences shall be reviewed for data errors, and reported uncertainties shall be treated as lower bounds. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'AER-13'> flightDataArchive : ProgramRequirement {
                doc /* Flight data shall be archived with metadata, and the steps that convert raw data to engineering data shall be documented. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'AER-14'> codeCrossCheck : ProgramRequirement {
                doc /* Two independent CFD codes shall be compared before the large-scale database runs, and each run shall be converged to the drag tolerance below. */
                attribute dragStdDev : Real = 1e-5;
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-3'> modelRecord : ProgramRequirement {
                doc /* The aerodynamic model shall carry uncertainties, state its axis system, document its limits of use and data sources, and be kept under version control. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-4'> cfdSetup : ProgramRequirement {
                doc /* CFD shall use one defined coordinate system and sign convention, validated codes, and grid independence studies on the most complex geometry and flow. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-5'> cadCheck : ProgramRequirement {
                doc /* The CAD model used for CFD shall be checked against measurements or photographs of the as-built aircraft. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'AER-6'> cfdArchive : ProgramRequirement {
                doc /* The CAD models, grids, solver settings, scripts, solutions and code versions used in airworthiness reviews shall be archived. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'AER-7'> instrumentation : ProgramRequirement {
                doc /* Aerodynamic instrumentation shall be defined early from the project objectives, with sensors sized and calibrated for the full envelope and the worst local environment, and with spare capacity. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-8'> airData : ProgramRequirement {
                doc /* Air data accuracy requirements shall be stated before the air data system is designed, and an in-flight calibration shall be planned. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-9'> instrumentCheck : ProgramRequirement {
                doc /* Sensor locations, labels and calibrations shall be checked twice before the flight campaign, and the instrumentation kept under configuration control. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'AER-10'> aeroFlightValidation : ProgramRequirement {
                doc /* The pre-flight aerodynamic model and its uncertainties shall be validated against flight data during envelope expansion, using more than one parameter estimation method, and updated as needed. */
                attribute :>> milestone = Milestone::PostFlight;
            }
            requirement <'AER-1'> aeroDatabase : ProgramRequirement {
                doc /* An aerodynamic database covering hover, conversion and cruise shall be released. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'AER-2'> aeroUpdate : ProgramRequirement {
                doc /* The database shall be updated with the latest CFD and test data and re-released. */
                attribute :>> milestone = Milestone::CDR;
            }
        }

        requirement <'LDS-0'> loadsReqs : ProgramRequirement {
            doc /* Loads program deliverables: aero loads, inertial loads, load releases. */
            requirement <'LDS-1'> prelimLoads : ProgramRequirement {
                doc /* Aerodynamic and inertial loads shall be released as a preliminary loads set. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'LDS-7'> modelQuality : ProgramRequirement {
                doc /* Finite element and dynamic models shall use one consistent unit system and a right-handed coordinate system, and the model mass and center of gravity shall be checked against the actual article. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'LDS-2'> finalLoads : ProgramRequirement {
                doc /* Limit and ultimate loads shall be released for flight and ground conditions under revision control. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'LDS-3'> modelAssumptions : ProgramRequirement {
                doc /* Modeling assumptions that change results, such as whether the rotor and nacelle motion is inside or outside the structural modes, shall be documented and shared by the loads, structures and flutter programs. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'LDS-4'> datasetChecks : ProgramRequirement {
                doc /* Sanity checks shall be run on each structural dataset before it is delivered to a downstream user. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'LDS-5'> modalData : ProgramRequirement {
                doc /* Modal data shall keep double precision, and mode shapes shall be mass-normalized so that the transpose of the mode shape matrix times the mass matrix times the mode shape matrix equals the identity matrix. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'LDS-6'> toolchainChecks : ProgramRequirement {
                doc /* Regression tests shall exercise the finite element to dynamics model toolchain, and any modal-integral implementation shall be checked against an independent model, with accelerations agreeing within the tolerance below. */
                attribute accelerationTolerance : Real = 1e-8;
                attribute :>> milestone = Milestone::CDR;
            }
        }

        requirement <'STR-0'> structuresReqs : ProgramRequirement {
            doc /* Aircraft structures program deliverables. */
            requirement <'STR-3'> staticApproach : ProgramRequirement {
                doc /* One static-strength approach shall be selected and documented: no test and no data, test and data, test and no data, or a justified alternative, with an ultimate factor of safety that fits the approach. The factor below is a placeholder until the project selects. */
                attribute ultimateFactor : Real = 2.25;
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'STR-4'> flightLoadLimit : ProgramRequirement {
                doc /* The flight envelope shall be limited to the fraction of limit load that the selected approach supports, and where the aircraft is the proof article it shall be fully instrumented and calibrated. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'STR-1'> stressNotes : ProgramRequirement {
                doc /* Stress notes shall show margins of safety for all primary structure. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'STR-2'> conformity : ProgramRequirement {
                doc /* The as-built structure shall be shown to conform to the released drawings. */
                attribute :>> milestone = Milestone::SIR;
            }
        }

        requirement <'SIN-0'> structuralIntegrityReqs : ProgramRequirement {
            doc /* Aircraft structural integrity program deliverables. */
            requirement <'SIN-3'> compositeBuildingBlock : ProgramRequirement {
                doc /* Composite structure shall be substantiated by a building-block approach: coupon tests, then design-feature tests, then proof loading on the aircraft, with a factor of safety of 3.0 on secondary structure of unproven equivalence. */
                attribute secondaryFactor : Real = 3.0;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SIN-4'> proofLoad : ProgramRequirement {
                doc /* Where the aircraft is the proof-test article, the proof load shall be applied and its results compared with analysis before first flight. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'SIN-1'> criteria : ProgramRequirement {
                doc /* Structural design criteria shall be defined: factors of safety, load cases and fatigue approach. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SIN-2'> groundTest : ProgramRequirement {
                doc /* A structural ground test shall verify the design before flight. */
                attribute :>> milestone = Milestone::SIR;
            }
        }

        requirement <'ROT-0'> rotorEffectsReqs : ProgramRequirement {
            doc /* Rotor effects program deliverables. */
            requirement <'ROT-1'> rotorLoads : ProgramRequirement {
                doc /* Rotor loads and rotor-induced aerodynamic effects shall be characterised for the loads and aerodynamics programs. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'ROT-2'> rotorDynamics : ProgramRequirement {
                doc /* A rotor and nacelle dynamics model shall be released to the flutter program. */
                attribute :>> milestone = Milestone::CDR;
            }
        }

        requirement <'FLU-0'> flutterReqs : ProgramRequirement {
            doc /* Flutter and whirl flutter program deliverables. */
            requirement <'FLU-1'> instabilities : ProgramRequirement {
                doc /* The aeroelastic instabilities likely in the flight envelope, including whirl flutter, shall be identified, and any excluded shall be recorded with the reason. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-2'> approach : ProgramRequirement {
                doc /* Flutter clearance shall use flutter analysis, ground vibration test and flight flutter test, because the aircraft is new. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-3'> femModel : ProgramRequirement {
                doc /* A finite element model of the airframe, rotors and nacelles shall be built and its modes calculated; an equivalent-beam model is the minimum. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-5'> aseMargins : ProgramRequirement {
                doc /* Every feedback loop of the flight control system shall have at least the gain and phase margins below. */
                attribute gainMarginDb : Real = 8;
                attribute phaseMarginDeg : Real = 60;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'FLU-6'> massProps : ProgramRequirement {
                doc /* Weight, centre of gravity and moments of inertia shall be measured to correlate the model. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FLU-8'> femCorrelation : ProgramRequirement {
                doc /* The model shall be correlated to the ground vibration test: frequency error on significant modes at most the first limit below, and off-diagonal orthogonality terms at most the second. */
                attribute frequencyErrorPercent : Real = 5;
                attribute orthogonalityLimit : Real = 0.1;
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FLU-9'> finalFlutter : ProgramRequirement {
                doc /* If the structural or aerodynamic model was updated, the flutter analysis shall be repeated at the key flight points. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FLU-10'> flightFlutterPlan : ProgramRequirement {
                doc /* A flight flutter test plan shall define the instrumentation, build-up test points and real-time monitoring with test point clearance. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'FLU-11'> flightFlutterTest : ProgramRequirement {
                doc /* Flight flutter testing shall show no instability within the flight envelope, and the models shall be correlated to flight data. */
                attribute :>> milestone = Milestone::PostFlight;
            }
            requirement <'FLU-12'> nacelleModal : ProgramRequirement {
                doc /* Where body inertia changes with deformation or the nacelle rotates, modal integrals shall be included, and results with and without them shall be compared side by side. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-13'> modelSensitivity : ProgramRequirement {
                doc /* Uncertain model parameters shall be varied to bound the flutter envelope, a large margin shall be confirmed under all variations, and critical parameter combinations shall be identified. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FLU-14'> testRelief : ProgramRequirement {
                doc /* Flight flutter testing shall be omitted only where the margin on a high-confidence model exceeds the value below, and the omission shall be recorded as a deviation. */
                attribute largeMarginPercent : Real = 100;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'FLU-4'> prelimFlutter : ProgramRequirement {
                doc /* A preliminary flutter analysis at the key flight points, including whirl flutter across the conversion corridor, shall show at least the margin below on equivalent airspeed and Mach number. */
                attribute marginPercent : Real = 15;
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'FLU-7'> gvt : ProgramRequirement {
                doc /* A ground vibration test shall measure mode shapes, frequencies and damping in every relevant configuration. */
                attribute :>> milestone = Milestone::SIR;
            }
        }

        requirement <'FTP-0'> flightTestReqs : ProgramRequirement {
            doc /* Flight test program deliverables. */
            requirement <'FTP-3'> simulation : ProgramRequirement {
                doc /* Flight maneuvers and test conditions shall be designed and practised in flight simulation before flight. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FTP-4'> envelopeExpansion : ProgramRequirement {
                doc /* The envelope expansion plan shall include a bail-out plan for the edges and corners of the envelope, and shall watch in flight for any cliffs found in CFD or wind tunnel data. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'FTP-5'> techBrief : ProgramRequirement {
                doc /* A technical briefing shall close out all open items, peer review the plan and the current risks, and end with signed approval to fly. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'FTP-7'> instrumentationPlan : ProgramRequirement {
                doc /* Instrumentation shall be designed early, to show safety, experiment success and experiment failure, and its reliability and maintainability shall be planned for the full program. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'FTP-6'> debrief : ProgramRequirement {
                doc /* Each flight shall be followed by a debrief, and discrepancies and results shall be documented and compared with predictions. */
                attribute :>> milestone = Milestone::PostFlight;
            }
            requirement <'FTP-1'> testPlan : ProgramRequirement {
                doc /* A flight test plan and test cards shall be released. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'FTP-2'> readiness : ProgramRequirement {
                doc /* No flight shall start until the operational readiness review is closed. */
                attribute :>> milestone = Milestone::ORR;
            }
        }

        requirement <'SOF-0'> safetyOfFlightReqs : ProgramRequirement {
            doc /* Safety of flight program deliverables. */
            requirement <'SOF-3'> hazardManagement : ProgramRequirement {
                doc /* Hazards shall be identified, evaluated for cause and effect, and scored for severity and probability on the hazard scales, with mitigations recorded, and the analysis kept current through the life cycle. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-4'> riskAcceptance : ProgramRequirement {
                doc /* No human-safety risk shall be accepted by the project team; any exception needs a recorded decision by the approving authority named in the configuration management plan. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'SOF-5'> reviewLevel : ProgramRequirement {
                doc /* The level of independent review shall be chosen to match the complexity, criticality and risk of the flights, and the choice recorded. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-6'> independentReview : ProgramRequirement {
                doc /* A flight readiness review by reviewers outside the project team shall examine the analyses, procedures, hazard analyses and qualification results, and the project shall respond to each finding. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-8'> lostLink : ProgramRequirement {
                doc /* A lost-link procedure shall be defined with a predesignated contingency landing site and verified in ground and flight test. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-9'> hazardStandard : ProgramRequirement {
                doc /* The hazard analysis shall follow ASTM F3178-16, which the NASA memo cites for small unmanned aircraft under 55 pounds. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-10'> pilotOverride : ProgramRequirement {
                doc /* The remote pilot shall be able to command or override the vehicle at all times. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-7'> flightApproval : ProgramRequirement {
                doc /* A written recommendation quantifying residual risk, with accepted risks named, shall be signed by the approving authority before the first flight. */
                attribute :>> milestone = Milestone::ORR;
            }
            requirement <'SOF-1'> hazards : ProgramRequirement {
                doc /* A preliminary hazard analysis shall be completed. */
                attribute :>> milestone = Milestone::PDR;
            }
            requirement <'SOF-2'> sofReview : ProgramRequirement {
                doc /* A safety of flight review shall be completed with open items dispositioned. */
                attribute :>> milestone = Milestone::ORR;
            }
        }

        requirement <'CMG-0'> configurationManagementReqs : ProgramRequirement {
            doc /* Configuration management program deliverables. */
            requirement <'CMG-4'> asBuiltLink : ProgramRequirement {
                doc /* Design, analysis and manufacturing shall stay linked so that the as-built performance is confirmed against the analysis. */
                attribute :>> milestone = Milestone::SIR;
            }
            requirement <'CMG-5'> simControl : ProgramRequirement {
                doc /* Flight simulations shall be under version control as part of configuration control. */
                attribute :>> milestone = Milestone::CDR;
            }
            requirement <'CMG-1'> cmp : ProgramRequirement {
                doc /* A configuration management plan shall be approved. */
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'CMG-2'> reqBaseline : ProgramRequirement {
                doc /* The requirements shall be baselined and changed only through change control. */
                attribute :>> milestone = Milestone::SRR;
            }
            requirement <'CMG-3'> designBaseline : ProgramRequirement {
                doc /* Document, load and data releases shall be recorded, and the design baselined. */
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
