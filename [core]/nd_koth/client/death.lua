RegisterNetEvent('koth:revive')
AddEventHandler('koth:revive', function(cteam)
    if sourceteam == 'red' then
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
        else
            if sourceteam == 'green' then
                SetEntityCoords(cache.ped, green.spawncoords)
                local model = 's_m_y_marine_01'
                if IsModelInCdimage(model) and IsModelValid(model) then
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(0)
                    end
                    SetPlayerModel(PlayerId(), model)
                    SetModelAsNoLongerNeeded(model)
                end
            end
        end

    end
end)


--removed koth death
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(500)
--         local health = GetEntityHealth(cache.ped)
--         if health <= 0 then
--             Wait(1000)
--             TriggerEvent('koth:revive')
--         end
--     end
-- end)
