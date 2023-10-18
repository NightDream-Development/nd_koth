lib.locale()

devprint('savezone', 'loaded savezone for green team!')
function onEnter(self)
    if sourceteam == 'green' then
    SetPlayerInvincible(source, true)
    SetEntityAlpha(PlayerPedId(), 150, false)
    lib.notify({
        title = locale('safezone_title'),
        description = locale('safezone_on'),
        type = 'inform'
    })
end
end
 
function onExit(self)
    if sourceteam == 'green' then
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
    coords = green.savezone,
    radius = 150,
    debug = false,
    inside = inside,
    onEnter = onEnter,
    onExit = onExit
})