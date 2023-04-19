exports('GetGangs', function()
    return InternalShared.Gangs
end)

exports('GetHorses', function()
    return InternalShared.Horses
end)

exports('GetItems', function()
    return InternalShared.Items
end)

exports('GetJobs', function()
    return InternalShared.Jobs
end)

exports('GetVehicles', function()
    return InternalShared.Vehicles
end)

exports('GetWeapons', function()
    return InternalShared.Weapons
end)

--- Gets the peds in the game pool, allowing an ignore list.
---@param ignoreList table A list of peds to ignore.
---@return table peds A list of peds.
exports('GetPeds', function(ignoreList)
    local pedPool = GetGamePool('CPed')
    local ignoreList = ignoreList or {}
    local peds = {}
    for i = 1, #pedPool, 1 do
        local found = false
        for j = 1, #ignoreList, 1 do
            if ignoreList[j] == pedPool[i] then
                found = true
            end
        end
        if not found then
            peds[#peds + 1] = pedPool[i]
        end
    end
    return peds
end)

--- Get the closest ped to the player.
---@param coords vector3 | table The coords to check from.
---@param ignoreList? table A list of peds to ignore.
---@return integer closestPed The closest ped.
---@return number closestDistance The distance of the closest ped.
exports('GetClosestPed', function(coords, ignoreList)
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local ignoreList = ignoreList or {}
    local peds = exports['rpx-core']:GetPeds(ignoreList)
    local closestDistance = -1
    local closestPed = -1
    for i = 1, #peds, 1 do
        local pedCoords = GetEntityCoords(peds[i])
        local distance = #(pedCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestPed = peds[i]
            closestDistance = distance
        end
    end
    return closestPed, closestDistance
end)

--- Get the closest player.
---@param coords vector3 | table The coords to check from.
---@return number closestPlayer The closest player. 
---@return number closestDistance The distance of the closest player.
exports('GetClosestPlayer', function(coords)
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local closestPlayers = exports['rpx-core']:GetPlayersFromCoords(coords)
    local closestDistance = -1
    local closestPlayer = -1
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end)

--- Get players from coords
---@param coords vector3 | table The coords to check from.
---@param distance number The distance to check from.
exports('GetPlayersFromCoords', function(coords, distance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local distance = distance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = #(targetCoords - coords)
        if targetdistance <= distance then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end)

--- Get closest vehicle
---@param coords vector3 | table The coords to check from.
---@return integer closestVehicle The closest vehicle.
---@return number closestDistance The distance of the closest vehicle.
exports('GetClosestVehicle', function(coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    return closestVehicle, closestDistance
end)

--- Get closest object
---@param coords vector3 | table The coords to check from.
---@return integer closestObject The closest object.
---@return number closestDistance The distance of the closest object.
exports('GetClosestObject', function(coords)
    local ped = PlayerPedId()
    local objects = GetGamePool('CObject')
    local closestDistance = -1
    local closestObject = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #objects, 1 do
        local objectCoords = GetEntityCoords(objects[i])
        local distance = #(objectCoords - coords)
        if closestDistance == -1 or closestDistance > distance then
            closestObject = objects[i]
            closestDistance = distance
        end
    end
    return closestObject, closestDistance
end)

--- Spawn a vehicle
---@param model string The model of the vehicle.
---@param cb? function The callback function.
---@param coords vector3 | table The coords to spawn the vehicle at.
---@param isnetworked boolean Whether the vehicle should be networked.
exports('SpawnVehicle', function(model, cb, coords, isnetworked)
    local hash = GetHashKey(model)
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local isnetworked = isnetworked or true
    if not IsModelInCdimage(hash) then return end
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end
    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, isnetworked, false)
    local netid = NetworkGetNetworkIdFromEntity(veh)
    SetNetworkIdExistsOnAllMachines(netid, true)
    SetVehicleHasBeenOwnedByPlayer(veh, true)
    SetModelAsNoLongerNeeded(hash)
    if cb then
        cb(veh)
    end
end)

--- Trigger a registered server callback. Access only through the export.
---@param name string
---@param cb function
---@param ... any
exports('TriggerCallback', function (name, cb, ...)
    RPX.ServerCallbacks[name] = cb
    TriggerServerEvent('SERVER:TriggerCallback', name, ...)
end)