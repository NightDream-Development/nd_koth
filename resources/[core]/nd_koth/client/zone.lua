local checkRadius = 655
local checkCoordinate = vector3(-362.0161, -303.7297, 32.4943)
local inradius = false
local shownui = false

function IsPlayerInRadius(playerCoords, checkCoords, radius)
    local distance = #(playerCoords - checkCoords)
    return distance <= radius
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if IsPlayerInRadius(playerCoords, checkCoordinate, checkRadius) then
            inradius = true
        else
            inradius = false
        end
    end
end)

local previousInRadius = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if inradius ~= previousInRadius then
            previousInRadius = inradius
            if inradius then
                lib.notify({
                    title = 'Zóna',
                    description = 'Beléptél a zónába!',
                    type = 'inform'
                })
                TriggerServerEvent('koth:updatezone', sourceteam, true)
            else
                lib.notify({
                    title = 'Zóna',
                    description = 'Kiléptél a zónába!',
                    type = 'inform'
                })
                TriggerServerEvent('koth:updatezone', sourceteam, false)
            end
        end
    end
end)
