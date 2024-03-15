// This file is specifically for the Mini Cooper S
//////////////////////////////////////////////////////////////////////////
//
// Conventions:
//
// +x = left
// +z = rear
// +y = up
// +pitch = nose up
// +yaw = nose right
// +roll = right
//
// [BODY]  - a rigid mass with mass and inertial properties
// [JOINT] - a ball joint constraining an offset of one body to an
//           offset of another body (eliminates 3 DOF)
// [HINGE] - a constraint restricting the relative rotations of two
//           bodies to be around a single axis (eliminates 2 DOF).
// [BAR]   - a constraint holding an offset of one body from an offset of
//           another body at a fixed distance (eliminates 1 DOF).
// [JOINT&HINGE] - both the joint and hinge constraints, forming the
//           conventional definition of a hinge (eliminates 5 DOF).
//
//////////////////////////////////////////////////////////////////////////

// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(636.0) inertia=(783.11,974.63,191.67)
pos=(0.0,0.00,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.0) inertia=(0.0275,0.0260,0.0245)
pos=(0.600,0.0,-1.65) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.0) inertia=(0.0275,0.0260,0.0245)
pos=(-0.600,0.0,-1.65) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(17.0) inertia=(0.527,0.277,0.277)
pos=(0.600,0.0,-1.65) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(17.0) inertia=(0.527,0.277,0.277)
pos=(-0.600,0.0,-1.65) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(15.0) inertia=(0.0358,0.0338,0.0319)
pos=(0.600,0.0,1.35) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(15.0) inertia=(0.0358,0.0338,0.0319)
pos=(-0.59,0.0,1.35) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(13.0) inertia=(0.403,0.215,0.215)
pos=(0.59,0.0,1.35) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(13.0) inertia=(0.403,0.215,0.215)
pos=(-0.59,0.0,1.35) ori=(0.0,0.0,0.0)

// Fuel in tank is not rigidly attached - it is attached with springs and
// dampers to simulate movement.  Properties are defined in the HDV file.

[BODY]
name=fuel_tank mass=(1.0) inertia=(1.0,1.0,1.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Driver's head is not rigidly attached, and it does NOT affect the vehicle
// physics.  Position is from the eyepoint defined in the VEH file, while
// other properties are defined in the head physics file.

[BODY]
name=driver_head mass=(5.0) inertia=(0.02,0.02,0.02)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)



//////////////////////////////////////////////////////////////////////////
//
// Constraints
//
//////////////////////////////////////////////////////////////////////////

// Front wheel and spindle connections
[JOINT&HINGE]
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(-1.00,0.0,0.00)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(1.00,0.0,0.00)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.343,0.093,-1.700) neg=(0.508,0.083,-1.650)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.343,0.093,-1.600) neg=(0.508,0.083,-1.650)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.290,-0.083,-1.750) neg=(0.538,-0.083,-1.650)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.290,-0.083,-1.550) neg=(0.538,-0.083,-1.650)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.325,-0.015,-1.580) neg=(0.520,0.0,-1.600)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.343,0.093,-1.700) neg=(-0.508,0.083,-1.650)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.343,0.093,-1.600) neg=(-0.508,0.083,-1.650)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.290,-0.083,-1.750) neg=(-0.538,-0.083,-1.650)

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.290,-0.083,-1.550) neg=(-0.538,-0.083,-1.650)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.325,-0.015,-1.580) neg=(-0.520,0.0,-1.600)

//Simulated Radius Rod (True trailing) Arm Suspension
// Rear left suspension (2 A-arms + 1 Tie Rod = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.350,-0.0,0.950) neg=(0.500,0.100,1.350)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.150,-0.015,0.950) neg=(0.500,0.100,1.350)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.350,-0.0,0.950) neg=(0.500,-0.100,1.350)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.150,-0.015,0.950) neg=(0.500,-0.100,1.350)

[BAR] // Tie Rod
posbody=body negbody=rl_spindle pos=(0.150,-0.015,0.950) neg=(0.500,0.0,1.450)

// Rear right suspension (2 A-arms + 1 Tie Rod = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.350,-0.0,0.950) neg=(-0.500,0.100,1.350)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.150,-0.015,0.950) neg=(-0.500,0.100,1.350)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.350,-0.0,0.950) neg=(-0.500,-0.100,1.350)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.150,-0.015,0.950) neg=(-0.500,-0.100,1.350)

[BAR] // Tie Rod
posbody=body negbody=rr_spindle pos=(-0.150,-0.015,0.950) neg=(-0.500,0.0,1.450)

// Rear spindle and wheel connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(-1.000,0.0,0.0)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(1.000,0.0,0.0)


