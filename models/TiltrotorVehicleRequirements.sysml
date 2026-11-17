package TiltrotorVehicleRequirements {
    private import ScalarValues::*;

    // Verification methods as defined in AFPR-7123.1-001, Appendix A
    enum def VerificationMethod { enum byTest; enum byAnalysis; enum byDemonstration; enum byInspection; }

    requirement def VehicleRequirement {
        attribute verifyBy : VerificationMethod;
    }

    part def Vehicle;

    part tiltrotor : Vehicle {
        part airframe;
        part leftRotorNacelle;
        part rightRotorNacelle;
        part noseGimbal;
        part battery;
    }

    requirement <'VEH-0'> vehicleReqs : VehicleRequirement {
        doc /* Top-level requirements for the twin-rotor tiltrotor UAV. */

        requirement <'VEH-1'> configuration : VehicleRequirement {
            doc /* The vehicle shall be a twin-rotor tiltrotor with a GoPro camera on a gimbal in the nose. */
            attribute :>> verifyBy = VerificationMethod::byInspection;
        }

        requirement <'VEH-2'> endurance : VehicleRequirement {
            doc /* The vehicle shall have at least 30 minutes of flight time. Reserve policy to be set. */
            attribute minutes : Real = 30;
            attribute :>> verifyBy = VerificationMethod::byTest;
        }

        requirement <'VEH-3'> part107 : VehicleRequirement {
            doc /* The vehicle shall be operable under 14 CFR Part 107. */
            attribute :>> verifyBy = VerificationMethod::byInspection;

            requirement <'VEH-3.1'> maxMass : VehicleRequirement {
                doc /* Takeoff mass including payload shall be less than the limit, with a sizing margin to be set. */
                attribute limitLb : Real = 55;
                attribute :>> verifyBy = VerificationMethod::byTest;
            }
            requirement <'VEH-3.2'> envelope : VehicleRequirement {
                doc /* Operation shall stay below the altitude limit and at or below the groundspeed limit. */
                attribute maxAltitudeFtAgl : Real = 400;
                attribute maxGroundspeedKt : Real = 87;
                attribute :>> verifyBy = VerificationMethod::byDemonstration;
            }
            requirement <'VEH-3.3'> lineOfSight : VehicleRequirement {
                doc /* Operation shall stay within visual line of sight of the remote pilot. */
                attribute :>> verifyBy = VerificationMethod::byDemonstration;
            }
        }

        requirement <'VEH-4'> conversion : VehicleRequirement {
            doc /* The vehicle shall convert between hover and cruise inside a conversion corridor to be defined. */
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-5'> whirlFlutterFree : VehicleRequirement {
            doc /* The vehicle shall be free of whirl flutter inside the flight envelope, with at least the margin required in the flutter program requirements. */
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-6'> strength : VehicleRequirement {
            doc /* The structure shall carry limit loads without detrimental deformation and ultimate loads without failure, with factors to be set. */
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
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
