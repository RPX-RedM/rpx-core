if Internal_Config.Game.AnonymousNames then
    -- Set player's prompt names to anonymous (not their player name)
    CreateThread(function()
        while true do
            Wait(5000)
            for _, player in ipairs(GetActivePlayers()) do
                SetPedPromptName(GetPlayerPed(player), "Stranger (" .. tostring(GetPlayerServerId(player))..")")
            end
        end
    end)
end

if Internal_Config.Game.RevealMap then
    -- Reveal the entire map / disable fog of war.
    CreateThread(function()
        while true do
            Wait(500)
            if LocalPlayer.state.isLoggedIn then
                RPX.IN(0x4B8F743A4A6D2FF8, true)
                return
            end
        end
    end)
end

if Internal_Config.Game.HideHUD then
    -- Hide all game HUD elements.
    CreateThread(function()
        Wait(500)
        for i=0, 11 do
            RPX.IN(0xC116E6DF68DCE667, i, 2)
            RPX.IN(0x1B3DA717B9AFF828, true)
        end
        return
    end)
end

if Internal_Config.Game.EnableEagleEye then
    -- Enable eagle eye
    CreateThread(function()
        while true do
            Wait(500)
            if LocalPlayer.state.isLoggedIn then
                RPX.IN(0xA63FCAD3A6FEC6D2, PlayerPedId(), true) -- _ENABLE_EAGLE_EYE
                return
            end
        end
    end)
end

if Internal_Config.Game.DisableChallengeNotifications then
    -- Disable challenge notifications
    CreateThread(function()
        while true do
            Wait(10)
            local size = GetNumberOfEvents(0) 
            if size > 0 then
                for i = 0, size - 1 do
                    local eventAtIndex = GetEventAtIndex(0, i)
                    if eventAtIndex == GetHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") or eventAtIndex == GetHashKey("EVENT_CHALLENGE_REWARD") or eventAtIndex == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then 
                        RPX.IN(0x6035E8FBCA32AC5E)
                    end
                end
            end
        end
    end)
end

if Internal_Config.Game.MapCrossName then
    -- Set the BLIP_NAME when a player is hovered over on the map
    CreateThread(function()
        local MapFocus = DatabindingAddUiItemListFromPath("", "MapFocus")
        local HoveredName = DatabindingAddDataString(MapFocus, "HoveredName", "")
        DatabindingWriteDataString(HoveredName, Internal_Config.Game.MapCrossName)
    end)
end

if Internal_Config.Game.DisableLootPrompts then
    -- Disable random loot boxes
    CreateThread(function()
        while true do
            Wait(1)
            RPX.IN(0xFC094EF26DD153FA, 1)
            RPX.IN(0xFC094EF26DD153FA, 2)
        end
    end)
end

if Internal_Config.Game.DisableAimAssist then
    -- Disable aim assist on controllers
    CreateThread(function()
        while true do
            Wait(10)
            SetPlayerTargetingMode(3) -- or Citizen Native : RPX.IN(0xD66A941F401E7302, 3)
        end
    end)
end


--
-- Disable space in weapon wheel soft locking the game & bigmap controls
--
local DisabledControls = {
    0x7DA48D2A,
    0x9CC7A1A4,
    0x580C4473,
    0x0F39B3D4,
    0xCF8A4ECA,
}
CreateThread(function()
    while true do
        Wait(1)
        for _,control in pairs(DisabledControls) do
            DisableControlAction(0, control, true)
        end
    end
end)

if Internal_Config.Game.WeaponRecoilSystem then
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()
            if IsPedShooting(ped) then
                local _,wep = GetCurrentPedWeapon(ped)
                if Internal_Config.Game.WeaponRecoils[wep] and Internal_Config.Game.WeaponRecoils[wep] ~= 0 then
                    tv = 0
                    repeat
                        Wait(0)
                        p = GetGameplayCamRelativePitch()
                        if Internal_Config.Game.WeaponRecoils[wep] > 0.1 then
                            SetGameplayCamRelativePitch(p+0.6, 1.2)
                            tv = tv+0.6
                        else
                            SetGameplayCamRelativePitch(p+0.016, 0.333)
                            tv = tv+0.1
                        end
                    until tv >= Internal_Config.Game.WeaponRecoils[wep]
                end
            end
    
            Citizen.Wait(0)
        end
    end)
end


--
-- Enable PVP
--
CreateThread(function()
    while true do
        Wait(500)
        if LocalPlayer.state.isLoggedIn then
            Citizen.InvokeNative(0xF808475FA571D823, true) --enable friendly fire
            NetworkSetFriendlyFireOption(true)
            SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
            print("[RPX] PVP Enabled")
            return
        end
    end
end)