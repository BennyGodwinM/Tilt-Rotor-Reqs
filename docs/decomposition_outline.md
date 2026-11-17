# Decomposition outline

Nested as in the model: each requirement sits under the requirement it refines.


## PowerReqs

- **PWR-001** The battery pack shall deliver at least the usable energy computed by EnduranceConstraint for a 30-minute mission plus the reserve in PWR-002.
  - **PWR-003** The battery pack shall use lithium-polymer or lithium-ion cells [TBD chemistry].
  - **PWR-004** The battery pack shall have a pack-level specific energy of at least 160 Wh/kg.
  - **PWR-006** The battery pack shall supply the peak electrical power demand of hover at maximum takeoff mass without cell voltage falling below the cell minimum voltage.
  - **PWR-008** The battery management system shall command landing when any cell voltage falls to [TBD] V under load.
  - **PWR-009** The battery management system shall command landing when any cell temperature reaches [TBD] degC.
    - **PWR-010** The battery pack shall provide at least one temperature sensor per [TBD] cells.
  - **PWR-024** The battery pack shall be transported and stored in a container that limits the effect of a cell fire, to be selected.
- **PWR-002** The mission energy budget shall hold a landing reserve of 20 percent of pack usable energy.
- **PWR-005** The battery pack mass, including wiring and enclosure, shall not exceed 4.1 kg.
- **PWR-011** The battery management system shall report pack voltage, current and the lowest cell voltage to the flight controller at a rate of at least [TBD] Hz.
  - **PWR-012** The flight controller shall compute remaining usable energy and display it to the remote pilot.
    - **PWR-013** The ground station shall alert the remote pilot when remaining usable energy falls to the reserve in PWR-002.
- **PWR-014** The power distribution shall interrupt any branch whose current exceeds its rating for longer than [TBD] ms.
  - **PWR-015** Each power distribution branch shall be rated for at least [TBD] times its maximum continuous current.
- **PWR-016** The power distribution shall have an efficiency of at least [TBD] percent at the average cruise load.
- **PWR-017** The power distribution shall supply the flight controller and radio link from a regulated bus of [TBD] V.
  - **PWR-018** The avionics bus shall hold voltage within [TBD] percent during a motor current step from idle to maximum.
  - **PWR-019** The flight controller shall continue operating for at least [TBD] ms after the avionics bus falls below its minimum voltage.
- **PWR-020** The vehicle shall provide a physical means of disconnecting battery power to the propulsion system on the ground.
  - **PWR-021** The vehicle shall indicate the propulsion armed state with a visible indicator readable at [TBD] m.
- **PWR-022** Every power connector shall be keyed so that it cannot be mated with reverse polarity.
- **PWR-023** The battery pack retention shall hold the pack against the limit load factors in the strength requirements without release.
- **PWR-025** Each battery pack shall carry a logged cycle count.
  - **PWR-026** Battery packs beyond [TBD] cycles shall not be flown.

## PropulsionReqs

- **PRP-001** The vehicle shall have exactly two rotors, one on each side of the fuselage.
- **PRP-002** The propulsion system shall produce a total thrust of at least 1.3 times the maximum takeoff weight in hover.
  - **PRP-003** Each rotor shall produce at least half of the total thrust in PRP-002 at the rotor operating point.
  - **PRP-004** The sum of both rotor thrusts shall exceed hover weight by the control-authority margin of [TBD] percent.
- **PRP-005** The propulsion system shall produce thrust at least equal to cruise drag at the cruise speed 49 kt with the nacelles at 0 deg.
- **PRP-006** The flight controller shall limit commanded groundspeed to no more than 87 kt.
- **PRP-007** The rotor disk loading at maximum takeoff weight shall not exceed 250 N/m2.
- **PRP-008** The rotor diameter shall be 0.76 m.
  - **PRP-009** Each rotor shall have [TBD] blades.
- **PRP-010** The rotor tip speed shall not exceed [TBD] m/s in any flight condition.
- **PRP-011** The rotor first-flap and in-plane natural frequencies shall differ from 1P, 2P and 3P by at least [TBD] percent across the operating rpm range.
- **PRP-012** Each rotor shall be balanced so that residual hub vibration stays below [TBD] g at operating rpm.
- **PRP-013** The rotor hub and blade retention shall carry centrifugal load at [TBD] percent overspeed with ultimate factor of safety.
  - **PRP-014** The overspeed condition shall be defined as [TBD] percent above maximum rotor speed.
- **PRP-015** Each rotor blade shall be proof tested to [TBD] times its design centrifugal load before first flight.
- **PRP-016** The motor and speed controller together shall have an efficiency of at least 80 percent at the hover operating point.
  - **PRP-017** The motor and speed controller together shall have an efficiency of at least 85 percent at the cruise operating point.
- **PRP-018** Each motor, mount and speed controller shall have a combined mass not exceeding [TBD] kg.
- **PRP-019** The motor winding temperature shall not exceed [TBD] degC during the mission profile.
  - **PRP-020** The speed controller temperature shall not exceed [TBD] degC during the mission profile.
- **PRP-021** The flight controller shall detect loss of thrust on one motor within [TBD] ms.
  - **PRP-022** The flight controller shall command the landing mode after a single motor failure is detected.
- **PRP-023** The speed controller shall accept thrust commands at a rate of at least [TBD] Hz.
  - **PRP-024** The speed controller shall change motor torque within [TBD] ms of a command.
- **PRP-025** The speed controller shall report rpm, current and temperature to the flight controller at at least [TBD] Hz.
- **PRP-026** The vehicle shall have a means of keeping persons away from the rotors during ground handling, to be selected.
- **PRP-027** The vehicle sound level at 15 m in hover shall not exceed [TBD] dBA.
- **PRP-028** The rotor shall not windmill into an unstable condition when the motor is unpowered in cruise.
- **PRP-029** Each rotor shall operate continuously at every nacelle angle in the STOL range with the in-plane inflow of that condition.

## TiltReqs

- **TLT-001** Each nacelle shall rotate through at least 0 to 90 deg of tilt angle, where 0 deg is the cruise position and 90 deg is the hover position.
  - **TLT-002** Each tilt actuator shall hold the commanded angle within [TBD] deg.
  - **TLT-024** Each nacelle shall hold any commanded angle between 0 and 90 deg continuously for at least [TBD] minutes.
    - **TLT-025** Each tilt mechanism shall carry the rotor loads at every angle in the STOL range for the full mission duration.
- **TLT-003** Each nacelle shall tilt at a rate of at least [TBD] deg/s under aerodynamic load.
  - **TLT-004** Each nacelle shall tilt at a rate not exceeding [TBD] deg/s.
- **TLT-005** The two nacelle angles shall differ by no more than [TBD] deg at any time during conversion.
  - **TLT-006** The flight controller shall detect a nacelle angle split above the limit in TLT-005 within [TBD] ms.
    - **TLT-007** The flight controller shall hold both nacelles at their current angles when a split above the limit is detected.
- **TLT-008** Each tilt actuator shall produce a holding and driving torque of at least [TBD] N-m at the worst-case load of the conversion corridor.
  - **TLT-009** The worst-case tilt load shall be determined from rotor thrust, gyroscopic moment and aerodynamic hinge moment, with the result recorded as [TBD] N-m.
- **TLT-010** Each nacelle shall have a position sensor that reports tilt angle to the flight controller at a rate of at least [TBD] Hz.
  - **TLT-011** The nacelle position sensor shall measure angle within [TBD] deg.
- **TLT-012** On loss of tilt actuator power the nacelle shall hold its last angle.
  - **TLT-013** The tilt actuator shall resist back-driving by aerodynamic load with the power off up to the load of TLT-009.
- **TLT-014** The nacelle tilt mechanism stiffness shall be at least [TBD] N-m/rad about the pitch axis.
  - **TLT-015** The tilt mechanism free play shall not exceed [TBD] deg.
- **TLT-016** The nacelle tilt mechanism shall carry the limit load without detrimental deformation and the ultimate load without failure.
- **TLT-017** The tilt actuator and mechanism, per side, shall have a mass not exceeding [TBD] kg.
- **TLT-018** Each tilt actuator shall draw no more than [TBD] W averaged over the mission profile.
- **TLT-019** Each nacelle shall have mechanical end stops at the limits of the tilt range of TLT-001.
- **TLT-020** The flight controller shall verify nacelle angle against known end stop positions during preflight checks.
- **TLT-021** The tilt mechanism shall complete at least [TBD] conversion cycles without maintenance.
- **TLT-022** The flight controller shall schedule nacelle angle as a function of airspeed within the conversion corridor, to be defined.
  - **TLT-023** The flight controller shall return the nacelles to the hover position when the conversion leaves the corridor.

## PayloadReqs

- **PLD-001** The nose gimbal shall carry one payload sensor that is replaceable by the operator without modifying the airframe or gimbal.
  - **PLD-002** The gimbal payload interface shall define one mounting pattern, with dimensions and fastener type of [TBD], for every supported sensor.
  - **PLD-003** A trained operator shall exchange the payload sensor in no more than [TBD] minutes using only the tools listed in the maintenance manual.
  - **PLD-004** The gimbal payload interface shall provide regulated power at [TBD] V and no more than [TBD] W to the sensor.
  - **PLD-005** The gimbal payload interface shall provide a data connection of type [TBD] with a minimum throughput of [TBD] Mbit/s.
    - **PLD-006** The flight controller shall identify the installed sensor type within [TBD] s of power-up.
      - **PLD-007** The flight controller shall load a stored profile for the identified sensor containing its mass, center of gravity offset and power draw.
        - **PLD-008** The flight controller shall block takeoff when the installed sensor has no stored profile and no manual mass entry.
  - **PLD-009** The gimbal shall support a payload sensor of mass up to [TBD] kg.
    - **PLD-010** The gimbal shall support a payload sensor within an envelope of [TBD] mm by [TBD] mm by [TBD] mm.
    - **PLD-011** The gimbal control shall tune to any sensor mass within the range in PLD-009 using the stored profile.
  - **PLD-021** The aircraft shall record the sensor identifier in the flight log for each flight.
  - **PLD-022** The program shall maintain a list of supported sensors, each with a completed profile and a verification record.
- **PLD-012** The takeoff mass requirement shall be met with the heaviest supported payload sensor.
- **PLD-013** The gimbal shall point the payload sensor in pitch over at least [TBD] deg and in yaw over at least [TBD] deg.
  - **PLD-014** The gimbal shall hold the commanded pointing angle within [TBD] deg during hover and cruise.
  - **PLD-015** The gimbal shall isolate the sensor from aircraft angular motion to within [TBD] deg rms.
- **PLD-016** The gimbal and sensor shall not contact the rotors, airframe or ground in any gimbal position or any tilt position.
- **PLD-017** The gimbal and payload sensor together shall draw no more than [TBD] W averaged over the mission.
- **PLD-018** The gimbal yaw command shall be added to the boundary variables with a unit, range, latency and tolerance.
- **PLD-019** The flight controller shall continue flight when the payload sensor or gimbal fails.
- **PLD-020** The sensor mount shall retain the sensor in all flight and landing load cases of the strength requirements.
- **FPV-001** The vehicle shall carry a forward-looking FPV camera, separate from the payload sensor, that provides live video to the remote pilot.
  - **FPV-002** The FPV camera shall have a horizontal field of view of at least [TBD] deg.
  - **FPV-003** The end-to-end FPV video latency from camera to pilot display shall not exceed [TBD] ms.
  - **FPV-004** The FPV video shall have a resolution of at least [TBD] by [TBD] pixels at [TBD] frames per second.
  - **FPV-005** The FPV camera shall be mounted so that the nacelles, rotors and gimbal do not block more than [TBD] percent of its field of view.
  - **FPV-006** The video link shall operate at the range of the visual line of sight limit with the margin of [TBD] dB.
  - **FPV-008** The FPV camera and transmitter shall draw no more than [TBD] W.
  - **FPV-009** The video display shall overlay airspeed, altitude, remaining energy, nacelle angle and static margin status.
  - **FPV-010** The flight controller shall indicate loss of the video link to the pilot within [TBD] s.
- **FPV-007** The remote pilot shall maintain visual line of sight with the aircraft while FPV video is in use.

## StabilityReqs

- **STB-001** The flight controller shall estimate the longitudinal static margin, expressed as a fraction of mean aerodynamic chord, before takeoff and during flight.
  - **STB-002** The flight controller shall estimate the aircraft center of gravity from the stored component masses and positions, including the battery position and the installed sensor profile.
    - **STB-003** The center of gravity estimate shall be accurate to within [TBD] percent of mean aerodynamic chord.
    - **STB-004** The aircraft shall detect the battery position in its tray or accept a position entered by the operator.
  - **STB-005** The flight controller shall estimate the neutral point from an aerodynamic model scheduled with nacelle tilt angle and airspeed.
    - **STB-006** The neutral point estimate shall be accurate to within [TBD] percent of mean aerodynamic chord.
  - **STB-007** The flight controller shall refine the static margin estimate in flight from measured trim and pitch response.
    - **STB-008** The static margin estimate shall be updated at least every [TBD] s during flight.
  - **STB-009** The minimum and maximum acceptable static margins shall be defined for the hover, conversion and cruise modes as [TBD].
    - **STB-010** The flight controller shall inhibit takeoff when the estimated static margin is outside the limits of STB-009 for the planned configuration.
    - **STB-011** The flight controller shall give the remote pilot a caution when the estimated static margin comes within [TBD] of a limit.
    - **STB-012** The flight controller shall give the remote pilot an alert within [TBD] s when the estimated static margin is outside a limit in flight.
      - **STB-013** The flight controller shall command the landing mode when an alert persists for more than [TBD] s.
    - **STB-022** The static margin limits shall be defined for each nacelle angle in the STOL range.
  - **STB-014** The flight controller shall report a confidence level with each static margin estimate.
    - **STB-020** The flight controller shall give a caution when the static margin confidence is low.
  - **STB-015** The operator shall be able to confirm the estimate by a ground balance check.
    - **STB-021** The flight controller shall accept a measured center of gravity as an input to the estimate.
  - **STB-016** The aircraft shall log the static margin estimate, its confidence and its inputs throughout every flight.
  - **STB-017** The static margin estimate shall be compared with flight test results at [TBD] configurations before release.
  - **STB-018** The ground station shall display static margin, its limits and its confidence to the remote pilot.

## OperationsReqs

- **OPS-001** The vehicle shall operate in four takeoff and landing modes: CTOL, STOL, VTOL and C/VTOL.
  - **OPS-002** CTOL shall mean takeoff and landing with the nacelles at a fixed forward angle of [TBD] deg and a ground roll.
    - **OPS-005** The vehicle shall have landing gear that supports the aircraft on the ground in CTOL mode.
      - **OPS-006** The takeoff ground roll in CTOL mode shall not exceed [TBD] m on [TBD] surface.
      - **OPS-007** The landing ground roll in CTOL mode shall not exceed [TBD] m on [TBD] surface.
      - **OPS-023** The landing gear shall carry the limit load of a STOL landing at a descent rate of [TBD] m/s and a forward speed of [TBD] kt without detrimental deformation.
    - **OPS-008** The rotors shall clear the ground by at least [TBD] mm in CTOL takeoff and landing attitudes.
    - **OPS-009** The rotation speed and approach speed for CTOL mode shall be determined by flight test and recorded in the flight manual.
    - **OPS-010** The landing gear shall carry the limit load of a landing at a descent rate of [TBD] m/s without detrimental deformation.
  - **OPS-003** VTOL shall mean takeoff and landing with the nacelles at 90 deg and no ground roll, with conversion to cruise in flight.
    - **OPS-011** The vehicle shall take off and land vertically from a flat surface within a [TBD] m diameter circle.
    - **OPS-012** VTOL takeoff and landing shall be possible in steady wind up to [TBD] kt and gusts up to [TBD] kt.
  - **OPS-004** C/VTOL shall mean a flight that includes transition between hover and cruise and that can take off in one of CTOL or VTOL and land in the other.
    - **OPS-013** In C/VTOL mode the flight controller shall accept the landing mode selection in flight and configure the nacelles to match.
  - **OPS-014** The remote pilot shall select CTOL, STOL, VTOL or C/VTOL before takeoff.
    - **OPS-015** The ground station shall display the selected mode and the associated limits.
    - **OPS-018** The flight controller shall not change the takeoff and landing selection during flight except as in OPS-013.
  - **OPS-016** The flight controller shall not arm until the preflight checklist for the selected mode is complete.
  - **OPS-017** The flight controller shall apply the envelope limits for the selected mode.
  - **OPS-019** STOL shall mean takeoff and landing with the nacelles at a partially tilted angle between the CTOL and VTOL angles and a ground roll shorter than the CTOL ground roll.
    - **OPS-020** The flight controller shall allow the remote pilot to select a STOL nacelle angle between [TBD] deg and [TBD] deg.
    - **OPS-021** The takeoff ground roll in STOL mode shall not exceed [TBD] m on [TBD] surface at the maximum STOL takeoff mass.
    - **OPS-022** The landing ground roll in STOL mode shall not exceed [TBD] m on [TBD] surface.
    - **OPS-024** The rotors shall clear the ground by at least [TBD] mm at every STOL nacelle angle and takeoff and landing attitude.
    - **OPS-025** The flight controller shall schedule nacelle angle with airspeed during the STOL ground roll and approach.
    - **OPS-026** The rotation speed and approach speed for STOL mode shall be determined by flight test and recorded in the flight manual.
    - **OPS-027** The flight controller shall apply the STOL envelope limits for speed, attitude and nacelle angle when STOL is selected.
- **CHK-001** The program shall provide a preflight checklist for each of CTOL, STOL, VTOL and C/VTOL.
  - **CHK-003** Every checklist item shall trace to a requirement or hazard it protects.
  - **CHK-004** The ground station shall present the checklist for the selected mode and record each item as complete.
    - **CHK-005** The ground station shall store the completed checklist with the flight record.
  - **CHK-006** The flight controller shall check automatically every preflight item that has a sensor and mark it complete or failed.
  - **CHK-007** The program shall provide a printed form of each checklist.
  - **CHK-008** Each checklist shall carry a revision identifier.
    - **CHK-009** The ground station shall show the revision of the checklist in use.
- **CHK-002** The program shall provide a postflight checklist for each of CTOL, STOL, VTOL and C/VTOL.

## ControlReqs

- **FCS-001** The flight controller shall stabilize attitude in hover using differential rotor thrust and nacelle tilt.
  - **FCS-002** The control system shall produce a pitch moment of at least [TBD] N-m in hover at maximum takeoff weight.
  - **FCS-003** The control system shall produce a roll moment of at least [TBD] N-m in hover at maximum takeoff weight.
  - **FCS-004** The control system shall produce a yaw moment of at least [TBD] N-m in hover at maximum takeoff weight.
  - **FCS-005** The flight controller shall hold attitude within [TBD] deg in hover in steady wind up to the VTOL wind limit.
  - **FCS-006** The attitude control loop in hover shall have a bandwidth of at least [TBD] rad/s.
    - **FCS-007** The attitude loops in hover shall have a gain margin of at least [TBD] dB and a phase margin of at least [TBD] deg.
  - **FCS-026** The time from sensor sample to actuator command shall not exceed [TBD] ms.
  - **FCS-027** The attitude control loop shall run at a rate of at least [TBD] Hz.
  - **FCS-030** The flight controller shall control attitude with the nacelles held at any angle in the STOL range.
- **FCS-008** The flight controller shall control attitude and altitude through the whole conversion corridor.
  - **FCS-009** The attitude loops shall meet the margins of FCS-007 at every nacelle angle in the corridor.
  - **FCS-010** The flight controller shall schedule control gains on nacelle angle and airspeed.
  - **FCS-011** The flight controller shall keep altitude within [TBD] m during conversion.
- **FCS-012** The flight controller shall stabilize attitude and airspeed in cruise using control surfaces and rotor thrust.
  - **FCS-013** The flight controller shall hold airspeed within [TBD] kt in cruise.
- **FCS-014** The flight controller shall implement the FlightModes state definition and reject any transition not in it.
  - **FCS-015** The flight controller shall start in the hover mode after power-up with the nacelles at the hover angle or after the nacelles are driven there.
- **FCS-016** The flight controller shall offer manual-attitude, assisted and automatic landing control modes to the remote pilot.
  - **FCS-017** The flight controller shall command the return and land mode if the control link is lost for more than [TBD] s.
    - **FCS-018** The landing mode shall bring the aircraft to the ground in the selected landing mode.
- **FCS-019** The flight controller shall prevent altitude above 400 ft AGL.
  - **FCS-020** The flight controller shall apply a geofence of [TBD] m horizontal radius around the takeoff point.
- **FCS-021** The flight controller shall warn the pilot when the aircraft nears the visual range limit of [TBD] m.
- **FCS-022** The flight controller shall estimate attitude, position, velocity and airspeed with the accuracies in the boundary variable table.
  - **FCS-023** The attitude estimate shall be accurate to within [TBD] deg.
  - **FCS-024** The aircraft shall measure airspeed using a sensor that works in hover and cruise.
  - **FCS-025** The flight controller shall use at least [TBD] independent sources for attitude.
    - **FCS-029** The flight controller shall detect a failed attitude source within [TBD] ms.
- **FCS-028** The flight controller shall prevent integrator windup when any effector is saturated.

## AeroReqs

- **AER-001** The program shall maintain an aerodynamic model of the vehicle valid over the nacelle angle range of 0 to 90 deg and the full flight envelope.
  - **AER-002** The aerodynamic model shall be built from computational analysis and corrected with wind tunnel or flight test data.
  - **AER-003** The aerodynamic model shall state an uncertainty for every coefficient used in control design.
  - **AER-023** The aerodynamic model shall be valid for the STOL angle range, including rotor wake on the wing and ground effect.
    - **AER-024** The STOL takeoff and landing distances shall be computed and recorded as [TBD] m.
- **AER-004** The vehicle lift-to-drag ratio at the cruise point shall be at least 10.
- **AER-005** The wing area shall be [TBD] m2.
  - **AER-006** The wing span shall be [TBD] m.
  - **AER-007** The stall speed at maximum takeoff weight shall not exceed [TBD] kt.
- **AER-008** The conversion corridor shall be defined as the airspeed range allowed at each nacelle angle, recorded as [TBD].
  - **AER-009** The lower corridor boundary shall be set by the wing stall margin of [TBD] percent.
  - **AER-010** The upper corridor boundary shall be set by the rotor loading and flutter margin limits.
- **AER-011** The program shall assess the rotor wake effect on the wing, tail and FPV camera in hover and conversion.
  - **AER-012** The program shall assess the ground effect and recirculation in VTOL takeoff and landing.
- **AER-013** The tail and control surface sizes shall give a static margin within the limits of STB-009 at every nacelle angle.
  - **AER-014** The aircraft shall be trimmable in pitch at every nacelle angle within the corridor.
  - **AER-015** Each control surface shall provide at least [TBD] of the control power needed for FCS-012.
- **AER-016** The vehicle shall meet its stall and takeoff requirements in CTOL mode with the nacelles at the CTOL angle.
- **AER-017** The program shall maintain a drag build-up for the vehicle with each supported payload sensor.
- **AER-018** The electrical power in cruise shall be computed and recorded as 824 W.
- **AER-019** The electrical power in hover shall be computed and recorded as 3545 W.
  - **AER-020** The electrical power in conversion shall be computed and recorded as [TBD] W.
- **AER-021** The mission profile used for endurance shall be defined by 2 minutes of hover and conversion and 28 minutes of cruise.
- **AER-022** The vehicle shall remain controllable in winds up to [TBD] kt in cruise.

## StructureReqs

- **STR-001** The program shall define the structural load cases for hover, conversion, cruise, gusts, landing and ground handling.
  - **STR-002** The limit load factors shall be [TBD] in the positive and [TBD] in the negative direction.
- **STR-003** The ultimate factor of safety shall be [TBD] times limit load.
  - **STR-004** Every structural margin of safety shall be reported with the load case and failure mode.
- **STR-005** The wing and its attachment shall carry the limit loads without detrimental deformation and the ultimate loads without failure.
- **STR-006** The nacelle support structure shall carry the limit and ultimate loads, including rotor thrust, torque and gyroscopic moments.
- **STR-007** The fuselage shall carry the limit and ultimate loads, including battery and payload inertia loads.
- **STR-008** The gimbal mount shall carry the limit and ultimate loads with the heaviest supported sensor.
- **STR-009** Joint and fastener allowables shall be based on test data or the material source recorded in the stress report.
- **STR-010** Material allowables shall be taken from a recorded source and a knockdown for [TBD].
- **STR-011** The structure shall be tested to limit load before first flight.
  - **STR-012** The structure test article shall be tested to ultimate load, or to a reduced level of [TBD] percent of ultimate if a full test is not practical.
  - **STR-013** The structural test shall record strain and deflection at [TBD] locations.
- **STR-014** The primary structure shall have a fatigue life of at least [TBD] flight hours.
- **STR-015** The structure shall have no resonance within [TBD] percent of the rotor harmonics.
  - **STR-016** A ground vibration test shall measure the natural frequencies and mode shapes of the assembled aircraft.
- **STR-017** Whirl flutter margin shall be at least [TBD] percent on airspeed or rotor speed.
  - **STR-018** The flutter analysis model shall include the stiffness of the nacelle, tilt mechanism and wing, with the rotor and gyroscopic effects.
  - **STR-019** The flutter analysis model shall be updated with the ground vibration test results before flight.
  - **STR-020** The flutter analysis shall cover every nacelle tilt angle from 0 to 90 deg.
  - **STR-021** The flutter analysis shall cover the lightest and heaviest supported payload sensor.
  - **STR-026** The flutter analysis shall cover sustained operation at every nacelle angle in the STOL range, including the ground roll.
- **STR-022** The program shall maintain a mass budget with a margin of 15 percent at PDR, reduced at later reviews.
  - **STR-023** The program shall record the mass, center of gravity and inertia of each component.
- **STR-024** The structure shall withstand a landing at a descent rate of [TBD] m/s in VTOL mode without damage to the battery or sensor.
- **STR-025** The structure shall limit the damage from a blade strike on the ground to a repairable level.

## AvionicsReqs

- **AVN-001** The aircraft shall have a control link between the ground station and the flight controller.
  - **AVN-002** The control link shall operate at a range of at least [TBD] m with the margin of [TBD] dB.
  - **AVN-003** The control link latency shall not exceed [TBD] ms.
  - **AVN-004** The control link shall operate on a frequency band permitted for unlicensed use in the area of operation.
  - **AVN-005** The control link shall authenticate commands so that only the paired ground station can control the aircraft.
  - **AVN-006** The flight controller shall detect control link loss within [TBD] ms.
  - **AVN-007** The aircraft shall send telemetry to the ground station at a rate of at least [TBD] Hz.
- **AVN-008** The aircraft shall have a satellite navigation receiver that reports position to the flight controller.
  - **AVN-009** The satellite navigation position shall be accurate to within [TBD] m.
  - **AVN-010** The flight controller shall continue attitude control when the satellite navigation is lost.
    - **AVN-026** The flight controller shall alert the remote pilot within [TBD] s of satellite navigation loss.
- **AVN-011** The aircraft shall have an inertial measurement unit with a gyro range of at least [TBD] deg/s and an accelerometer range of at least [TBD] g.
  - **AVN-012** The inertial measurement unit shall be mounted with vibration isolation that gives noise below [TBD] at rotor harmonics.
- **AVN-013** The aircraft shall measure heading.
  - **AVN-027** The heading measurement shall stay accurate to within [TBD] deg with the motors at full power.
- **AVN-014** The aircraft shall have a barometric altitude sensor protected from rotor wash.
- **AVN-015** The aircraft shall measure height above ground to within [TBD] m below [TBD] m altitude.
- **AVN-016** The flight controller shall have a watchdog that resets the processor and returns to a safe state within [TBD] ms of a software hang.
- **AVN-017** The remote pilot shall be able to stop all motors from the ground station in at most [TBD] s.
  - **AVN-018** The motor stop in flight shall require a deliberate action by the pilot.
- **AVN-019** The aircraft shall broadcast remote identification where required by the rules of the area of operation.
- **AVN-020** The aircraft shall carry lights visible for [TBD] statute miles if operated at night.
- **AVN-021** The aircraft shall log flight data at a rate of at least [TBD] Hz for the whole flight.
  - **AVN-022** The data logger shall hold at least [TBD] hours of data and keep it after a power loss.
- **AVN-023** The avionics shall have a total mass of not more than [TBD] kg.
- **AVN-024** The avionics shall draw no more than [TBD] W on average.
- **AVN-025** The avionics shall tolerate the electromagnetic emissions of the motors and speed controllers during operation.

## SoftwareReqs

- **SWR-001** The flight software shall be developed according to a recorded process that defines requirements, design, review, test and configuration control.
  - **SWR-002** The program shall assign a development assurance level to the flight software and record the reason.
  - **SWR-003** Each software requirement shall trace to a vehicle requirement and to at least one test.
  - **SWR-004** All flight software changes shall be reviewed by a person other than the author before release.
  - **SWR-005** The flight software shall pass static analysis with no open high-severity findings at release.
  - **SWR-006** Each flight software function that affects control or mode logic shall have a unit test.
  - **SWR-007** The flight software shall pass a hardware-in-the-loop test of every mode transition before first flight.
    - **SWR-008** A simulation with the aerodynamic model shall test each mode transition and each failure response.
  - **SWR-009** Each flight software build shall carry a version identifier and a hash that the ground station displays.
    - **SWR-010** The preflight checklist shall confirm the software version matches the approved release.
  - **SWR-011** Flight parameters shall be stored with a checksum.
    - **SWR-012** The parameter set used shall be recorded in the flight log.
    - **SWR-023** The flight controller shall refuse to arm with an invalid parameter checksum.
  - **SWR-021** The test suite shall run after each software change.
    - **SWR-024** The test suite shall pass before a flight software release.
  - **SWR-022** The ground station software shall be developed under the same process as the flight software or a recorded equivalent.
- **SWR-013** The flight control task shall complete within its period with a margin of [TBD] percent.
  - **SWR-014** The processor load shall not exceed [TBD] percent in any flight mode.
- **SWR-015** The flight software shall detect and report faults in sensors, actuators, power and link, each with a defined response.
  - **SWR-016** The faults and responses shall be listed in a fault table that is reviewed at PDR and CDR.
- **SWR-017** The ground station shall show faults, cautions and alerts with a distinct display and sound for each level.
- **SWR-018** The ground station shall display the flight mode and nacelle angle at all times.
- **SWR-020** The software shall use only boundary variable values defined in the vehicle model for its limits.

## InterfaceReqs

- **INT-001** The battery output port shall connect to the power distribution input port through a connector rated for at least [TBD] A continuous.
  - **INT-002** The battery to power distribution connection shall carry a nominal voltage of [TBD] V with a range of [TBD] to [TBD] V.
  - **INT-003** The voltage drop across the battery to power distribution connection shall not exceed [TBD] V at peak current.
  - **INT-004** The battery to power distribution connection shall have a fuse or equivalent protection rated at [TBD] A.
- **INT-005** The power distribution left nacelle port shall connect to the left nacelle power input through a connector rated for at least [TBD] A continuous.
  - **INT-006** The power distribution right nacelle port shall connect to the right nacelle power input through a connector rated for at least [TBD] A continuous.
  - **INT-007** The nacelle power harness shall allow the full 0 to 90 deg tilt for at least [TBD] cycles without conductor failure.
  - **INT-008** The nacelle power harness shall be routed so that it cannot contact the rotor or be pinched at any tilt angle.
  - **INT-009** The left and right nacelle power paths shall have resistance within [TBD] percent of each other.
- **INT-010** The power distribution flight controller port shall connect to the flight controller power input on the avionics bus of [TBD] V.
  - **INT-011** The flight controller shall accept power from [TBD] independent sources.
- **INT-013** The power distribution gimbal port shall connect to the gimbal power input at a voltage of [TBD] V and a current limit of [TBD] A.
  - **INT-014** The gimbal power branch shall limit current to [TBD] A so that a payload fault does not drop the avionics bus.
- **INT-015** The radio link pilot command port shall connect to the flight controller pilot command input using a serial protocol of [TBD] at a rate of [TBD] baud.
  - **INT-016** The pilot command shall pass from the radio link to the flight controller within [TBD] ms.
  - **INT-017** The flight controller shall treat the absence of valid pilot command frames for more than [TBD] ms as link loss.
- **INT-018** The flight controller left tilt command port shall connect to the left nacelle tilt command input using a protocol of [TBD] at a rate of at least [TBD] Hz.
  - **INT-019** The flight controller right tilt command port shall connect to the right nacelle tilt command input using the protocol and rate of INT-018.
  - **INT-020** The tilt command shall be in degrees with a resolution of at least [TBD] deg.
  - **INT-021** The nacelle shall hold its last angle if no tilt command is received for [TBD] ms.
- **INT-022** The flight controller gimbal command port shall connect to the gimbal command input using a protocol of [TBD] at a rate of at least [TBD] Hz.
  - **INT-023** The gimbal command shall be in degrees of pitch and yaw with a resolution of at least [TBD] deg.
  - **INT-024** The gimbal shall hold its last position if no command is received for [TBD] ms.
- **INT-025** The payload sensor connector shall be keyed.
  - **INT-026** The payload sensor connector shall survive at least [TBD] mating cycles.
  - **INT-027** The payload interface shall prevent damage if a sensor is connected or disconnected with power on.
  - **INT-043** The payload sensor connector shall carry power and data together.
- **INT-028** The payload interface shall transfer the sensor identifier, mass and center of gravity offset from the sensor to the flight controller on connection.
- **INT-030** The FPV camera shall connect to the video transmitter with a video interface of [TBD].
- **INT-031** The FPV camera and transmitter shall be powered from the avionics bus through a filter that keeps motor noise out of the video.
- **INT-032** Each speed controller shall connect to its motor through three phase wires of at least [TBD] AWG with a length not more than [TBD] mm.
- **INT-033** The flight controller shall connect to each speed controller through a command interface of [TBD] at a rate of at least [TBD] Hz.
- **INT-036** The flight controller shall detect an open or short circuit in a nacelle position sensor within [TBD] ms.
- **INT-038** The flight controller shall treat loss of battery management data for more than [TBD] ms as a fault.
- **INT-039** The flight controller shall receive the weight-on-wheels state from at least [TBD] sensors on the landing gear.
  - **INT-040** The flight controller shall treat disagreeing weight-on-wheels sensors as a fault.
- **INT-041** Every connector on the vehicle shall have a locking feature that resists the vibration of PRP-012.
- **INT-042** The program shall maintain an interface control document that lists every connection, its signals, protocol and limits.

## FailureReqs

- **FLT-001** The program shall maintain a failure modes and effects analysis for every item in the architecture.
  - **FLT-002** The failure modes and effects analysis shall be reviewed at PDR and CDR.
  - **FLT-003** The program shall maintain a hazard list with severity, likelihood and a mitigation for each hazard.
    - **FLT-036** The pilot shall plan a landing area within [TBD] m of the flight path for every flight.
- **FLT-005** The flight controller shall alert the pilot within [TBD] ms of a motor failure.
- **FLT-006** The flight controller shall keep attitude within [TBD] deg during [TBD] s after a motor failure.
- **FLT-007** The flight controller shall command a glide to a landing with the control surfaces after both motors fail in cruise.
  - **FLT-008** The glide ratio with both motors stopped shall be at least [TBD].
  - **FLT-009** The flight controller shall command a controlled descent to the extent possible if both motors fail in hover.
- **FLT-010** The flight controller shall detect a failed left tilt actuator within [TBD] ms.
  - **FLT-011** The flight controller shall detect a failed right tilt actuator within [TBD] ms.
  - **FLT-012** The flight controller shall hold the other nacelle at the angle that gives the least asymmetry.
  - **FLT-013** The stuck nacelle angles from which a safe landing is possible shall be determined by analysis and recorded as [TBD].
  - **FLT-037** The flight controller shall command a landing in the mode that suits the stuck angle.
- **FLT-014** The flight controller shall switch to the other attitude source within [TBD] ms of a failed inertial measurement unit.
  - **FLT-015** The flight controller shall command the motors to a safe state if all attitude sources fail.
- **FLT-017** The flight controller shall use a groundspeed and attitude based estimate if the airspeed sensor fails.
  - **FLT-038** The flight controller shall alert the pilot when the airspeed sensor fails.
- **FLT-018** The flight controller shall use the barometric altitude when the height sensor fails below [TBD] m.
- **FLT-021** The power distribution shall isolate a shorted branch without losing the avionics bus.
- **FLT-022** The aircraft shall command the motors to a safe state when the avionics bus is lost.
- **FLT-024** The flight controller shall return pilot control when the link returns and the pilot confirms.
- **FLT-025** The flight controller shall hold the gimbal in a safe position when the gimbal fails.
- **FLT-027** The flight controller shall continue the flight when the FPV camera fails.
  - **FLT-040** The flight controller shall alert the pilot when the FPV camera fails.
- **FLT-028** The flight controller shall restart in flight within [TBD] ms of a watchdog reset and resume control.
- **FLT-030** The flight controller shall continue to arm and fly with a failed weight-on-wheels sensor and alert the pilot.
- **FLT-031** The flight controller shall keep the current landing mode if a mode change in flight cannot be completed.
- **FLT-032** The flight controller shall return the nacelles to the hover position if the airspeed falls below the corridor floor in conversion.
- **FLT-033** The flight controller shall limit airspeed to the corridor ceiling during conversion.
- **FLT-034** The structure shall contain the loss of one rotor blade without damage to the battery or flight controller.
- **FLT-035** The aircraft shall keep a battery fire from reaching the flight controller and payload for at least [TBD] s.
- **FLT-039** The flight controller shall alert the pilot when the payload sensor fails.

## EnvironmentReqs

- **ENV-001** The vehicle shall operate with ambient temperatures from [TBD] to [TBD] degC.
  - **ENV-002** The battery shall be used only between [TBD] and [TBD] degC pack temperature.
- **ENV-003** The vehicle shall survive storage between [TBD] and [TBD] degC without damage.
- **ENV-004** The vehicle shall not be flown in rain unless demonstrated for it.
- **ENV-005** The vehicle shall meet its performance requirements up to a density altitude of [TBD] m.
- **ENV-006** The vehicle shall not be flown in conditions that produce icing.
- **ENV-007** The vehicle shall be flown only in gusts below [TBD] kt.
- **ENV-008** The vehicle shall be flown only in daylight unless night operation is added and the lights of AVN-020 are fitted.
- **ENV-009** The vehicle in its transport case shall survive [TBD] g shock and [TBD] vibration profile without damage.
- **ENV-010** The vehicle shall have protection of [TBD] against dust at the motors and tilt mechanism.
- **ENV-011** The vehicle shall operate within the electromagnetic environment of [TBD].
- **ENV-012** The vehicle structure shall be inspected after any bird or object strike.
- **MNT-001** The program shall maintain a maintenance manual with inspection, repair and parts replacement procedures.
  - **MNT-002** The maintenance manual shall state an inspection interval for each life-limited or wear item.
    - **MNT-003** The program shall list every life-limited part with its limit in flight hours or cycles.
  - **MNT-004** Every item inspected before flight shall be reachable without removing the wings or rotors.
  - **MNT-005** Every critical fastener shall carry a witness mark that shows loosening.
  - **MNT-006** The program shall maintain a list of spare parts needed to repair the most likely damage within [TBD] hours.
  - **MNT-007** The program shall record the configuration of each flight including the sensor, battery, software version and parameters.
  - **MNT-008** Every damage event shall be recorded and its effect on airworthiness assessed before the next flight.
  - **MNT-009** The vehicle shall be transportable in a case of [TBD] by [TBD] by [TBD] mm.
    - **MNT-010** A trained operator shall assemble the vehicle from its case in at most [TBD] minutes.
    - **MNT-011** Parts that can be assembled in more than one way shall be keyed so that only the right one fits.
  - **MNT-012** The program shall define the calibrations for the inertial sensors, nacelle sensors and gimbal.
    - **MNT-013** The program shall record the result of each calibration.
