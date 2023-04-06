IC = {}
IC.MaxPlayers 							= GetConvarInt('sv_maxclients', 48)
IC.DefaultPosition 						= vector3(0.0,0.0,0.0)
IC.CitizenIDLength 						= 8
IC.DeploymentType						= "dev" 		-- dev, prod
														-- This dictates whether or not to print all debug traces in all RPX resources to the console.
														-- This is especially useful if you don't want your console spammed with debug messages or random bullshit on client and server side.

IC.MaxCharactersPerPlayer 				= 4

IC.Player = {}
IC.Player.StartingCash  				= 100
IC.Player.StartingBank  				= 100
IC.Player.MaxHealthCore					= 5 			-- 50% max health core
IC.Player.MaxStaminaCore				= 5 			-- 50% max stamina core
IC.Player.UpdateRate    				= 5 			-- Minutes
IC.Player.StatusRate    				= 5000 			-- Seconds
IC.Player.HungerRate    				= 4.2 			-- Rate at which hunger increases.
IC.Player.ThirstRate    				= 3.8 			-- Rate at which thirst increases.

IC.Game = {}                                            -- These are game modifications to improve the RP/multiplayer experience.
IC.Game.EnablePVP                       = true          -- Whether or not to enable PVP/friendly fire.
IC.Game.AnonymousNames                  = true          -- Set to true to make all players have anonymous target names ["Stranger (PlayerID)"]
IC.Game.DisableChallengeNotifications	= true          -- Set to true to disable challenge notifications (base game)
IC.Game.MapCrossName                    = "RPX Core"    -- Set the BLIP_NAME when a player is hovered over a non-existant blip on the map (base game)
IC.Game.DisableLootPrompts              = true          -- Set to true to disable random loot boxes/prompts (base game)
IC.Game.DisableAimAssist                = true          -- Set to true to disable aim assist on controllers (unfair for RP servers)
IC.Game.RevealMap                       = true          -- Set to true to disable the fog of war and reveal the entire game map.
IC.Game.HideHUD                         = true          -- Set to true to hide the main game HUD. (Great if you have a custom HUD)
IC.Game.EnableEagleEye                  = false         -- Set to true to enable eagle eye (base game)

IC.Game.WeaponRecoilSystem              = true          -- Set to true to enable weapon recoil system.
IC.Game.WeaponRecoils = {
	[34411519] = 0.7, --   weapon_pistol_volcanic
	[1252941818] = 0.7,-- `weapon_pistol_mauser_drunk
	[1534638301] = 0.7,-- weapon_pistol_m1899
	[1701864918] = 0.7,-- weapon_pistol_semiauto
	[2239809086] = 0.7,-- weapon_pistol_mauser
	[1905553950] = 0.7,-- weapon_repeater_evans
	-- [2077870112] = 0.7,-- weapon_repeater_carbine_sadie
	[2511488402] = 0.7,-- weapon_repeater_henry
	[2823250668] = 0.7,-- weapon_repeater_winchester
	-- [3195419004] = 0.7,-- weapon_repeater_winchester_john
	[4111948705] = 0.7,-- weapon_repeater_carbine
	-- [13903789] = 0.7,-- weapon_revolver_doubleaction_micah_dualwield
	-- [36703333] = 0.7,-- weapon_revolver_doubleaction_micah
	-- [38266755] = 0.7,--weapon_revolver_schofield_calloway
	[127400949] = 0.7,-- weapon_revolver_doubleaction
	[379542007] = 0.7,-- weapon_revolver_cattleman
	[383145463] = 0.7,-- weapon_revolver_cattleman_mexican
	[1529685685] = 0.7,-- weapon_revolver_lemat
	[2075992054] = 0.7,-- weapon_revolver_schofield
	[2212320791] = 0.7,-- weapon_revolver_doubleaction_gambler
	[1676963302] = 0.7,-- weapon_rifle_springfield
	[1999408598] = 0.7,-- weapon_rifle_boltaction
	[3724000286] = 0.7,-- weapon_rifle_varmint
	[392538360] = 0.7,-- weapon_shotgun_sawedoff
	[575725904] = 0.7,-- weapon_shotgun_doublebarrel_exotic
	[834124286] = 0.7,-- weapon_shotgun_pump
	[1674213418] = 0.7,-- weapon_shotgun_repeating
	[1838922096] = 0.7,-- weapon_shotgun_semiauto
	[1845102363] = 0.7,-- weapon_shotgun_doublebarrel
	[1402226560] = 0.7,-- weapon_sniperrifle_carcano
	[3788682007] = 0.7,-- weapon_sniperrifle_rollingblock

    -------------------------------------  Weapons from game version 1207.80 till 1311.12 ---------------------------------
    -- {`weapon_rifle_elephant`,`group_rifle`,},
    -- {`weapon_revolver_navy`,`group_revolver`,},

    -------------------------------------  Weapons from game version 1311.12 till 1355.18 ---------------------------------
   	--- {`weapon_revolver_navy_crossover`,`group_revolver`,},

}

IC.Game.PopDensMultipliers                   = {}            -- These are the multipliers for the population density of the game.
IC.Game.PopDensMultipliers.ambientPeds       = 1.0           -- Multiplier for the amount of ambient animals in the game.
IC.Game.PopDensMultipliers.scenarioPeds      = 1.0           -- Multiplier for the amount of ambient human peds in the game.
IC.Game.PopDensMultipliers.vehicles          = 1.0           -- Multiplier for the amount of scenario animals in the game.
IC.Game.PopDensMultipliers.parkedVehicles    = 1.0           -- Multiplier for the amount of scenario human peds in the game.
IC.Game.PopDensMultipliers.randomVehicles    = 1.0           -- Multiplier for the amount of random vehicles in the game.
IC.Game.PopDensMultipliers.ambientAnimals    = 1.0           -- Multiplier for the amount of ambient peds in the game.
IC.Game.PopDensMultipliers.ambientHumans     = 1.0           -- Multiplier for the amount of ambient animals in the game.
IC.Game.PopDensMultipliers.scenarioAnimals   = 1.0           -- Multiplier for the amount of parked vehicles in the game.
IC.Game.PopDensMultipliers.scenarioHumans    = 1.0           -- Multiplier for the amount of random vehicles in the game.


-----------------------------------------------------------------------------------------
-------------------------------------  Internal Config  ---------------------------------
-----------------------------------------------------------------------------------------


GlobalState.DensityMultipliers 				 = IC.Game.PopDensMultipliers  -- Push the pop density multipliers to the global state. Don't touch this!
GlobalState.DeploymentType	 				 = IC.DeploymentType -- Push the framework's deployment type to the global state. Don't touch this!

Internal_Config = IC