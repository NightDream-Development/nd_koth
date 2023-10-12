CreateThread(function()
    while Config.MatchRound > 0 do
        Wait(1000)
        
        Config.MatchRound = Config.MatchRound - 1
        
        local minutes = math.floor(Config.MatchRound / 60)
        local seconds = Config.MatchRound % 60
        print(minutes..':'..seconds)
        TriggerClientEvent('koth:ui:timeupdate', -1, minutes..':'..seconds)
    end
    TriggerClientEvent('koth:ui:timeupdate', -1, 'A meccs végetért!')
    TriggerClientEvent('koth:ui:endmatchscrn', -1)
    Wait(10000)
    local players = GetPlayers()
    for _, player in ipairs(players) do
        DropPlayer(player, 'A meccs végetért! A szerver most újraindul!')
        os.exit()
    end
end)



