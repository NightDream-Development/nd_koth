lib.locale()
devprint('ui', 'Loading!')
RegisterNetEvent('koth:zoneui')
AddEventHandler('koth:zoneui', function(zoneholder)
    if zoneholder == "none" then
        lib.notify({
            title = locale('zone_title'),
            description = locale('zone_none'),
            type = 'warning'
        })
        devprint('ui', zoneholder)
    elseif zoneholder == "red" then
        lib.notify({
            title = locale('zone_title'),
            description = locale('zone_red'),
            type = 'warning'
        })
        devprint('ui', zoneholder)
    elseif zoneholder == "green" then
        lib.notify({
            title = locale('zone_title'),
            description = locale('zone_green'),
            type = 'warning'
        })
        devprint('ui', zoneholder)
    elseif zoneholder == "blue" then
        lib.notify({
            title = locale('zone_title'),
            description = locale('zone_blue'),
            type = 'warning'
        })
        devprint('ui', zoneholder)
    end
end)


CreateThread(function()
    while true do 
        Wait(100)
        SetCanAttackFriendly(cache.ped, true, true)
        NetworkSetFriendlyFireOption(true)
    end
end)

CreateThread(function()
    while true do
    HideHudComponentThisFrame(1) -- 1 : WANTED_STARS
    HideHudComponentThisFrame(3) -- 3 : CASH
    HideHudComponentThisFrame(4) -- 4 : MP_CASH
    -- HideHudComponentThisFrame(5) -- 5 : MP_MESSAGE
    -- HideHudComponentThisFrame(6) -- 6 : VEHICLE_NAME
    HideHudComponentThisFrame(7) -- 7 : AREA_NAME
    -- HideHudComponentThisFrame(8) -- 8 : VEHICLE_CLASS
    HideHudComponentThisFrame(9) -- 9 : STREET_NAME
    -- HideHudComponentThisFrame(10) -- 10 : HELP_TEXT
    -- HideHudComponentThisFrame(11) -- 11 : FLOATING_HELP_TEXT_1
    -- HideHudComponentThisFrame(12) -- 12 : FLOATING_HELP_TEXT_2
    HideHudComponentThisFrame(13) -- 13 : CASH_CHANGE
    HideHudComponentThisFrame(14) -- 14 : RETICLE
    -- HideHudComponentThisFrame(15) -- 15 : SUBTITLE_TEXT
    -- HideHudComponentThisFrame(16) -- 16 : RADIO_STATIONS
    HideHudComponentThisFrame(17) -- 17 : SAVING_GAME
    -- HideHudComponentThisFrame(18) -- 18 : GAME_STREAM
    DisplayAmmoThisFrame(true)
     Wait(40)
 end
end)

