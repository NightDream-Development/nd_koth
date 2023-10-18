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
        --devprint('teleport', redspawncoords)
        SetEntityCoords(cache.ped, redspawncoords.x, redspawncoords.y, redspawncoords.z)
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
            SetEntityCoords(cache.ped, bluespawncoords.x, bluespawncoords.y, bluespawncoords.z)
            local model = 'csb_ramp_marine'
            if IsModelInCdimage(model) and IsModelValid(model) then
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
            end
            spawnweapontargetblue()
            spawncartargetblue()
        else
            if sourceteam == 'green' then
                --devprint('teleport', greenspawncoords)
                SetEntityCoords(cache.ped, greenspawncoords.x, greenspawncoords.y, greenspawncoords.z)
                local model = 's_m_y_marine_01'
                if IsModelInCdimage(model) and IsModelValid(model) then
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(0)
                    end
                    SetPlayerModel(PlayerId(), model)
                    SetModelAsNoLongerNeeded(model)
                end
                spawnweapontargetgreen()
                spawncartargetgreen()
            end
        end

    end
end)