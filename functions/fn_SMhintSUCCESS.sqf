private ["_veh","_vehName","_vehVarname","_completeText","_reward"];

smRewards =
[
	["an MBT-52 Kuma", "I_MBT_03_cannon_F"],
	["a To-199 Neophron (CAS)", "O_Plane_CAS_02_F"],
	["an AH-99 Blackfoot", "B_Heli_Attack_01_F"],
	["an FV-720 Mora", "I_APC_tracked_03_cannon_F"],
	["a PO-30 Orca", "O_Heli_Light_02_F"],
	["an AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F"],
	["a Strider HMG", "I_MRAP_03_hmg_F"],
	["an Mi-48 Kajman", "O_Heli_Attack_02_black_F"],
	["an A-143 Buzzard (CAS)", "I_Plane_Fighter_03_CAS_F"],
	["an M2A1 Slammer", "B_MBT_01_cannon_F"],
	["an IFV-6a Cheetah", "B_APC_Tracked_01_AA_F"],
	["an Offroad (Armed)", "B_G_Offroad_01_armed_F"],
	["an MQ4A Greyhawk", "B_UAV_02_F"],
	["an AH-9 Pawnee", "B_Heli_Light_01_armed_F"],
	["a WY-55 Hellcat", "I_Heli_light_03_F"],
	["a T-100 Varsuk", "O_MBT_02_cannon_F"],
	["an M2A4 Slammer (Urban Purpose)", "B_MBT_01_TUSK_F"],
	["an A-164 Wipeout (CAS)", "B_Plane_CAS_01_F"]
];
smMarkerList =
["smReward1","smReward2","smReward3","smReward4","smReward5","smReward6","smReward7","smReward8","smReward9","smReward10","smReward11","smReward12","smReward13","smReward14","smReward15","smReward16","smReward17","smReward18","smReward19","smReward20","smReward21","smReward22","smReward23","smReward24","smReward25","smReward26","smReward27"];

_veh = smRewards call BIS_fnc_selectRandom;

_vehName = _veh select 0;
_vehVarname = _veh select 1;

_completeText = format[
"<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#08b000'>COMPLETE</t><br/>____________________<br/>Fantastic job, lads! The OPFOR stationed on the island won't last long if you keep that up!<br/><br/>We've given you %1 to help with the fight. You'll find it at base.<br/><br/>Focus on the main objective for now; we'll relay this success to the intel team and see if there's anything else you can do for us. We'll get back to you in 10-15 minutes.</t>",_vehName];

_reward = createVehicle [_vehVarname, getMarkerPos "smReward1",smMarkerList,0,"NONE"];
waitUntil {!isNull _reward};

_reward setDir 284;

{
	_x addCuratorEditableObjects [[_reward], false];
} foreach adminCurators;

GlobalHint = _completeText; publicVariable "GlobalHint"; hint parseText _completeText;
showNotification = ["CompletedSideMission", sideMarkerText]; publicVariable "showNotification";
showNotification = ["Reward", format["Your team received %1!", _vehName]]; publicVariable "showNotification";