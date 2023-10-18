lib.locale()

CreateThread(function()
        if sourceteam == 'blue' then
            devprint('savezone', 'loaded savezone for blue team!')
            function onEnter(self)
                SetPlayerInvincible(source, true)
                SetEntityAlpha(PlayerPedId(), 150, false)
                lib.notify({
                    title = locale('safezone_title'),
                    description = locale('safezone_on'),
                    type = 'inform'
                })
            end
             
            function onExit(self)
                if sourceteam == 'blue' then
                    isInCombatZone = false
                    SetPlayerInvincible(source, false)
                    SetEntityAlpha(PlayerPedId(), 255, false)
                    lib.notify({
                        title = locale('safezone_title'),
                        description = locale('safezone_off'),
                        type = 'inform'
                    })
                end
            end
            
            lib.zones.sphere({
                coords = blue.savezone,
                radius = 150,
                debug = false,
                inside = inside,
                onEnter = onEnter,
                onExit = onExit
            })
    end
end)