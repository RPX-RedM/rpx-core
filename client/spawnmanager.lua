local InitialPedModel = "mp_male"
local InitialPedSpawn = vector3(464.506, 2393.996, 276.3013)

Citizen.CreateThread(function()
    -- main loop thing
    print("[RPX Spawn Manager] Started.")
    while true do
        Wait(50)

        local playerPed = PlayerPedId()

        if playerPed and playerPed ~= -1 then
            if not LocalPlayer.state.PlayerSpawned then
                if NetworkIsPlayerActive(PlayerId()) then
                    print("[RPX Spawn Manager] Spawning player.")
                    RequestModel(InitialPedModel)

                    -- load the model for this spawn
                    while not HasModelLoaded(InitialPedModel) do
                        RequestModel(InitialPedModel)
                        Wait(50)
                    end

                    print("[RPX Spawn Manager] Setting player model.")
                    -- change the player model
                    SetPlayerModel(PlayerId(), InitialPedModel)

                    -- release the player model
                    SetModelAsNoLongerNeeded(InitialPedModel)
                    
                    -- RDR3 player model bits
                    if N_0x283978a15512b2fe then
                        N_0x283978a15512b2fe(PlayerPedId(), true)
                    end

                    -- preload collisions for the spawnpoint
                    RequestCollisionAtCoord(InitialPedSpawn)

                    -- spawn the player
                    local ped = PlayerPedId()

                    -- V requires setting coords as well
                    SetEntityCoordsNoOffset(ped, InitialPedSpawn, false, false, false, true)

                    NetworkResurrectLocalPlayer(InitialPedSpawn, 0.0, true, true, false)

                    -- gamelogic-style cleanup stuff
                    ClearPedTasksImmediately(ped)
                    RemoveAllPedWeapons(ped)
                    ClearPlayerWantedLevel(PlayerId())

                    local time = GetGameTimer()

                    while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
                        Citizen.Wait(0)
                    end

                    ShutdownLoadingScreen()

                    if Internal_Config.Game.EnablePVP then
                        Citizen.InvokeNative(0xF808475FA571D823, true) --enable friendly fire
                        NetworkSetFriendlyFireOption(true)
                        SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
                    end
                    LocalPlayer.state.PlayerSpawned = true
                end
            end
        end
    end
end)