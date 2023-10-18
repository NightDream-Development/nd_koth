 lib.locale()
 local checkRadius = 655
 local shownui = false

function onEnter(self)
    lib.notify({
        title = locale('zone_title'),
        description = locale('zone_entered'),
        type = 'inform'
    })
TriggerServerEvent('koth:updatezone', sourceteam, true)
end
 
function onExit(self)
    lib.notify({
        title = locale('zone_title'),
        description = locale('zone_left'),
        type = 'inform'
    })
TriggerServerEvent('koth:updatezone', sourceteam, false)
end

lib.zones.sphere({
    coords = Config.Hill,
    radius = 655,
    debug = true,
    inside = inside,
    onEnter = onEnter,
    onExit = onExit
})