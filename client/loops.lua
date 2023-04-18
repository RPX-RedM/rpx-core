CreateThread(function()
    while true do
        Wait(0)
        if LocalPlayer.state.isLoggedIn then
            Wait((1000 * 60) * Internal_Config.Player.UpdateRate)
            TriggerServerEvent('RPX:UpdatePlayer')
        end
    end
end)

CreateThread(function()
    while true do
        Wait(Internal_Config.Player.StatusRate)
        if LocalPlayer.state.isLoggedIn then
            if LocalPlayer.state.metadata['hunger'] <= 5 or LocalPlayer.state.metadata['thirst'] <= 5 then
                local ped = PlayerPedId()
                local currentHealth = GetEntityHealth(ped)
                SetEntityHealth(ped, currentHealth - math.random(5, 10))
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(300000)
        if LocalPlayer.state.isLoggedIn then
            if GetCurrentTemperature() < 4 then
                lib.notify({ title = "Temperature", description = "You are feeling cold...", icon = "fas fa-temperature-arrow-up", type = "inform" })
            elseif GetCurrentTemperature() > 26 then
                lib.notify({ title = "Temperature", description = "You are feeling hot...", icon = "fas fa-temperature-high", type = "inform" })
            end
        end
    end
end)

function GetCurrentTemperature()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    ShouldUseMetricTemperature()
    return math.floor(GetTemperatureAtCoords(coords.x, coords.y, coords.z))
end