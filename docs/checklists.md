# Preflight and postflight checklists

Generated from `tools/decomp/checklists.csv`. Every item traces to a requirement. Items marked All apply to every mode; a flight uses the All items plus the items for its mode (C/VTOL uses the CTOL and VTOL items that apply to the planned modes).

## Preflight: All

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Weather | Wind, gust, visibility and precipitation within limits | OPS-012 |
| [ ] | Airspace | Part 107 authorization and airspace check done, VLOS observer assigned if FPV is used | VEH-3, FPV-007 |
| [ ] | Documents | Remote pilot certificate, registration and checklist revision recorded | CHK-008 |
| [ ] | Airframe | Inspect wings, fuselage and fasteners for damage and loose parts | VEH-6 |
| [ ] | Rotors | Inspect both rotors and hubs, blade condition, balance marks, free to turn | PRP-013, PRP-015 |
| [ ] | Nacelles | Move both nacelles through full tilt range by hand or command; no binding; end stops reached | TLT-001, TLT-019 |
| [ ] | Tilt sensors | Both nacelle angles read the same at the end stops | TLT-020, TLT-011 |
| [ ] | Battery | Pack inspected, cycle count under limit, secured in tray, connectors keyed and seated | PWR-022, PWR-025, PWR-023 |
| [ ] | Battery state | Pack voltage and lowest cell voltage in range, no cell imbalance above limit | PWR-011 |
| [ ] | Energy | Planned mission energy plus reserve is below usable energy | PWR-001, PWR-002 |
| [ ] | Payload | Sensor mounted, retained, identified and profile loaded; mass entered if unknown | PLD-006, PLD-007, PLD-008, PLD-020 |
| [ ] | Gimbal | Gimbal moves through its range without contact; stabilizes in the hold test | PLD-013, PLD-016 |
| [ ] | FPV | FPV video clear, overlay data shown, link margin checked | FPV-003, FPV-009, FPV-006 |
| [ ] | Radio link | Control link range check and failsafe test done | VEH-3.3 |
| [ ] | Static margin | Estimated static margin inside limits for the selected mode, confidence not low | STB-010, STB-014 |
| [ ] | Balance | Optional balance check done and center of gravity entered if available | STB-015 |
| [ ] | Flight controller | All sensors healthy, mode logic starts in the hover state, checklist items marked | CHK-006, VEH-7 |
| [ ] | Mode select | Takeoff and landing mode selected and shown on the ground station | OPS-014, OPS-015 |
| [ ] | Arming | Arm indicator works; people clear of rotors | PWR-021, PRP-026 |

## Preflight: CTOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Gear | Gear secure, tires and struts in good state | OPS-005 |
| [ ] | Runway | Runway length and surface suit the ground roll; clear of obstacles | OPS-006, OPS-007 |
| [ ] | Rotor clearance | Rotors clear of ground at takeoff attitude | OPS-008 |
| [ ] | Nacelle angle | Nacelles set to the CTOL angle | OPS-002 |

## Preflight: STOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Surface | Runway length and surface suit the STOL ground roll; clear of obstacles | OPS-021, OPS-022 |
| [ ] | Nacelle angle | Nacelles set to the selected STOL angle within the allowed range | OPS-020 |
| [ ] | Rotor clearance | Rotors clear of ground at the STOL angle and takeoff attitude | OPS-024 |
| [ ] | Static margin | Static margin inside limits for the selected STOL angle | STB-022 |

## Preflight: VTOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Pad | Surface flat and clear within the VTOL area; loose objects removed | OPS-011 |
| [ ] | Nacelle angle | Nacelles at 90 deg for takeoff | OPS-003 |
| [ ] | Wind | Wind and gusts within VTOL limits | OPS-012 |

## Preflight: C/VTOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Takeoff site | Site suits the chosen takeoff mode and the landing site suits the chosen landing mode | OPS-004 |
| [ ] | Mode plan | Takeoff and landing modes and the point where the mode changes are briefed | OPS-013 |
| [ ] | Both sets | Items from the CTOL and VTOL lists that apply to the planned modes are complete | OPS-004 |

## Postflight: All

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Disarm | Throttles at idle, vehicle disarmed, battery disconnected | PWR-020 |
| [ ] | Rotors | Rotors stopped before approach; inspect blades and hubs | PRP-026 |
| [ ] | Battery | Record pack voltage, temperature and cycle count; check for swelling or damage | PWR-025, PWR-009 |
| [ ] | Battery storage | Store or transport in approved container | PWR-024 |
| [ ] | Motors and controllers | Check temperatures and record peak values against limits | PRP-019, PRP-020 |
| [ ] | Nacelles | Check tilt mechanism for play, wear or damage | TLT-015, TLT-021 |
| [ ] | Airframe | Inspect for cracks, loose fasteners, hard landing damage | VEH-6 |
| [ ] | Payload | Remove or secure sensor; record sensor identifier and data | PLD-021 |
| [ ] | Flight log | Download flight log, static margin record, faults and checklist; file them | STB-016, CHK-005 |
| [ ] | Anomalies | Record every anomaly, caution and alert; assign actions | STB-012 |

## Postflight: CTOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Gear | Inspect gear, tires, struts and brakes after the ground roll | OPS-010 |
| [ ] | Rotor strike | Inspect rotors and underside for ground contact | OPS-008 |

## Postflight: STOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Gear | Inspect gear, tires, struts and brakes after the STOL landing | OPS-023 |
| [ ] | Rotors and nacelles | Inspect rotors and tilt mechanism after sustained partial-tilt operation | TLT-025, STR-026 |

## Postflight: VTOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Pad | Inspect pad surface for heat or debris and recover loose items | OPS-011 |

## Postflight: C/VTOL

| Done | Item | Check | Traces to |
|---|---|---|---|
| [ ] | Both sets | Complete the post-flight items for both the takeoff mode and the landing mode used | OPS-004 |
