local timer = 50 * 60

Citizen.CreateThread(function()
    while timer > 0 do
        Citizen.Wait(1000)
        
        timer = timer - 1
        
        local minutes = math.floor(timer / 60)
        local seconds = timer % 60
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