Citizen.CreateThread(function()
    while true do
        SetDiscordAppId('1092996273721835641')
        SetDiscordRichPresenceAsset('loading')
        SetDiscordRichPresenceAssetText('RPX Framework')

        while not GlobalState.PlayerCount do
            Wait(500)
        end
        local pId = GetPlayerServerId(PlayerId())
        local pName = GetPlayerName(PlayerId())    
        SetRichPresence(GlobalState.PlayerCount.." / "..GlobalState.MaxPlayers.." - ID: "..pId.." | "..pName)

        Citizen.Wait(60000) -- 1 min update
        PlayerCount = nil
    end
end)