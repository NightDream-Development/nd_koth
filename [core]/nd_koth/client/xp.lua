--XP for shooting
cooldown = false
CreateThread(function()
    while true do
        Wait(200)
        if not cooldown then
            --devprint('xpshoot', 'Checking..')
        if IsPedShooting(cache.ped) then
            devprint('xpshoot', 'Given 150 xp for shooting')
            TriggerServerEvent('koth:givexp', 'shooting', 150)
            cooldown = true
            devprint('xpshoot', 'cooldown has been enabled')
            Wait(120000)
            cooldown = false
            devprint('xpshoot', 'cooldown has been disabled')
        end
    end
    end
end)