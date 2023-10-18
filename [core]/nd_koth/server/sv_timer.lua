function formatDigit(digit)
    if digit < 10 then
        return "0" .. tostring(digit)
    else
        return tostring(digit)
    end
end

CreateThread(function()
    while Config.MatchRound > 0 do
        Wait(1000)
        
        Config.MatchRound = Config.MatchRound - 1
        
        local minutes = math.floor(Config.MatchRound / 60)
        local seconds = Config.MatchRound % 60
        local formattedTime = formatDigit(minutes) .. ':' .. formatDigit(seconds)
        print(formattedTime)
        TriggerClientEvent('koth:ui:timeupdate', -1, formattedTime)
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
