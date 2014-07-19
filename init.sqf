/*
@filename: init.sqf
Author:
	
	Quiksilver & Doctor Otterface

Last modified:

	19/07/2014
	
Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/


call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// revive
0 = execVM "IgiLoad\IgiLoadInit.sqf"