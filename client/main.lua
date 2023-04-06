RPX = {}
RPX.ServerCallbacks = {}
RPX.Config = InternalConfig
RPX.Shared = InternalShared
RPX.Blip = Internal_BlipLibrary
RPX.Debug = Internal_DebugLibrary
RPX.IN = Citizen.InvokeNative

RPX.RequestRoutingBucket = function(bucket)
    TriggerServerEvent("SERVER:RPX:RequestRoutingBucketForSelf", bucket)
end

exports('GetObject', function()
    return RPX
end)

-- Register player coordinates with the server.
CreateThread(function()
    while true do
        Wait(2500)
        if LocalPlayer.state.isLoggedIn then
            local PlayerPed = PlayerPedId()
            TriggerServerEvent("SERVER:RPX:RegisterPlayerCoords", GetEntityCoords(PlayerPed), GetEntityHeading(PlayerPed))
        end
    end
end)

-- Callbacks
function TriggerCallback(name, cb, ...)
    RPX.ServerCallbacks[name] = cb
    TriggerServerEvent('SERVER:TriggerCallback', name, ...)
end
exports('TriggerCallback', TriggerCallback)

-- State bag change handlers for core
AddStateBagChangeHandler("UIHidden", nil, function(bagName, key, value)
    if GetPlayerFromStateBagName(bagName) ~= PlayerId() then return end
    if value then
        print("[RPX] Hiding UI.")
        SendNUIMessage({
            type = "HIDE_UI"
        })
    else
        print("[RPX] Showing UI.")
        SendNUIMessage({
            type = "SHOW_UI"
        })
    end
end)