// NOTE this gets run on both client and server!

function main()
{
	Assert( GAMETYPE == COOPERATIVE )

	mia_SetupRoutesAndPositions2()

	mia_AddWaveNames()

	mia_SetupWaveSpawns()
	
	if ( IsServer() )
	{
		//SetCustomWaveSpawn_SideView( Vector( 40, 390, 640 ), Vector( 0, 90, 0 ) )//sets dropship spawn when ya die -YoshtheHut
		SetCustomWaveSpawn_SideView( Vector( 986, 6838, 10 ), Vector( 0, -90, 0 ) )//third number is height??? pos( z,x,y )?
	}
}

function mia_SetupRoutesAndPositions2()
{
	if ( !IsServer() )
		return
	
	local Genny_Local = Vector( -1738.74, 1134.24, -186.429 )
	local SE_End = Vector( -251.394, 1205.16, -236.144 )
	local NW_End = Vector( -283.76, 1380.79, -239.457 )

	if( Random( [ "Default", "Alternate" ] ) == "Alternate" )
	{
		Genny_Local = Vector( -1738.74, 6241.67, -170 )
		SE_End = Vector( -251.394, 6205.16, -236.144 )
		NW_End = Vector( -283.76, 6380.79, -239.457 )
	}


	//SetCustomPlayerDropshipSpawn( TEAM_MILITIA, Vector( -1310, 195, 223 ), Vector( 0, -75, 0 ), Vector( -2608, -582, 224 ), Vector( 0, 4, 0 ) )

	local MIA_north_west_short = [ Vector( 3372.59, 6241.67, -282.055 ), NW_End ]
	TowerDefense_AddRoute( MIA_north_west_short, "MIA_north_west_short" )

	local MIA_north_west = [ Vector( 3372.59, 6241.67, -282.055 ), Vector( 1002.4, 4007.01, -318.969 ), NW_End ]
	TowerDefense_AddRoute( MIA_north_west, "MIA_north_west" )

	local MIA_south_east_short = [ Vector( 2814.21, 509.172, -268.285 ), SE_End ]
	TowerDefense_AddRoute( MIA_south_east_short, "MIA_south_east_short" )

	local MIA_south_east = [ Vector( 2814.21, 509.172, -268.285 ), Vector( 1035.92, 3143.9, -316.357 ), SE_End ]
	TowerDefense_AddRoute( MIA_south_east, "MIA_south_east" )

	TowerDefense_AddGeneratorLocation( Genny_Local, Vector( 0, 0, 0 ) )
	//TowerDefense_AddGeneratorLocation( Vector( 3372.59, 6241.67, -282.055 ), Vector( 0, 0, 0 ) )

	AddLoadoutCrate( level.nv.attackingTeam, Vector( -2267.08, 2906.7, -63.968 ), Vector( 0, 0, 0 ) )
	AddLoadoutCrate( level.nv.attackingTeam, Vector( 2997.44, 3584.22, 64.031 ), Vector( 0, 0, 0 ) )

	//AddLoadoutCrate( level.nv.attackingTeam, Vector( 1930, 2586, 280 ), Vector( 0, 75, 0 ) )
	//AddLoadoutCrate( level.nv.attackingTeam, Vector( 2500, 1751, 280 ), Vector( 0, 15, 0 ) )
	//AddLoadoutCrate( level.nv.attackingTeam, Vector( 1565, 1508, 248 ), Vector( 0, 270, 0 ) )


	//AddStationaryTitanPosition( Vector( 1110, -3434, -262 ) )
	AddStationaryTitanPosition( Vector( 4783, 64, -455 ) )
	AddStationaryTitanPosition( Vector( 3596, -104, -408 ) )
	
	AddStationaryTitanPosition( Vector( 4705, 1239, -298 ) )
	AddStationaryTitanPosition( Vector( 4671, 617, -345 ) )
	//AddStationaryTitanPosition( Vector( 730.026, -4073.47, 2.03125 ) )

}


/***************************************************\

	TowerDefense_AddWave 	// creates the wave you will fill with events (spawns, pauses)
	Wave_AddSpawn 			// adds a spawn event to the wave (see spawner legend below)
	Wave_AddPause 			// adds a timed pause to the wave (secs)
	Wave_SetBreakTime 		// sets a custom break time between this wave and the next

					WAVE SPAWNER LEGEND

		TD_SpawnGruntSquad						-> 4 grunts
		TD_SpawnSpectreSquad					-> 4 spectres
		TD_SpawnSuicideSpectreSquad				-> 4 suicide spectres
		TD_SpawnSpectreSquadWithSingleSuicide	-> 3 spectres, 1 suicide spectre ( better option than 4 suicide spectres because they won't clump up )
		TD_SpawnGruntSquadDroppod
		TD_SpawnGruntSquadDropship
		TD_SpawnSpectreSquadDroppod
		TD_SpawnSpectreSquadDropship
		TD_SpawnSuicideSpectreSquadDroppod
		TD_SpawnSuicideSpectreSquadDropship
		TD_SpawnSpectreSquadWithSingleSuicideDroppod
		TD_SpawnSpectreSquadWithSingleSuicideDropship
		TD_SpawnSniper1x						-> 1 sniper spectre ( droppod )
		TD_SpawnSniper2x						-> 2 sniper spectres ( droppod )
		TD_SpawnSniper3x						-> 3 sniper spectres ( droppod )
		TD_SpawnSniper4x						-> 4 sniper spectres ( droppod )
		TD_SpawnTitan							-> 1 random regular titan
		TD_SpawnNukeTitan						-> 1 nuke titan
		TD_SpawnMortarTitan						-> 1 mortar titan
		TD_SpawnEmpTitan 						-> 1 emp titan
		TD_SpawnCloakedDrone							-> 1 cloak drone

\***************************************************/

function mia_AddWaveNames()
{
	AddWaveName( "name_mia1", "Split Focus" )
	AddWaveName( "name_mia2", "Heat Rising" )
	AddWaveName( "name_mia3", "Rain Drops" )
	AddWaveName( "name_mia4", "Glassed" )
}

function mia_SetupWaveSpawns()
{
	if ( IsClient() )
		return

	//Nexus Waves
	CommonWave_MIA_Waves()

}
