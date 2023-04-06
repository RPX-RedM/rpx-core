RegisterNetEvent("CLIENT:RPX:PlayerLoaded", function()
    for k,v in pairs(InternalShared.Blips) do
        RPX.Blip.Create(v.sprite, v.coordinates, v.name)
    end
end)

RegisterNetEvent('CLIENT:TriggerCallback', function(name, ...)
    if RPX.ServerCallbacks[name] then
        RPX.ServerCallbacks[name](...)
        RPX.ServerCallbacks[name] = nil
    end
end)
