RPX = {}
RPX.ServerCallbacks = {}
RPX.Config = InternalConfig
RPX.Shared = InternalShared
RPX.Blip = Internal_BlipLibrary
RPX.Debug = Internal_DebugLibrary
RPX.IN = Citizen.InvokeNative

exports('GetObject', function()
    return RPX
end)

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