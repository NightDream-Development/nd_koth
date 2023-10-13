
RegisterNetEvent('koth:openvehiclehop')
AddEventHandler('koth:openvehiclehop', function(cteam)
    lib.registerContext({
        id = 'veh_menu',
        title = 'Válassz egy Járművet',
        menu = 'veh_menu',
        options = {
            {
                title = 'Buzzard Attack Chopper',
                description = '',
                icon = 'fa-solid fa-car',
                onSelect = function()
                    spawnVehicle('buzzard', cteam, true)
                end
            },
            {
                title = 'Dubsta',
                description = '',
                icon = 'fa-solid fa-car',
                onSelect = function()
                    spawnVehicle('dubsta2', cteam, false)
                end
            },
            {
                title = 'Sanchez',
                description = '',
                icon = 'fa-solid fa-car',
                onSelect = function()
                    spawnVehicle('sanchez2', cteam, false)
                end
            },
            {
                title = 'Manchez',
                description = '',
                icon = 'fa-solid fa-car',
                onSelect = function()
                    spawnVehicle('manchez2', cteam, false)
                end
            }
        }
    })
    lib.showContext('veh_menu')
end)

function spawnVehicle(model, team, isHeli)
    team = exports.nd_koth:getteam() ---- only if we need
    lib.requestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local vehicle

    if isHeli then
        if team == "red" then
            vehicle = CreateVehicle(model, 702.4061, 626.1575, 258.9111, GetEntityHeading(cache.ped), true, false)
        elseif team == "blue" then
            vehicle = CreateVehicle(model, -2163.1079, -403.0689, 13.3950, GetEntityHeading(cache.ped), true, false)
        elseif team == "green" then
            vehicle = CreateVehicle(model, 75.5078, -1586.2942, 38.5586, 49.5359, GetEntityHeading(cache.ped), true, false)
        else
            -- Handle an invalid team value here, if necessary
            return
        end
    else
        if team == "red" then
            vehicle = CreateVehicle(model, 689.4187, 657.9622, 128.9111, GetEntityHeading(cache.ped), true, false)
        elseif team == "blue" then
            vehicle = CreateVehicle(model, -2127.0801, -367.4091, 13.1100, GetEntityHeading(cache.ped), true, false)
        elseif team == "green" then
            vehicle = CreateVehicle(model, 9.6001, -1625.4325, 29.3088, GetEntityHeading(cache.ped), true, false)
        else
            -- Handle an invalid team value here, if necessary
            return
        end
    end

    SetPedIntoVehicle(cache.ped, vehicle, -1)
    SetVehicleAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(model)

    if not isHeli then
        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        local speed = 15.0

        if vehicle ~= 0 then
            local coords = GetEntityCoords(vehicle)
            local forwardVector = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 10.0, 0.0)
            local upVector = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.0, 10.0)

            SetEntityVelocity(vehicle, (forwardVector - coords) * speed)
            SetEntityVelocity(vehicle, (upVector - coords) * speed)
        end
    end
end
