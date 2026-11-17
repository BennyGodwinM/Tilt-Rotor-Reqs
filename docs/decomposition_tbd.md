# Decomposition TBD register

One row per requirement that carries an open value. Close a row by replacing the [TBD] in tools/decomp and regenerating.

| # | ID | Open values | Basis | Needed by | Requirement |
|---|---|---|---|---|---|
| 1 | PWR-003 | 1 | placeholder | PDR | The battery pack shall use lithium-polymer or lithium-ion cells [TBD chemistry]. |
| 2 | PWR-008 | 1 | placeholder | CDR | The battery management system shall command landing when any cell voltage falls to [TBD] V under load. |
| 3 | PWR-009 | 1 | placeholder | CDR | The battery management system shall command landing when any cell temperature reaches [TBD] degC. |
| 4 | PWR-010 | 1 | placeholder | PDR | The battery pack shall provide at least one temperature sensor per [TBD] cells. |
| 5 | PWR-011 | 1 | placeholder | CDR | The battery management system shall report pack voltage, current and the lowest cell voltage to the flight controller at a rate of at least [TBD] Hz. |
| 6 | PWR-014 | 1 | placeholder | CDR | The power distribution shall interrupt any branch whose current exceeds its rating for longer than [TBD] ms. |
| 7 | PWR-015 | 1 | placeholder | PDR | Each power distribution branch shall be rated for at least [TBD] times its maximum continuous current. |
| 8 | PWR-016 | 1 | placeholder | CDR | The power distribution shall have an efficiency of at least [TBD] percent at the average cruise load. |
| 9 | PWR-017 | 1 | placeholder | CDR | The power distribution shall supply the flight controller and radio link from a regulated bus of [TBD] V. |
| 10 | PWR-018 | 1 | placeholder | CDR | The avionics bus shall hold voltage within [TBD] percent during a motor current step from idle to maximum. |
| 11 | PWR-019 | 1 | placeholder | CDR | The flight controller shall continue operating for at least [TBD] ms after the avionics bus falls below its minimum voltage. |
| 12 | PWR-021 | 1 | placeholder | SIR | The vehicle shall indicate the propulsion armed state with a visible indicator readable at [TBD] m. |
| 13 | PWR-026 | 1 | placeholder | ORR | Battery packs beyond [TBD] cycles shall not be flown. |
| 14 | PRP-004 | 1 | placeholder | PDR | The sum of both rotor thrusts shall exceed hover weight by the control-authority margin of [TBD] percent. |
| 15 | PRP-009 | 1 | placeholder | PDR | Each rotor shall have [TBD] blades. |
| 16 | PRP-010 | 1 | placeholder | PDR | The rotor tip speed shall not exceed [TBD] m/s in any flight condition. |
| 17 | PRP-011 | 1 | placeholder | CDR | The rotor first-flap and in-plane natural frequencies shall differ from 1P, 2P and 3P by at least [TBD] percent across the operating rpm range. |
| 18 | PRP-012 | 1 | placeholder | CDR | Each rotor shall be balanced so that residual hub vibration stays below [TBD] g at operating rpm. |
| 19 | PRP-013 | 1 | placeholder | CDR | The rotor hub and blade retention shall carry centrifugal load at [TBD] percent overspeed with ultimate factor of safety. |
| 20 | PRP-014 | 1 | placeholder | PDR | The overspeed condition shall be defined as [TBD] percent above maximum rotor speed. |
| 21 | PRP-015 | 1 | placeholder | SIR | Each rotor blade shall be proof tested to [TBD] times its design centrifugal load before first flight. |
| 22 | PRP-018 | 1 | placeholder | SIR | Each motor, mount and speed controller shall have a combined mass not exceeding [TBD] kg. |
| 23 | PRP-019 | 1 | placeholder | CDR | The motor winding temperature shall not exceed [TBD] degC during the mission profile. |
| 24 | PRP-020 | 1 | placeholder | CDR | The speed controller temperature shall not exceed [TBD] degC during the mission profile. |
| 25 | PRP-021 | 1 | placeholder | CDR | The flight controller shall detect loss of thrust on one motor within [TBD] ms. |
| 26 | PRP-023 | 1 | placeholder | CDR | The speed controller shall accept thrust commands at a rate of at least [TBD] Hz. |
| 27 | PRP-024 | 1 | placeholder | CDR | The speed controller shall change motor torque within [TBD] ms of a command. |
| 28 | PRP-025 | 1 | placeholder | CDR | The speed controller shall report rpm, current and temperature to the flight controller at at least [TBD] Hz. |
| 29 | PRP-027 | 1 | placeholder | ORR | The vehicle sound level at 15 m in hover shall not exceed [TBD] dBA. |
| 30 | TLT-002 | 1 | placeholder | CDR | Each tilt actuator shall hold the commanded angle within [TBD] deg. |
| 31 | TLT-024 | 1 | placeholder | CDR | Each nacelle shall hold any commanded angle between 0 and 90 deg continuously for at least [TBD] minutes. |
| 32 | TLT-003 | 1 | placeholder | CDR | Each nacelle shall tilt at a rate of at least [TBD] deg/s under aerodynamic load. |
| 33 | TLT-004 | 1 | placeholder | CDR | Each nacelle shall tilt at a rate not exceeding [TBD] deg/s. |
| 34 | TLT-005 | 1 | placeholder | CDR | The two nacelle angles shall differ by no more than [TBD] deg at any time during conversion. |
| 35 | TLT-006 | 1 | placeholder | CDR | The flight controller shall detect a nacelle angle split above the limit in TLT-005 within [TBD] ms. |
| 36 | TLT-008 | 1 | placeholder | PDR | Each tilt actuator shall produce a holding and driving torque of at least [TBD] N-m at the worst-case load of the conversion corridor. |
| 37 | TLT-009 | 1 | placeholder | PDR | The worst-case tilt load shall be determined from rotor thrust, gyroscopic moment and aerodynamic hinge moment, with the result recorded as [TBD] N-m. |
| 38 | TLT-010 | 1 | placeholder | CDR | Each nacelle shall have a position sensor that reports tilt angle to the flight controller at a rate of at least [TBD] Hz. |
| 39 | TLT-011 | 1 | placeholder | CDR | The nacelle position sensor shall measure angle within [TBD] deg. |
| 40 | TLT-014 | 1 | placeholder | CDR | The nacelle tilt mechanism stiffness shall be at least [TBD] N-m/rad about the pitch axis. |
| 41 | TLT-015 | 1 | placeholder | SIR | The tilt mechanism free play shall not exceed [TBD] deg. |
| 42 | TLT-017 | 1 | placeholder | SIR | The tilt actuator and mechanism, per side, shall have a mass not exceeding [TBD] kg. |
| 43 | TLT-018 | 1 | placeholder | CDR | Each tilt actuator shall draw no more than [TBD] W averaged over the mission profile. |
| 44 | TLT-021 | 1 | placeholder | CDR | The tilt mechanism shall complete at least [TBD] conversion cycles without maintenance. |
| 45 | PLD-002 | 1 | placeholder | PDR | The gimbal payload interface shall define one mounting pattern, with dimensions and fastener type of [TBD], for every supported sensor. |
| 46 | PLD-003 | 1 | placeholder | ORR | A trained operator shall exchange the payload sensor in no more than [TBD] minutes using only the tools listed in the maintenance manual. |
| 47 | PLD-004 | 2 | placeholder | CDR | The gimbal payload interface shall provide regulated power at [TBD] V and no more than [TBD] W to the sensor. |
| 48 | PLD-005 | 2 | placeholder | CDR | The gimbal payload interface shall provide a data connection of type [TBD] with a minimum throughput of [TBD] Mbit/s. |
| 49 | PLD-006 | 1 | placeholder | CDR | The flight controller shall identify the installed sensor type within [TBD] s of power-up. |
| 50 | PLD-009 | 1 | placeholder | CDR | The gimbal shall support a payload sensor of mass up to [TBD] kg. |
| 51 | PLD-010 | 3 | placeholder | PDR | The gimbal shall support a payload sensor within an envelope of [TBD] mm by [TBD] mm by [TBD] mm. |
| 52 | PLD-013 | 2 | placeholder | CDR | The gimbal shall point the payload sensor in pitch over at least [TBD] deg and in yaw over at least [TBD] deg. |
| 53 | PLD-014 | 1 | placeholder | CDR | The gimbal shall hold the commanded pointing angle within [TBD] deg during hover and cruise. |
| 54 | PLD-015 | 1 | placeholder | CDR | The gimbal shall isolate the sensor from aircraft angular motion to within [TBD] deg rms. |
| 55 | PLD-017 | 1 | placeholder | CDR | The gimbal and payload sensor together shall draw no more than [TBD] W averaged over the mission. |
| 56 | FPV-002 | 1 | placeholder | PDR | The FPV camera shall have a horizontal field of view of at least [TBD] deg. |
| 57 | FPV-003 | 1 | placeholder | CDR | The end-to-end FPV video latency from camera to pilot display shall not exceed [TBD] ms. |
| 58 | FPV-004 | 3 | placeholder | CDR | The FPV video shall have a resolution of at least [TBD] by [TBD] pixels at [TBD] frames per second. |
| 59 | FPV-005 | 1 | placeholder | PDR | The FPV camera shall be mounted so that the nacelles, rotors and gimbal do not block more than [TBD] percent of its field of view. |
| 60 | FPV-006 | 1 | placeholder | CDR | The video link shall operate at the range of the visual line of sight limit with the margin of [TBD] dB. |
| 61 | FPV-008 | 1 | placeholder | CDR | The FPV camera and transmitter shall draw no more than [TBD] W. |
| 62 | FPV-010 | 1 | placeholder | CDR | The flight controller shall indicate loss of the video link to the pilot within [TBD] s. |
| 63 | STB-003 | 1 | placeholder | CDR | The center of gravity estimate shall be accurate to within [TBD] percent of mean aerodynamic chord. |
| 64 | STB-006 | 1 | placeholder | CDR | The neutral point estimate shall be accurate to within [TBD] percent of mean aerodynamic chord. |
| 65 | STB-008 | 1 | placeholder | CDR | The static margin estimate shall be updated at least every [TBD] s during flight. |
| 66 | STB-009 | 1 | placeholder | PDR | The minimum and maximum acceptable static margins shall be defined for the hover, conversion and cruise modes as [TBD]. |
| 67 | STB-011 | 1 | placeholder | CDR | The flight controller shall give the remote pilot a caution when the estimated static margin comes within [TBD] of a limit. |
| 68 | STB-012 | 1 | placeholder | CDR | The flight controller shall give the remote pilot an alert within [TBD] s when the estimated static margin is outside a limit in flight. |
| 69 | STB-013 | 1 | placeholder | CDR | The flight controller shall command the landing mode when an alert persists for more than [TBD] s. |
| 70 | STB-017 | 1 | placeholder | ORR | The static margin estimate shall be compared with flight test results at [TBD] configurations before release. |
| 71 | OPS-002 | 1 | placeholder | PDR | CTOL shall mean takeoff and landing with the nacelles at a fixed forward angle of [TBD] deg and a ground roll. |
| 72 | OPS-006 | 2 | placeholder | CDR | The takeoff ground roll in CTOL mode shall not exceed [TBD] m on [TBD] surface. |
| 73 | OPS-007 | 2 | placeholder | CDR | The landing ground roll in CTOL mode shall not exceed [TBD] m on [TBD] surface. |
| 74 | OPS-023 | 2 | placeholder | CDR | The landing gear shall carry the limit load of a STOL landing at a descent rate of [TBD] m/s and a forward speed of [TBD] kt without detrimental deformation. |
| 75 | OPS-008 | 1 | placeholder | PDR | The rotors shall clear the ground by at least [TBD] mm in CTOL takeoff and landing attitudes. |
| 76 | OPS-010 | 1 | placeholder | CDR | The landing gear shall carry the limit load of a landing at a descent rate of [TBD] m/s without detrimental deformation. |
| 77 | OPS-011 | 1 | placeholder | ORR | The vehicle shall take off and land vertically from a flat surface within a [TBD] m diameter circle. |
| 78 | OPS-012 | 2 | placeholder | ORR | VTOL takeoff and landing shall be possible in steady wind up to [TBD] kt and gusts up to [TBD] kt. |
| 79 | OPS-020 | 2 | placeholder | CDR | The flight controller shall allow the remote pilot to select a STOL nacelle angle between [TBD] deg and [TBD] deg. |
| 80 | OPS-021 | 2 | placeholder | CDR | The takeoff ground roll in STOL mode shall not exceed [TBD] m on [TBD] surface at the maximum STOL takeoff mass. |
| 81 | OPS-022 | 2 | placeholder | CDR | The landing ground roll in STOL mode shall not exceed [TBD] m on [TBD] surface. |
| 82 | OPS-024 | 1 | placeholder | PDR | The rotors shall clear the ground by at least [TBD] mm at every STOL nacelle angle and takeoff and landing attitude. |
| 83 | FCS-002 | 1 | placeholder | PDR | The control system shall produce a pitch moment of at least [TBD] N-m in hover at maximum takeoff weight. |
| 84 | FCS-003 | 1 | placeholder | PDR | The control system shall produce a roll moment of at least [TBD] N-m in hover at maximum takeoff weight. |
| 85 | FCS-004 | 1 | placeholder | PDR | The control system shall produce a yaw moment of at least [TBD] N-m in hover at maximum takeoff weight. |
| 86 | FCS-005 | 1 | placeholder | CDR | The flight controller shall hold attitude within [TBD] deg in hover in steady wind up to the VTOL wind limit. |
| 87 | FCS-006 | 1 | placeholder | CDR | The attitude control loop in hover shall have a bandwidth of at least [TBD] rad/s. |
| 88 | FCS-007 | 2 | placeholder | CDR | The attitude loops in hover shall have a gain margin of at least [TBD] dB and a phase margin of at least [TBD] deg. |
| 89 | FCS-026 | 1 | placeholder | CDR | The time from sensor sample to actuator command shall not exceed [TBD] ms. |
| 90 | FCS-027 | 1 | placeholder | CDR | The attitude control loop shall run at a rate of at least [TBD] Hz. |
| 91 | FCS-011 | 1 | placeholder | CDR | The flight controller shall keep altitude within [TBD] m during conversion. |
| 92 | FCS-013 | 1 | placeholder | CDR | The flight controller shall hold airspeed within [TBD] kt in cruise. |
| 93 | FCS-017 | 1 | placeholder | CDR | The flight controller shall command the return and land mode if the control link is lost for more than [TBD] s. |
| 94 | FCS-020 | 1 | placeholder | CDR | The flight controller shall apply a geofence of [TBD] m horizontal radius around the takeoff point. |
| 95 | FCS-021 | 1 | placeholder | CDR | The flight controller shall warn the pilot when the aircraft nears the visual range limit of [TBD] m. |
| 96 | FCS-023 | 1 | placeholder | CDR | The attitude estimate shall be accurate to within [TBD] deg. |
| 97 | FCS-025 | 1 | placeholder | CDR | The flight controller shall use at least [TBD] independent sources for attitude. |
| 98 | FCS-029 | 1 | placeholder | CDR | The flight controller shall detect a failed attitude source within [TBD] ms. |
| 99 | AER-024 | 1 | placeholder | PDR | The STOL takeoff and landing distances shall be computed and recorded as [TBD] m. |
| 100 | AER-005 | 1 | placeholder | PDR | The wing area shall be [TBD] m2. |
| 101 | AER-006 | 1 | placeholder | PDR | The wing span shall be [TBD] m. |
| 102 | AER-007 | 1 | placeholder | CDR | The stall speed at maximum takeoff weight shall not exceed [TBD] kt. |
| 103 | AER-008 | 1 | placeholder | PDR | The conversion corridor shall be defined as the airspeed range allowed at each nacelle angle, recorded as [TBD]. |
| 104 | AER-009 | 1 | placeholder | PDR | The lower corridor boundary shall be set by the wing stall margin of [TBD] percent. |
| 105 | AER-015 | 1 | placeholder | PDR | Each control surface shall provide at least [TBD] of the control power needed for FCS-012. |
| 106 | AER-020 | 1 | placeholder | PDR | The electrical power in conversion shall be computed and recorded as [TBD] W. |
| 107 | AER-022 | 1 | placeholder | ORR | The vehicle shall remain controllable in winds up to [TBD] kt in cruise. |
| 108 | STR-002 | 2 | placeholder | PDR | The limit load factors shall be [TBD] in the positive and [TBD] in the negative direction. |
| 109 | STR-003 | 1 | placeholder | PDR | The ultimate factor of safety shall be [TBD] times limit load. |
| 110 | STR-010 | 1 | placeholder | CDR | Material allowables shall be taken from a recorded source and a knockdown for [TBD]. |
| 111 | STR-012 | 1 | placeholder | SIR | The structure test article shall be tested to ultimate load, or to a reduced level of [TBD] percent of ultimate if a full test is not practical. |
| 112 | STR-013 | 1 | placeholder | SIR | The structural test shall record strain and deflection at [TBD] locations. |
| 113 | STR-014 | 1 | placeholder | CDR | The primary structure shall have a fatigue life of at least [TBD] flight hours. |
| 114 | STR-015 | 1 | placeholder | CDR | The structure shall have no resonance within [TBD] percent of the rotor harmonics. |
| 115 | STR-017 | 1 | placeholder | CDR | Whirl flutter margin shall be at least [TBD] percent on airspeed or rotor speed. |
| 116 | STR-024 | 1 | placeholder | CDR | The structure shall withstand a landing at a descent rate of [TBD] m/s in VTOL mode without damage to the battery or sensor. |
| 117 | AVN-002 | 2 | placeholder | CDR | The control link shall operate at a range of at least [TBD] m with the margin of [TBD] dB. |
| 118 | AVN-003 | 1 | placeholder | CDR | The control link latency shall not exceed [TBD] ms. |
| 119 | AVN-006 | 1 | placeholder | CDR | The flight controller shall detect control link loss within [TBD] ms. |
| 120 | AVN-007 | 1 | placeholder | CDR | The aircraft shall send telemetry to the ground station at a rate of at least [TBD] Hz. |
| 121 | AVN-009 | 1 | placeholder | CDR | The satellite navigation position shall be accurate to within [TBD] m. |
| 122 | AVN-026 | 1 | placeholder | CDR | The flight controller shall alert the remote pilot within [TBD] s of satellite navigation loss. |
| 123 | AVN-011 | 2 | placeholder | CDR | The aircraft shall have an inertial measurement unit with a gyro range of at least [TBD] deg/s and an accelerometer range of at least [TBD] g. |
| 124 | AVN-012 | 1 | placeholder | CDR | The inertial measurement unit shall be mounted with vibration isolation that gives noise below [TBD] at rotor harmonics. |
| 125 | AVN-027 | 1 | placeholder | CDR | The heading measurement shall stay accurate to within [TBD] deg with the motors at full power. |
| 126 | AVN-015 | 2 | placeholder | CDR | The aircraft shall measure height above ground to within [TBD] m below [TBD] m altitude. |
| 127 | AVN-016 | 1 | placeholder | CDR | The flight controller shall have a watchdog that resets the processor and returns to a safe state within [TBD] ms of a software hang. |
| 128 | AVN-017 | 1 | placeholder | CDR | The remote pilot shall be able to stop all motors from the ground station in at most [TBD] s. |
| 129 | AVN-020 | 1 | placeholder | ORR | The aircraft shall carry lights visible for [TBD] statute miles if operated at night. |
| 130 | AVN-021 | 1 | placeholder | CDR | The aircraft shall log flight data at a rate of at least [TBD] Hz for the whole flight. |
| 131 | AVN-022 | 1 | placeholder | CDR | The data logger shall hold at least [TBD] hours of data and keep it after a power loss. |
| 132 | AVN-023 | 1 | placeholder | SIR | The avionics shall have a total mass of not more than [TBD] kg. |
| 133 | AVN-024 | 1 | placeholder | CDR | The avionics shall draw no more than [TBD] W on average. |
| 134 | SWR-013 | 1 | placeholder | CDR | The flight control task shall complete within its period with a margin of [TBD] percent. |
| 135 | SWR-014 | 1 | placeholder | CDR | The processor load shall not exceed [TBD] percent in any flight mode. |
| 136 | INT-001 | 1 | placeholder | CDR | The battery output port shall connect to the power distribution input port through a connector rated for at least [TBD] A continuous. |
| 137 | INT-002 | 3 | placeholder | CDR | The battery to power distribution connection shall carry a nominal voltage of [TBD] V with a range of [TBD] to [TBD] V. |
| 138 | INT-003 | 1 | placeholder | CDR | The voltage drop across the battery to power distribution connection shall not exceed [TBD] V at peak current. |
| 139 | INT-004 | 1 | placeholder | CDR | The battery to power distribution connection shall have a fuse or equivalent protection rated at [TBD] A. |
| 140 | INT-005 | 1 | placeholder | CDR | The power distribution left nacelle port shall connect to the left nacelle power input through a connector rated for at least [TBD] A continuous. |
| 141 | INT-006 | 1 | placeholder | CDR | The power distribution right nacelle port shall connect to the right nacelle power input through a connector rated for at least [TBD] A continuous. |
| 142 | INT-007 | 1 | placeholder | CDR | The nacelle power harness shall allow the full 0 to 90 deg tilt for at least [TBD] cycles without conductor failure. |
| 143 | INT-009 | 1 | placeholder | CDR | The left and right nacelle power paths shall have resistance within [TBD] percent of each other. |
| 144 | INT-010 | 1 | placeholder | CDR | The power distribution flight controller port shall connect to the flight controller power input on the avionics bus of [TBD] V. |
| 145 | INT-011 | 1 | placeholder | CDR | The flight controller shall accept power from [TBD] independent sources. |
| 146 | INT-013 | 2 | placeholder | CDR | The power distribution gimbal port shall connect to the gimbal power input at a voltage of [TBD] V and a current limit of [TBD] A. |
| 147 | INT-014 | 1 | placeholder | CDR | The gimbal power branch shall limit current to [TBD] A so that a payload fault does not drop the avionics bus. |
| 148 | INT-015 | 2 | placeholder | CDR | The radio link pilot command port shall connect to the flight controller pilot command input using a serial protocol of [TBD] at a rate of [TBD] baud. |
| 149 | INT-016 | 1 | placeholder | CDR | The pilot command shall pass from the radio link to the flight controller within [TBD] ms. |
| 150 | INT-017 | 1 | placeholder | CDR | The flight controller shall treat the absence of valid pilot command frames for more than [TBD] ms as link loss. |
| 151 | INT-018 | 2 | placeholder | CDR | The flight controller left tilt command port shall connect to the left nacelle tilt command input using a protocol of [TBD] at a rate of at least [TBD] Hz. |
| 152 | INT-020 | 1 | placeholder | CDR | The tilt command shall be in degrees with a resolution of at least [TBD] deg. |
| 153 | INT-021 | 1 | placeholder | CDR | The nacelle shall hold its last angle if no tilt command is received for [TBD] ms. |
| 154 | INT-022 | 2 | placeholder | CDR | The flight controller gimbal command port shall connect to the gimbal command input using a protocol of [TBD] at a rate of at least [TBD] Hz. |
| 155 | INT-023 | 1 | placeholder | CDR | The gimbal command shall be in degrees of pitch and yaw with a resolution of at least [TBD] deg. |
| 156 | INT-024 | 1 | placeholder | CDR | The gimbal shall hold its last position if no command is received for [TBD] ms. |
| 157 | INT-026 | 1 | placeholder | CDR | The payload sensor connector shall survive at least [TBD] mating cycles. |
| 158 | INT-030 | 1 | placeholder | CDR | The FPV camera shall connect to the video transmitter with a video interface of [TBD]. |
| 159 | INT-032 | 2 | placeholder | CDR | Each speed controller shall connect to its motor through three phase wires of at least [TBD] AWG with a length not more than [TBD] mm. |
| 160 | INT-033 | 2 | placeholder | CDR | The flight controller shall connect to each speed controller through a command interface of [TBD] at a rate of at least [TBD] Hz. |
| 161 | INT-036 | 1 | placeholder | CDR | The flight controller shall detect an open or short circuit in a nacelle position sensor within [TBD] ms. |
| 162 | INT-038 | 1 | placeholder | CDR | The flight controller shall treat loss of battery management data for more than [TBD] ms as a fault. |
| 163 | INT-039 | 1 | placeholder | CDR | The flight controller shall receive the weight-on-wheels state from at least [TBD] sensors on the landing gear. |
| 164 | FLT-036 | 1 | placeholder | ORR | The pilot shall plan a landing area within [TBD] m of the flight path for every flight. |
| 165 | FLT-005 | 1 | placeholder | CDR | The flight controller shall alert the pilot within [TBD] ms of a motor failure. |
| 166 | FLT-006 | 2 | placeholder | CDR | The flight controller shall keep attitude within [TBD] deg during [TBD] s after a motor failure. |
| 167 | FLT-008 | 1 | placeholder | CDR | The glide ratio with both motors stopped shall be at least [TBD]. |
| 168 | FLT-010 | 1 | placeholder | CDR | The flight controller shall detect a failed left tilt actuator within [TBD] ms. |
| 169 | FLT-011 | 1 | placeholder | CDR | The flight controller shall detect a failed right tilt actuator within [TBD] ms. |
| 170 | FLT-013 | 1 | placeholder | CDR | The stuck nacelle angles from which a safe landing is possible shall be determined by analysis and recorded as [TBD]. |
| 171 | FLT-014 | 1 | placeholder | CDR | The flight controller shall switch to the other attitude source within [TBD] ms of a failed inertial measurement unit. |
| 172 | FLT-018 | 1 | placeholder | CDR | The flight controller shall use the barometric altitude when the height sensor fails below [TBD] m. |
| 173 | FLT-028 | 1 | placeholder | CDR | The flight controller shall restart in flight within [TBD] ms of a watchdog reset and resume control. |
| 174 | FLT-035 | 1 | placeholder | CDR | The aircraft shall keep a battery fire from reaching the flight controller and payload for at least [TBD] s. |
| 175 | ENV-001 | 2 | placeholder | ORR | The vehicle shall operate with ambient temperatures from [TBD] to [TBD] degC. |
| 176 | ENV-002 | 2 | placeholder | ORR | The battery shall be used only between [TBD] and [TBD] degC pack temperature. |
| 177 | ENV-003 | 2 | placeholder | ORR | The vehicle shall survive storage between [TBD] and [TBD] degC without damage. |
| 178 | ENV-005 | 1 | placeholder | PDR | The vehicle shall meet its performance requirements up to a density altitude of [TBD] m. |
| 179 | ENV-007 | 1 | placeholder | ORR | The vehicle shall be flown only in gusts below [TBD] kt. |
| 180 | ENV-009 | 2 | placeholder | ORR | The vehicle in its transport case shall survive [TBD] g shock and [TBD] vibration profile without damage. |
| 181 | ENV-010 | 1 | placeholder | ORR | The vehicle shall have protection of [TBD] against dust at the motors and tilt mechanism. |
| 182 | ENV-011 | 1 | placeholder | ORR | The vehicle shall operate within the electromagnetic environment of [TBD]. |
| 183 | MNT-006 | 1 | placeholder | ORR | The program shall maintain a list of spare parts needed to repair the most likely damage within [TBD] hours. |
| 184 | MNT-009 | 3 | placeholder | SIR | The vehicle shall be transportable in a case of [TBD] by [TBD] by [TBD] mm. |
| 185 | MNT-010 | 1 | placeholder | ORR | A trained operator shall assemble the vehicle from its case in at most [TBD] minutes. |
