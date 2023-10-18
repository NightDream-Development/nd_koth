--Disable Cops
CreateThread(function()
    while true do
    Wait(1000)
    SetPlayerWantedLevel(source, 0, false)
    SetPlayerWantedLevelNow(source, false)
    SetPlayerWantedLevelNoDrop(source, 0, false)
    end
end)

CreateThread(function()
    while true do
        Wait(100)
        local playerLocalisation = GetEntityCoords(cache.ped)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
    end
end)

CreateThread(function()
    while true do
        Wait(10000)
        NetworkOverrideClockTime(12, 12, 12)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist('EXTRASUNNY')
        SetWeatherTypeNow('EXTRASUNNY')
        SetWeatherTypeNowPersist('EXTRASUNNY')
    end
end)