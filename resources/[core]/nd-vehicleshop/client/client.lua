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
                spawnheli('buzzard')
            end
        },
        {
            title = 'Dubsta',
            description = '',
            icon = 'fa-solid fa-car',
            onSelect = function()
                spawnveh('dubsta2')
            end
        },
        {
            title = 'Sanchez',
            description = '',
            icon = 'fa-solid fa-car',
            onSelect = function()
                spawnveh('sanchez2')
            end
        },
        {
            title = 'Manchez',
            description = '',
            icon = 'fa-solid fa-car',
            onSelect = function()
                spawnveh('manchez2')
            end
        }
    }
    })
    lib.showContext('veh_menu')
end)




function spawnveh(model)
    team = exports.nd_koth:getteam()
    local playerPed = PlayerPedId()
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    --print(team)
    if team == "red" then
        vehicle = CreateVehicle(model, 689.4187, 657.9622, 128.9111, GetEntityHeading(playerPed), true, false)
    elseif team == "blue" then
        vehicle = CreateVehicle(model, -2127.0801, -367.4091, 13.1100, GetEntityHeading(playerPed), true, false)
    elseif team == "green" then
        vehicle = CreateVehicle(model, 9.6001, -1625.4325, 29.3088, GetEntityHeading(playerPed), true, false)
    else
        -- Handle an invalid team value here, if necessary
        return
    end
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetVehicleAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(model)
end


function spawnheli(model, team)
    team = exports.nd_koth:getteam()
    local playerPed = PlayerPedId()
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    local vehicle
    if team == "red" then
        vehicle = CreateVehicle(model, 702.4061, 626.1575, 258.9111, GetEntityHeading(playerPed), true, false)
    elseif team == "blue" then
        vehicle = CreateVehicle(model, -2163.1079, -403.0689, 13.3950, GetEntityHeading(playerPed), true, false)
    elseif team == "green" then
        vehicle = CreateVehicle(model, 75.5078, -1586.2942, 38.5586, 49.5359, GetEntityHeading(playerPed), true, false)
    else
        -- Handle an invalid team value here, if necessary
        return
    end
    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetVehicleAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(model)
end
