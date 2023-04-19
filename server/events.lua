AddEventHandler("playerDropped", function(reason)
    local src = source
    local Player = RPX.Players[src]
    if Player then
        RPX.Player.Save(src)
        RPX.Logs.AddLog("framework", "Player " .. RPX.Players[src].name .. " (" .. src .. ") has disconnected from the server. (Reason: " .. reason .. ")")
        RPX.Players[src] = nil
    else
        RPX.Logs.AddLog("framework", "Player ID " .. src .. " has disconnected from the server (not logged in - reason: " .. reason .. ")")
    end
end)

RegisterNetEvent("SERVER:RPX:RegisterPlayerCoords", function(coords, heading)
    local src = source
    if RPX.Players[src] then
        RPX.Players[src].position = coords
    end
end)

RegisterNetEvent("SERVER:RPX:RequestRoutingBucketForSelf", function(bucket)
    local src = source
    SetPlayerRoutingBucket(src, bucket)
end)

RegisterNetEvent('SERVER:TriggerCallback', function(name, ...)
    local src = source
    TriggerCallback(name, src, function(...)
        TriggerClientEvent('CLIENT:TriggerCallback', src, name, ...)
    end, ...)
end)

RegisterNetEvent('RPX:UpdatePlayer', function()
    local src = source
    local thePlayer = RPX.Players[src]
    if thePlayer then
        local oldHunger = thePlayer.metadata['hunger']
        local oldThirst = thePlayer.metadata['thirst']
        local newHunger = oldHunger - Internal_Config.Player.HungerRate
        local newThirst = oldThirst - Internal_Config.Player.ThirstRate
        if newHunger <= 0 then
            newHunger = 0
        end
        if newThirst <= 0 then
            newThirst = 0
        end
        thePlayer.SetMetaData('thirst', tonumber(string.format("%.2f", newThirst)))
        thePlayer.SetMetaData('hunger', tonumber(string.format("%.2f", newHunger)))

        RPX.Player.Save(src)

        if GlobalState.DeploymentType == "dev" then
            print("RPX:UpdatePlayer for "..thePlayer.name.." ("..src..")")
            print("Setting hunger from "..oldHunger.." to "..newHunger)
            print("Setting thirst from "..oldThirst.." to "..newThirst)
        end
    end
end)

RegisterNetEvent('RPX:SetHunger', function(amount)
    local src = source
    local thePlayer = RPX.Players[src]
    if thePlayer then
        local oldHunger = thePlayer.metadata['hunger']
        local newHunger = amount
        if newHunger >= 100 then
            newHunger = 100
        end
        thePlayer.SetMetaData('hunger', tonumber(string.format("%.2f", newHunger)))

        RPX.Player.Save(src)

        if GlobalState.DeploymentType == "dev" then
            print("RPX:SetHunger for "..thePlayer.name.." ("..src..")")
            print("Setting hunger from "..oldHunger.." to "..newHunger)
        end
    end
end)

RegisterNetEvent('RPX:SetThirst', function(amount)
    local src = source
    local thePlayer = RPX.Players[src]
    if thePlayer then
        local oldThirst = thePlayer.metadata['thirst']
        local newThirst = amount
        if newThirst >= 100 then
            newThirst = 100
        end
        thePlayer.SetMetaData('thirst', tonumber(string.format("%.2f", newThirst)))

        RPX.Player.Save(src)

        if GlobalState.DeploymentType == "dev" then
            print("RPX:SetThirst for "..thePlayer.name.." ("..src..")")
            print("Setting thirst from "..oldThirst.." to "..newThirst)
        end
    end
end)

RegisterNetEvent('RPX:SetStress', function(amount)
    local src = source
    local thePlayer = RPX.Players[src]
    if thePlayer then
        local oldStress = thePlayer.metadata['stress']
        local newStress = amount
        if newStress >= 100 then
            newStress = 100
        end
        thePlayer.SetMetaData('stress', tonumber(string.format("%.2f", newStress)))

        RPX.Player.Save(src)

        if GlobalState.DeploymentType == "dev" then
            print("RPX:SetStress for "..thePlayer.name.." ("..src..")")
            print("Setting stress from "..oldStress.." to "..newStress)
        end
    end
end)

-- txAdmin Server Shutting Down Event
-- This event is triggered when txAdmin is about to restart or stop the server.
AddEventHandler('txAdmin:events:serverShuttingDown', function(eventData)
    CreateThread(function()
        for _, id in pairs(GetPlayers()) do
            -- We want to kick all players from the server _before_ it restarts, ensuring that all players get saved.
            DropPlayer(id, "Server is restarting. Please rejoin in a few minutes.")
        end
    end)
end)

-- Kick players who don't have a license identifier.
RegisterServerEvent('playerConnecting', function(name, setKickReason)
	local src = source --[[@as string]]
	if not GetPlayerIdentifierByType(src, "license") then
		setKickReason("Could not find 'license' identifier, please relaunch RedM.")
		CancelEvent()
	end
end)