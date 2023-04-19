-- For Discord Rich Presence
CreateThread(function()
    GlobalState.MaxPlayers = Internal_Config.MaxPlayers
    GlobalState.PlayerCount = 0
    while true do
        Wait(10000)
        GlobalState.PlayerCount = #GetPlayers()
    end
end)