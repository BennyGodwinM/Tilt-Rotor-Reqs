package AFRC_TiltrotorRequirementsDocument {
    private import ScalarValues::*;

    // Cover block, as on the first page of an AFPR
    part def Directive {
        attribute title : String;
        attribute responsibleOffice : String;
        attribute directiveNumber : String;
        attribute revision : String;
        attribute effectiveDate : String;
        attribute expirationDate : String;
    }

    part tiltrotorRequirements : Directive {
        attribute :>> title = "Tiltrotor UAV Requirements";
        attribute :>> responsibleOffice = "Project Chief Engineer";
        attribute :>> directiveNumber = "TBD";
        attribute :>> revision = "Baseline";
        attribute :>> effectiveDate = "TBD";
        attribute :>> expirationDate = "TBD";
    }

    package Preface {
        comment <'P.1'> purpose /* Sets the requirements for the design, verification and operation of the tiltrotor UAV, and for the programs that develop it. */
        comment <'P.2'> applicability /* Applies to the tiltrotor project and every discipline program under it. A statement with the word shall is a requirement; should is a recommended practice; will is an expected outcome; may or can is permission; is or are is description. */
        comment <'P.3'> authority /* 14 CFR Part 107 governs operation. The project adopts the structure of AFPR-7123.1-001, AFPR-7123.2-001 and AFPR-7150.2-001 by choice. */
        comment <'P.4'> applicableDocuments /* 14 CFR Part 107; AFPR-7123.1-001; AFPR-7123.2-001; AFPR-7150.2-001; AFPD-8040.1-001; forms AFRC 10117f, AFRC 70010 and AFRC 80184 as templates. */
        comment <'P.5'> measurementVerification /* Compliance is recorded at each review in the verification matrix, Appendix C. */
        comment <'P.6'> cancellation /* None. Baseline issue. */
    }

    package Chapter1_Introduction {
        comment <'1.1'> lifecycle /* The project passes five reviews in order: SRR, PDR, CDR, SIR and ORR. Each discipline program owes deliverables at these reviews. */
        comment <'1.2'> compliance /* The method of compliance for each requirement is recorded in the systems engineering management plan, or equivalent, signed off before SRR. */
    }

    package Chapter2_Responsibilities {
        part def Role { attribute responsibility : String; }
        part projectManager : Role { attribute :>> responsibility = "Approves project plans; appoints and chairs the change control board."; }
        part projectChiefEngineer : Role { attribute :>> responsibility = "Technical lead, system safety lead and systems engineering lead; approves waivers to technical requirements."; }
        part operationsEngineer : Role { attribute :>> responsibility = "Ensures airworthiness; approves flight software loads; develops flight test plans and cards."; }
        part configurationManager : Role { attribute :>> responsibility = "Identification, baseline management, reviews and audits, status accounting."; }
        part independentReviewers : Role { attribute :>> responsibility = "Outside the project team: examine analyses, procedures, hazard analyses and qualification results before flight, and report findings."; }
        part approvingAuthority : Role { attribute :>> responsibility = "Receives the review recommendation and signs approval to fly, accepting any residual risk. Holder to be named in the configuration management plan."; }
    }

    package Chapter3_VehicleRequirements {
        alias <'3.1'> configurationReq for TiltrotorVehicleRequirements::vehicleReqs::configuration;
        alias <'3.2'> enduranceReq for TiltrotorVehicleRequirements::vehicleReqs::endurance;
        alias <'3.3'> part107Req for TiltrotorVehicleRequirements::vehicleReqs::part107;
        alias <'3.3.1'> maxMassReq for TiltrotorVehicleRequirements::vehicleReqs::part107::maxMass;
        alias <'3.3.2'> envelopeReq for TiltrotorVehicleRequirements::vehicleReqs::part107::envelope;
        alias <'3.3.3'> lineOfSightReq for TiltrotorVehicleRequirements::vehicleReqs::part107::lineOfSight;
        alias <'3.4'> conversionReq for TiltrotorVehicleRequirements::vehicleReqs::conversion;
        alias <'3.5'> whirlFlutterFreeReq for TiltrotorVehicleRequirements::vehicleReqs::whirlFlutterFree;
        alias <'3.6'> strengthReq for TiltrotorVehicleRequirements::vehicleReqs::strength;
        alias <'3.7'> modeLogicReq for TiltrotorVehicleRequirements::vehicleReqs::modeLogic;
        alias <'3.8'> boundaryCompleteReq for TiltrotorVehicleRequirements::vehicleReqs::boundaryComplete;
    }

    package Chapter4_ProgramRequirements {
        alias <'4.1'> sePara for TiltrotorProgramModel::programReqs::seReqs;
        alias <'4.1.1'> sempReq for TiltrotorProgramModel::programReqs::seReqs::semp;
        alias <'4.1.2'> tradesReq for TiltrotorProgramModel::programReqs::seReqs::trades;
        alias <'4.1.3'> vvPlanReq for TiltrotorProgramModel::programReqs::seReqs::vvPlan;
        alias <'4.1.4'> integrationPlanReq for TiltrotorProgramModel::programReqs::seReqs::integrationPlan;
        alias <'4.1.5'> standardsTailoringReq for TiltrotorProgramModel::programReqs::seReqs::standardsTailoring;
        alias <'4.1.6'> technicalAssessmentReq for TiltrotorProgramModel::programReqs::seReqs::technicalAssessment;
        alias <'4.1.7'> riskBasedInsightReq for TiltrotorProgramModel::programReqs::seReqs::riskBasedInsight;
        alias <'4.1.8'> issueEscalationReq for TiltrotorProgramModel::programReqs::seReqs::issueEscalation;
        alias <'4.1.9'> criticalTechnologiesReq for TiltrotorProgramModel::programReqs::seReqs::criticalTechnologies;
        alias <'4.1.10'> readinessLevelReq for TiltrotorProgramModel::programReqs::seReqs::readinessLevel;
        alias <'4.1.11'> predictBeforeTestReq for TiltrotorProgramModel::programReqs::seReqs::predictBeforeTest;
        alias <'4.1.12'> requirementFormReq for TiltrotorProgramModel::programReqs::seReqs::requirementForm;
        alias <'4.1.13'> requirementValidationReq for TiltrotorProgramModel::programReqs::seReqs::requirementValidation;
        alias <'4.1.14'> drivingRequirementsReq for TiltrotorProgramModel::programReqs::seReqs::drivingRequirements;
        alias <'4.1.15'> systemOverviewReq for TiltrotorProgramModel::programReqs::seReqs::systemOverview;
        alias <'4.1.16'> systemBoundaryReq for TiltrotorProgramModel::programReqs::seReqs::systemBoundary;
        alias <'4.1.17'> operationalConceptsReq for TiltrotorProgramModel::programReqs::seReqs::operationalConcepts;
        alias <'4.1.18'> environmentalAssumptionsReq for TiltrotorProgramModel::programReqs::seReqs::environmentalAssumptions;
        alias <'4.1.19'> modeLogicReq for TiltrotorProgramModel::programReqs::seReqs::modeLogic;
        alias <'4.1.20'> detailedRequirementFormReq for TiltrotorProgramModel::programReqs::seReqs::detailedRequirementForm;
        alias <'4.1.21'> derivedRequirementsReq for TiltrotorProgramModel::programReqs::seReqs::derivedRequirements;
        alias <'4.1.22'> allocationToSubsystemsReq for TiltrotorProgramModel::programReqs::seReqs::allocationToSubsystems;
        alias <'4.1.23'> workBreakdownStructureReq for TiltrotorProgramModel::programReqs::seReqs::workBreakdownStructure;
        alias <'4.1.24'> wbsDictionaryReq for TiltrotorProgramModel::programReqs::seReqs::wbsDictionary;
        alias <'4.1.25'> verificationMatrixReq for TiltrotorProgramModel::programReqs::seReqs::verificationMatrix;
        alias <'4.1.26'> performanceMeasuresReq for TiltrotorProgramModel::programReqs::seReqs::performanceMeasures;
        alias <'4.1.27'> requirementQualityReq for TiltrotorProgramModel::programReqs::seReqs::requirementQuality;
        alias <'4.2'> aerodynamicsPara for TiltrotorProgramModel::programReqs::aerodynamicsReqs;
        alias <'4.2.1'> aeroDatabaseReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::aeroDatabase;
        alias <'4.2.2'> aeroUpdateReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::aeroUpdate;
        alias <'4.2.3'> modelRecordReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::modelRecord;
        alias <'4.2.4'> cfdSetupReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::cfdSetup;
        alias <'4.2.5'> cadCheckReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::cadCheck;
        alias <'4.2.6'> cfdArchiveReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::cfdArchive;
        alias <'4.2.7'> instrumentationReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::instrumentation;
        alias <'4.2.8'> airDataReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::airData;
        alias <'4.2.9'> instrumentCheckReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::instrumentCheck;
        alias <'4.2.10'> aeroFlightValidationReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::aeroFlightValidation;
        alias <'4.2.11'> sensorErrorsReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::sensorErrors;
        alias <'4.2.12'> parameterEstimationReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::parameterEstimation;
        alias <'4.2.13'> flightDataArchiveReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::flightDataArchive;
        alias <'4.2.14'> codeCrossCheckReq for TiltrotorProgramModel::programReqs::aerodynamicsReqs::codeCrossCheck;
        alias <'4.3'> loadsPara for TiltrotorProgramModel::programReqs::loadsReqs;
        alias <'4.3.1'> prelimLoadsReq for TiltrotorProgramModel::programReqs::loadsReqs::prelimLoads;
        alias <'4.3.2'> finalLoadsReq for TiltrotorProgramModel::programReqs::loadsReqs::finalLoads;
        alias <'4.3.3'> modelAssumptionsReq for TiltrotorProgramModel::programReqs::loadsReqs::modelAssumptions;
        alias <'4.3.4'> datasetChecksReq for TiltrotorProgramModel::programReqs::loadsReqs::datasetChecks;
        alias <'4.3.5'> modalDataReq for TiltrotorProgramModel::programReqs::loadsReqs::modalData;
        alias <'4.3.6'> toolchainChecksReq for TiltrotorProgramModel::programReqs::loadsReqs::toolchainChecks;
        alias <'4.3.7'> modelQualityReq for TiltrotorProgramModel::programReqs::loadsReqs::modelQuality;
        alias <'4.4'> structuresPara for TiltrotorProgramModel::programReqs::structuresReqs;
        alias <'4.4.1'> stressNotesReq for TiltrotorProgramModel::programReqs::structuresReqs::stressNotes;
        alias <'4.4.2'> conformityReq for TiltrotorProgramModel::programReqs::structuresReqs::conformity;
        alias <'4.4.3'> staticApproachReq for TiltrotorProgramModel::programReqs::structuresReqs::staticApproach;
        alias <'4.4.4'> flightLoadLimitReq for TiltrotorProgramModel::programReqs::structuresReqs::flightLoadLimit;
        alias <'4.5'> structuralIntegrityPara for TiltrotorProgramModel::programReqs::structuralIntegrityReqs;
        alias <'4.5.1'> criteriaReq for TiltrotorProgramModel::programReqs::structuralIntegrityReqs::criteria;
        alias <'4.5.2'> groundTestReq for TiltrotorProgramModel::programReqs::structuralIntegrityReqs::groundTest;
        alias <'4.5.3'> compositeBuildingBlockReq for TiltrotorProgramModel::programReqs::structuralIntegrityReqs::compositeBuildingBlock;
        alias <'4.5.4'> proofLoadReq for TiltrotorProgramModel::programReqs::structuralIntegrityReqs::proofLoad;
        alias <'4.5.5'> inspectionIntervalReq for TiltrotorProgramModel::programReqs::structuralIntegrityReqs::inspectionInterval;
        alias <'4.6'> rotorEffectsPara for TiltrotorProgramModel::programReqs::rotorEffectsReqs;
        alias <'4.6.1'> rotorLoadsReq for TiltrotorProgramModel::programReqs::rotorEffectsReqs::rotorLoads;
        alias <'4.6.2'> rotorDynamicsReq for TiltrotorProgramModel::programReqs::rotorEffectsReqs::rotorDynamics;
        alias <'4.7'> flutterPara for TiltrotorProgramModel::programReqs::flutterReqs;
        alias <'4.7.1'> instabilitiesReq for TiltrotorProgramModel::programReqs::flutterReqs::instabilities;
        alias <'4.7.2'> approachReq for TiltrotorProgramModel::programReqs::flutterReqs::approach;
        alias <'4.7.3'> femModelReq for TiltrotorProgramModel::programReqs::flutterReqs::femModel;
        alias <'4.7.4'> prelimFlutterReq for TiltrotorProgramModel::programReqs::flutterReqs::prelimFlutter;
        alias <'4.7.5'> aseMarginsReq for TiltrotorProgramModel::programReqs::flutterReqs::aseMargins;
        alias <'4.7.6'> massPropsReq for TiltrotorProgramModel::programReqs::flutterReqs::massProps;
        alias <'4.7.7'> gvtReq for TiltrotorProgramModel::programReqs::flutterReqs::gvt;
        alias <'4.7.8'> femCorrelationReq for TiltrotorProgramModel::programReqs::flutterReqs::femCorrelation;
        alias <'4.7.9'> finalFlutterReq for TiltrotorProgramModel::programReqs::flutterReqs::finalFlutter;
        alias <'4.7.10'> flightFlutterPlanReq for TiltrotorProgramModel::programReqs::flutterReqs::flightFlutterPlan;
        alias <'4.7.11'> flightFlutterTestReq for TiltrotorProgramModel::programReqs::flutterReqs::flightFlutterTest;
        alias <'4.7.12'> nacelleModalReq for TiltrotorProgramModel::programReqs::flutterReqs::nacelleModal;
        alias <'4.7.13'> modelSensitivityReq for TiltrotorProgramModel::programReqs::flutterReqs::modelSensitivity;
        alias <'4.7.14'> testReliefReq for TiltrotorProgramModel::programReqs::flutterReqs::testRelief;
        alias <'4.8'> flightTestPara for TiltrotorProgramModel::programReqs::flightTestReqs;
        alias <'4.8.1'> testPlanReq for TiltrotorProgramModel::programReqs::flightTestReqs::testPlan;
        alias <'4.8.2'> readinessReq for TiltrotorProgramModel::programReqs::flightTestReqs::readiness;
        alias <'4.8.3'> simulationReq for TiltrotorProgramModel::programReqs::flightTestReqs::simulation;
        alias <'4.8.4'> envelopeExpansionReq for TiltrotorProgramModel::programReqs::flightTestReqs::envelopeExpansion;
        alias <'4.8.5'> techBriefReq for TiltrotorProgramModel::programReqs::flightTestReqs::techBrief;
        alias <'4.8.6'> debriefReq for TiltrotorProgramModel::programReqs::flightTestReqs::debrief;
        alias <'4.8.7'> instrumentationPlanReq for TiltrotorProgramModel::programReqs::flightTestReqs::instrumentationPlan;
        alias <'4.9'> safetyOfFlightPara for TiltrotorProgramModel::programReqs::safetyOfFlightReqs;
        alias <'4.9.1'> hazardsReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::hazards;
        alias <'4.9.2'> sofReviewReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::sofReview;
        alias <'4.9.3'> hazardManagementReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::hazardManagement;
        alias <'4.9.4'> riskAcceptanceReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::riskAcceptance;
        alias <'4.9.5'> reviewLevelReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::reviewLevel;
        alias <'4.9.6'> independentReviewReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::independentReview;
        alias <'4.9.7'> flightApprovalReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::flightApproval;
        alias <'4.9.8'> lostLinkReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::lostLink;
        alias <'4.9.9'> hazardStandardReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::hazardStandard;
        alias <'4.9.10'> pilotOverrideReq for TiltrotorProgramModel::programReqs::safetyOfFlightReqs::pilotOverride;
        alias <'4.10'> configurationManagementPara for TiltrotorProgramModel::programReqs::configurationManagementReqs;
        alias <'4.10.1'> cmpReq for TiltrotorProgramModel::programReqs::configurationManagementReqs::cmp;
        alias <'4.10.2'> reqBaselineReq for TiltrotorProgramModel::programReqs::configurationManagementReqs::reqBaseline;
        alias <'4.10.3'> designBaselineReq for TiltrotorProgramModel::programReqs::configurationManagementReqs::designBaseline;
        alias <'4.10.4'> asBuiltLinkReq for TiltrotorProgramModel::programReqs::configurationManagementReqs::asBuiltLink;
        alias <'4.10.5'> simControlReq for TiltrotorProgramModel::programReqs::configurationManagementReqs::simControl;
    }

    package AppendixA_Definitions {
        comment <'A.1'> verificationTerm /* Proof, by objective evidence, that the product meets its requirements, by test, analysis, demonstration, inspection, or a combination. */
        comment <'A.2'> validation /* Proof, by objective evidence, that the product does what it is for, by test, analysis, demonstration, or a combination. */
        comment <'A.3'> deviation /* A documented release from a requirement before that requirement is under configuration control. */
        comment <'A.4'> waiver /* A documented release from a requirement after that requirement is under configuration control. */
    }

    package AppendixB_Acronyms {
        comment <'B.1'> acronyms /* AGL above ground level; CCB change control board; CDR Critical Design Review; CM configuration management; CMP configuration management plan; ORR Operational Readiness Review; PDR Preliminary Design Review; SEMP systems engineering management plan; SIR Systems Integration Review; SRR System Requirements Review; UAS unmanned aircraft system; V&V verification and validation. */
    }

    // Appendix C is the verification matrix: one row per requirement, filled in at each review.

    package ChangeLog {
        comment <'CL.1'> baseline /* Baseline issue. */
    }
}
