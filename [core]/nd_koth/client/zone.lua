lib.locale()
local checkRadius = 655
local checkCoordinate = Config.Hill
local inradius = false
local shownui = false

function IsPlayerInRadius(playerCoords, checkCoords, radius)
    local distance = #(playerCoords - checkCoords)
    return distance <= radius
end

CreateThread(function()
    while true do
        Wait(2000)

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

CreateThread(function()
    while true do
        Wait(2000)
        if inradius ~= previousInRadius then
            previousInRadius = inradius
            if inradius then
                lib.notify({
                    title = locale('zone_title'),
                    description = locale('zone_entered'),
                    type = 'inform'
                })
                TriggerServerEvent('koth:updatezone', sourceteam, true)
            else
                lib.notify({
                    title = locale('zone_title'),
                    description = locale('zone_left'),
                    type = 'inform'
                })
                TriggerServerEvent('koth:updatezone', sourceteam, false)
            end
        end
    end
end)
