-- this is the clients team
sourceteam = nil

exports("getteam", function()
    return sourceteam
end)

RegisterNetEvent('koth:setcteam')
AddEventHandler('koth:setcteam', function(cteam)
    sourceteam = cteam
    --print(sourceteam)
    blipspawn()
    if sourceteam == 'red' then
        SetEntityCoords(cache.ped, 650.5582, 646.4577, 128.9109)
        local model = 'csb_mweather'
        if IsModelInCdimage(model) and IsModelValid(model) then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            SetModelAsNoLongerNeeded(model)
        end
        spawncartargetred()
        spawnweapontargetred()
    else
        if sourceteam == 'blue' then
            SetEntityCoords(cache.ped, -2078.9465, -327.4488, 13.1342)
            local model = 'csb_ramp_marine'
            if IsModelInCdimage(model) and IsModelValid(model) then
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
            end
            bluespawnweapontarget()
            bluespawncartarget()
        else
            if sourceteam == 'green' then
                SetEntityCoords(cache.ped, 63.0629, -1572.7197, 29.5978)
                local model = 's_m_y_marine_01'
                if IsModelInCdimage(model) and IsModelValid(model) then
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(0)
                    end
                    SetPlayerModel(PlayerId(), model)
                    SetModelAsNoLongerNeeded(model)
                end
                greenspawnweapontarget()
                greenspawncartarget()
            end
        end

    end
end)

function blipspawn()
    -- red team blips
    local redblip = AddBlipForRadius(650.5582, 646.4577, 128.9109, 250.0)
    SetBlipAlpha(redblip, 155)
    SetBlipColour(redblip, 1)
    devprint('blips', 'red team blips has been loaded!')
    -- blue team blips
    local blueblip = AddBlipForRadius(-2078.9465, -327.4488, 13.1342, 250.0)
    SetBlipAlpha(blueblip, 155)
    SetBlipColour(blueblip, 3)
    devprint('blips', 'blue team blips has been loaded!')
    -- green team blips
    local greenblip = AddBlipForRadius(63.0629, -1572.7197, 29.5978, 250.0)
    SetBlipAlpha(greenblip, 155)
    SetBlipColour(greenblip, 2)
    devprint('blips', 'green team blips has been loaded!')
    -- dead zone
    local deadblip = AddBlipForRadius(-362.0161, -303.7297, 32.4943, 650.0)
    SetBlipAlpha(deadblip, 155)
    SetBlipColour(deadblip, 72)
    devprint('blips', 'dead zone blips has been loaded!')

end

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

function devprint(name, text)
    print('[' .. name .. ']: ' .. text)
end
