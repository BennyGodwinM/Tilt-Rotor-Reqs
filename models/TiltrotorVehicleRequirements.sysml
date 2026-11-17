package TiltrotorVehicleRequirements {
    private import ScalarValues::*;

    // Verification methods as defined in AFPR-7123.1-001, Appendix A
    enum def VerificationMethod { enum byTest; enum byAnalysis; enum byDemonstration; enum byInspection; }

    enum def Basis { enum directive; enum adoptedDefault; enum projectChoice; enum placeholder; }

    requirement def VehicleRequirement {
        attribute verifyBy : VerificationMethod;
        attribute basis : Basis;
        attribute rationale : String;
        attribute successCriteria : String;
        attribute facility : String;
        attribute phase : String;
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

    // Proposed architecture for the block and interconnection views. A modeling choice to confirm:
    // the parts, ports and connections below are not yet from a trade study.
    item def Power;
    item def Command;
    item def Status;
    item def Data;
    item def Video;
    port def PowerOut { out item power : Power; }
    port def PowerIn { in item power : Power; }
    port def CommandOut { out item command : Command; }
    port def CommandIn { in item command : Command; }
    port def StatusOut { out item status : Status; }
    port def StatusIn { in item status : Status; }
    port def DataOut { out item data : Data; }
    port def DataIn { in item data : Data; }
    port def VideoOut { out item video : Video; }
    port def VideoIn { in item video : Video; }

    part def Airframe;
    part def Motor;
    part def Rotor;
    part def TiltActuator;
    part def PayloadSensor {
        port powerIn : PowerIn;
        port dataOut : DataOut;
    }
    part def FpvCamera {
        port powerIn : PowerIn;
        port videoOut : VideoOut;
    }
    part def VideoTransmitter {
        port powerIn : PowerIn;
        port videoIn : VideoIn;
    }
    part def LandingGear { port groundContact : StatusOut; }
    part def Battery {
        port powerOut : PowerOut;
        port statusOut : StatusOut;
    }
    part def PowerDistribution {
        port powerIn : PowerIn;
        port toLeftNacelle : PowerOut;
        port toRightNacelle : PowerOut;
        port toFlightController : PowerOut;
        port toRadioLink : PowerOut;
        port toGimbal : PowerOut;
        port toFpvCamera : PowerOut;
        port toVideoTx : PowerOut;
    }
    part def FlightController {
        port powerIn : PowerIn;
        port pilotCommand : CommandIn;
        port tiltCommandLeft : CommandOut;
        port tiltCommandRight : CommandOut;
        port gimbalCommand : CommandOut;
        port batteryStatus : StatusIn;
        port gearStatus : StatusIn;
        port tiltAngleLeft : StatusIn;
        port tiltAngleRight : StatusIn;
        port payloadData : DataIn;
    }
    part def RadioLink {
        port powerIn : PowerIn;
        port pilotCommand : CommandOut;
    }
    part def Nacelle {
        port powerIn : PowerIn;
        port tiltCommand : CommandIn;
        port tiltAngle : StatusOut;
        part motor : Motor;
        part rotor : Rotor;
        part tiltActuator : TiltActuator;
    }
    part def Gimbal {
        port powerIn : PowerIn;
        port gimbalCommand : CommandIn;
        port sensorPower : PowerOut;
        port dataOut : DataOut;
        part payloadSensor : PayloadSensor;
        connect sensorPower to payloadSensor.powerIn;
        connect payloadSensor.dataOut to dataOut;
    }

    part def Vehicle;

    part tiltrotor : Vehicle {
        part airframe : Airframe;
        part landingGear : LandingGear;
        part fpvCamera : FpvCamera;
        part leftRotorNacelle : Nacelle;
        part rightRotorNacelle : Nacelle;
        part noseGimbal : Gimbal;
        part battery : Battery;
        part powerDistribution : PowerDistribution;
        part flightController : FlightController;
        part radioLink : RadioLink;
        part videoTx : VideoTransmitter;

        connect battery.powerOut to powerDistribution.powerIn;
        connect powerDistribution.toLeftNacelle to leftRotorNacelle.powerIn;
        connect powerDistribution.toRightNacelle to rightRotorNacelle.powerIn;
        connect powerDistribution.toFlightController to flightController.powerIn;
        connect powerDistribution.toRadioLink to radioLink.powerIn;
        connect powerDistribution.toGimbal to noseGimbal.powerIn;
        connect powerDistribution.toFpvCamera to fpvCamera.powerIn;
        connect powerDistribution.toVideoTx to videoTx.powerIn;
        connect fpvCamera.videoOut to videoTx.videoIn;
        connect battery.statusOut to flightController.batteryStatus;
        connect landingGear.groundContact to flightController.gearStatus;
        connect leftRotorNacelle.tiltAngle to flightController.tiltAngleLeft;
        connect rightRotorNacelle.tiltAngle to flightController.tiltAngleRight;
        connect noseGimbal.dataOut to flightController.payloadData;
        connect radioLink.pilotCommand to flightController.pilotCommand;
        connect flightController.tiltCommandLeft to leftRotorNacelle.tiltCommand;
        connect flightController.tiltCommandRight to rightRotorNacelle.tiltCommand;
        connect flightController.gimbalCommand to noseGimbal.gimbalCommand;

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
            doc /* The vehicle shall be a twin-rotor tiltrotor with a gimbal in the nose that carries a replaceable payload sensor, and a separate FPV camera. */
            attribute :>> basis = Basis::projectChoice;
            attribute :>> rationale = "Fixes the configuration every other requirement refers to.";
            attribute :>> successCriteria = "Built aircraft matches the configuration drawing: two tilting rotors, a nose gimbal with a replaceable sensor, an FPV camera and landing gear.";
            attribute :>> facility = "Hangar";
            attribute :>> phase = "SIR";
            attribute :>> verifyBy = VerificationMethod::byInspection;
        }

        requirement <'VEH-2'> endurance : VehicleRequirement {
            doc /* The vehicle shall have at least 30 minutes of flight time. Reserve policy to be set. */
            attribute :>> basis = Basis::projectChoice;
            attribute :>> rationale = "Sets the battery and power sizing.";
            attribute :>> successCriteria = "Hover-and-cruise profile flown to battery cutoff reserve; elapsed flight time at least 30 minutes.";
            attribute :>> facility = "Flight test range";
            attribute :>> phase = "ORR";
            attribute minutes : Real = 30;
            attribute :>> verifyBy = VerificationMethod::byTest;
        }

        requirement <'VEH-3'> part107 : VehicleRequirement {
            doc /* The vehicle shall be operable under 14 CFR Part 107. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Operation under Part 107 is the project operating basis.";
            attribute :>> successCriteria = "All Part 107 sub-requirements closed.";
            attribute :>> facility = "Not applicable";
            attribute :>> phase = "ORR";
            attribute :>> verifyBy = VerificationMethod::byInspection;

            requirement <'VEH-3.1'> maxMass : VehicleRequirement {
                doc /* Takeoff mass including payload shall be less than the limit, with a sizing margin to be set. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Part 107 limits takeoff mass; margin is a project decision.";
            attribute :>> successCriteria = "Weighed takeoff mass with payload below 55 lb by the sizing margin.";
            attribute :>> facility = "Hangar scale";
            attribute :>> phase = "SIR";
                attribute limitLb : Real = 55;
                attribute :>> verifyBy = VerificationMethod::byTest;
            }
            requirement <'VEH-3.2'> envelope : VehicleRequirement {
                doc /* Operation shall stay below the altitude limit and at or below the groundspeed limit. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Part 107 sets the altitude and groundspeed limits.";
            attribute :>> successCriteria = "Flight data shows altitude never above 400 ft AGL and groundspeed never above 87 kt across the demonstrated envelope.";
            attribute :>> facility = "Flight test range";
            attribute :>> phase = "ORR";
                attribute maxAltitudeFtAgl : Real = 400;
                attribute maxGroundspeedKt : Real = 87;
                attribute :>> verifyBy = VerificationMethod::byDemonstration;
            }
            requirement <'VEH-3.3'> lineOfSight : VehicleRequirement {
                doc /* Operation shall stay within visual line of sight of the remote pilot. */
            attribute :>> basis = Basis::directive;
            attribute :>> rationale = "Part 107 requires visual line of sight.";
            attribute :>> successCriteria = "Pilot holds visual contact over all test legs.";
            attribute :>> facility = "Flight test range";
            attribute :>> phase = "ORR";
                attribute :>> verifyBy = VerificationMethod::byDemonstration;
            }
        }

        requirement <'VEH-4'> conversion : VehicleRequirement {
            doc /* The vehicle shall convert between hover and cruise inside a conversion corridor to be defined. */
            attribute :>> basis = Basis::projectChoice;
            attribute :>> rationale = "The corridor sets the aerodynamic and control design space.";
            attribute :>> successCriteria = "Analysis shows controllable, stable conversion across the corridor with margins in the flight control requirements.";
            attribute :>> facility = "Analysis";
            attribute :>> phase = "CDR";
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-5'> whirlFlutterFree : VehicleRequirement {
            doc /* The vehicle shall be free of whirl flutter inside the flight envelope, with at least the margin required in the flutter program requirements. */
            attribute :>> basis = Basis::adoptedDefault;
            attribute :>> rationale = "Whirl flutter is the main aeroelastic risk of a tilting rotor.";
            attribute :>> successCriteria = "No unstable mode inside the flight envelope with the margin in the flutter requirements.";
            attribute :>> facility = "Analysis";
            attribute :>> phase = "CDR";
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-6'> strength : VehicleRequirement {
            doc /* The structure shall carry limit loads without detrimental deformation and ultimate loads without failure, with factors to be set. */
            attribute :>> basis = Basis::placeholder;
            attribute :>> rationale = "Factors of safety are not chosen yet.";
            attribute :>> successCriteria = "Positive margin of safety at limit and ultimate load for every load case.";
            attribute :>> facility = "Analysis";
            attribute :>> phase = "CDR";
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
        }

        requirement <'VEH-7'> modeLogic : VehicleRequirement {
            doc /* The vehicle shall move between flight modes only along the transitions defined in the FlightModes state definition. */
            attribute :>> verifyBy = VerificationMethod::byAnalysis;
            attribute :>> basis = Basis::adoptedDefault;
            attribute :>> rationale = "Explicit modes keep the conversion from producing undefined behavior.";
            attribute :>> successCriteria = "Analysis of the mode logic shows no transition outside the four defined.";
            attribute :>> facility = "Analysis";
            attribute :>> phase = "PDR";
        }

        requirement <'VEH-8'> boundaryComplete : VehicleRequirement {
            doc /* Every monitored and controlled variable of the vehicle shall have a unit and range, and every controlled variable shall also have a latency and a tolerance. */
            attribute :>> verifyBy = VerificationMethod::byInspection;
            attribute :>> basis = Basis::adoptedDefault;
            attribute :>> rationale = "Outputs without latency and tolerance cannot be verified.";
            attribute :>> successCriteria = "Each boundary variable carries a unit and range, and each controlled variable a latency and tolerance.";
            attribute :>> facility = "Document review";
            attribute :>> phase = "PDR";
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
    dependency from vehicleReqs::configuration to TiltrotorProgramModel::programReqs::seReqs::trades;
    dependency from vehicleReqs::modeLogic to TiltrotorProgramModel::programReqs::seReqs::modeLogic;
    dependency from vehicleReqs::boundaryComplete to TiltrotorProgramModel::programReqs::seReqs::systemBoundary;
    dependency from vehicleReqs::strength to TiltrotorProgramModel::programReqs::structuresReqs::stressNotes;

    // Verification cases: how each vehicle requirement will be closed
    verification def EnduranceTest { subject testVehicle : Vehicle; objective { verify vehicleReqs::endurance; } }
    verification def MassCheck { subject testVehicle : Vehicle; objective { verify vehicleReqs::part107::maxMass; } }
    verification def EnvelopeDemonstration { subject testVehicle : Vehicle; objective { verify vehicleReqs::part107::envelope; } }
    verification def FlutterAnalysis { subject testVehicle : Vehicle; objective { verify vehicleReqs::whirlFlutterFree; } }
    verification def StrengthAnalysis { subject testVehicle : Vehicle; objective { verify vehicleReqs::strength; } }
}
