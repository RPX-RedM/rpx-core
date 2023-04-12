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
                RPX.pNotifyRight("You are feeling cold...", 3000)
            elseif GetCurrentTemperature() > 26 then
                RPX.pNotifyRight("You are feeling hot...", 3000)
            end
        end
    end
end)

function GetCurrentTemperature()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    ShouldUseMetricTemperature()
    temp = math.floor(GetTemperatureAtCoords(coords.x, coords.y, coords.z), 1)
    if not Winter or inInterior then return temp end
    if Winter then
        if temp > 1 then
            if GetClockHours() > 15 then
                temp = -2
            elseif GetClockHours() > 16 then
                temp = -4
            elseif GetClockHours() > 18 then
                temp = -5
            elseif GetClockHours() > 19 then
                temp = -7
            elseif GetClockHours() < 15 then
                temp = -1
            elseif GetClockHours() < 14 then
                temp = 0
            elseif GetClockHours() < 13 then
                temp = 1
            end
        end
        return temp
    end
end