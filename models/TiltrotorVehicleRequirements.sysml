package TiltrotorVehicleRequirements {
    private import ScalarValues::*;

    // Verification methods as defined in AFPR-7123.1-001, Appendix A
    enum def VerificationMethod { enum byTest; enum byAnalysis; enum byDemonstration; enum byInspection; }

    enum def Basis { enum directive; enum adoptedDefault; enum projectChoice; enum placeholder; }

    requirement def VehicleRequirement {
        attribute verifyBy : VerificationMethod;
        attribute basis : Basis;
        attribute rationale : String;
    }

    // System boundary per FAA AR-08/32: what the aircraft senses, commands and must tolerate.
    // Latency and tolerance are left unset on purpose; they are listed in the TBD register.
    enum def BoundaryKind { enum monitored; enum controlled; enum environmental; }
    attribute def BoundaryVariable {
        attribute kind : BoundaryKind;
        attribute unit : String;
        attribute rangeMin : Real;
        attribute rangeMax : Real;
        attribute latencyMs : Real;
        attribute tolerance : Real;
    }

    part def Vehicle;

    part tiltrotor : Vehicle {
        part airframe;
        part leftRotorNacelle;
        part rightRotorNacelle;
        part noseGimbal;
        part battery;

        part boundary {
            attribute groundspeed : BoundaryVariable { attribute :>> kind = BoundaryKind::monitored; attribute :>> unit = "kt"; attribute :>> rangeMin = 0; attribute :>> rangeMax = 87; }
            attribute altitudeAgl : BoundaryVariable { attribute :>> kind = BoundaryKind::monitored; attribute :>> unit = "ft"; attribute :>> rangeMin = 0; attribute :>> rangeMax = 400; }
            attribute nacelleAngle : BoundaryVariable { attribute :>> kind = BoundaryKind::monitored; attribute :>> unit = "deg"; attribute :>> rangeMin = 0; attribute :>> rangeMax = 90; }
            attribute nacelleTiltCommand : BoundaryVariable { attribute :>> kind = BoundaryKind::controlled; attribute :>> unit = "deg"; attribute :>> rangeMin = 0; attribute :>> rangeMax = 90; }
            attribute gimbalPitchCommand : BoundaryVariable { attribute :>> kind = BoundaryKind::controlled; attribute :>> unit = "deg"; }
            attribute windSpeed : BoundaryVariable { attribute :>> kind = BoundaryKind::environmental; attribute :>> unit = "kt"; }
        }
    }

    requirement <'VEH-0'> vehicleReqs : VehicleRequirement {
        doc /* Top-level requirements for the twin-rotor tiltrotor UAV. */

        requirement <'VEH-1'> configuration : VehicleRequirement {
            doc /* The vehicle shall be a twin-rotor tiltrotor with a GoPro camera on a gimbal in the nose. */
            attribute :>> basis = Basis::projectChoice;
            attribute :>> rationale = "Fixes the configuration every other requirement refers to.";
            attribute :>> verifyBy = VerificationMethod::byInspection;
        }

        requirement <'VEH-2'> endurance : VehicleRequirement {
            doc /* The vehicle shall have at least 30 minutes of flight time. Reserve policy to be set. */
            attribute :>> basis = Basis::projectChoice;
            attribute :>> rationale = "Sets the battery and power sizing.";
            attribute minutes : Real = 30;
            attribute :>> verifyBy = VerificationMethod::byTest;
        }

        requirement <'VEH-3'> part107 : VehicleRequirement {
            doc /* The vehicle shall be operable under 14 CFR Part 107. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Operation under Part 107 is the project operating basis.";
            attribute :>> verifyBy = VerificationMethod::byInspection;

            requirement <'VEH-3.1'> maxMass : VehicleRequirement {
                doc /* Takeoff mass including payload shall be less than the limit, with a sizing margin to be set. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Part 107 limits takeoff mass; margin is a project decision.";
                attribute limitLb : Real = 55;
                attribute :>> verifyBy = VerificationMethod::byTest;
            }
            requirement <'VEH-3.2'> envelope : VehicleRequirement {
                doc /* Operation shall stay below the altitude limit and at or below the groundspeed limit. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Part 107 sets the altitude and groundspeed limits.";
                attribute maxAltitudeFtAgl : Real = 400;
                attribute maxGroundspeedKt : Real = 87;
                attribute :>> verifyBy = VerificationMethod::byDemonstration;
            }
            requirement <'VEH-3.3'> lineOfSight : VehicleRequirement {
                doc /* Operation shall stay within visual line of sight of the remote pilot. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Part 107 requires visual line of sight.";
                attribute :>> verifyBy = VerificationMethod::byDemonstration;
            }
        }

        requirement <'VEH-4'> conversion : VehicleRequirement {
            doc /* The vehicle shall convert between hover and cruise inside a conversion corridor to be defined. */
            attribute :>> basis = Basis::projectChoice;
            attribute :>> rationale = "The corridor sets the aerodynamic and control design space.";
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-5'> whirlFlutterFree : VehicleRequirement {
            doc /* The vehicle shall be free of whirl flutter inside the flight envelope, with at least the margin required in the flutter program requirements. */
            attribute :>> basis = Basis::adoptedDefault;
            attribute :>> rationale = "Whirl flutter is the main aeroelastic risk of a tilting rotor.";
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-6'> strength : VehicleRequirement {
            doc /* The structure shall carry limit loads without detrimental deformation and ultimate loads without failure, with factors to be set. */
            attribute :>> basis = Basis::placeholder;
            attribute :>> rationale = "Factors of safety are not chosen yet.";
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-7'> modeLogic : VehicleRequirement {
            doc /* The vehicle shall move between flight modes only along the transitions defined in the FlightModes state definition. */
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
            attribute :>> basis = Basis::adoptedDefault;
            attribute :>> rationale = "Explicit modes keep the conversion from producing undefined behavior.";
        }

        requirement <'VEH-8'> boundaryComplete : VehicleRequirement {
            doc /* Every monitored and controlled variable of the vehicle shall have a unit and range, and every controlled variable shall also have a latency and a tolerance. */
            attribute :>> verifyBy = VerificationMethod::byInspection;
            attribute :>> basis = Basis::adoptedDefault;
            attribute :>> rationale = "Outputs without latency and tolerance cannot be verified.";
        }
    }

    // Allocation to the design
    satisfy vehicleReqs by tiltrotor;
    satisfy vehicleReqs::strength by tiltrotor::airframe;
    satisfy vehicleReqs::configuration by tiltrotor;
    satisfy vehicleReqs::endurance by tiltrotor::battery;
    satisfy vehicleReqs::part107 by tiltrotor;
    satisfy vehicleReqs::conversion by tiltrotor::leftRotorNacelle;
    satisfy vehicleReqs::conversion by tiltrotor::rightRotorNacelle;
    satisfy vehicleReqs::whirlFlutterFree by tiltrotor::leftRotorNacelle;
    satisfy vehicleReqs::whirlFlutterFree by tiltrotor::rightRotorNacelle;
    satisfy vehicleReqs::modeLogic by tiltrotor;
    satisfy vehicleReqs::boundaryComplete by tiltrotor::boundary;

    // Behavior view: flight modes and the legal transitions between them
    state def FlightModes {
        entry; then hover;
        state hover;
        state conversion;
        state cruise;
        transition hoverToConversion first hover then conversion;
        transition conversionToCruise first conversion then cruise;
        transition cruiseToConversion first cruise then conversion;
        transition conversionToHover first conversion then hover;
    }

    // Parametric view: endurance follows from battery energy and average power
    constraint def EnduranceConstraint {
        in batteryEnergyWh : Real;
        in averagePowerW : Real;
        in enduranceMin : Real;
        enduranceMin == batteryEnergyWh / averagePowerW * 60
    }

    // Trace to the program requirement that proves each one
    dependency from vehicleReqs::endurance to TiltrotorProgramModel::programReqs::flightTestReqs;
    dependency from vehicleReqs::part107 to TiltrotorProgramModel::programReqs::safetyOfFlightReqs;
    dependency from vehicleReqs::conversion to TiltrotorProgramModel::programReqs::aerodynamicsReqs;
    dependency from vehicleReqs::whirlFlutterFree to TiltrotorProgramModel::programReqs::flutterReqs::prelimFlutter;
    dependency from vehicleReqs::whirlFlutterFree to TiltrotorProgramModel::programReqs::flutterReqs::flightFlutterTest;
    dependency from vehicleReqs::strength to TiltrotorProgramModel::programReqs::structuresReqs::stressNotes;
}
