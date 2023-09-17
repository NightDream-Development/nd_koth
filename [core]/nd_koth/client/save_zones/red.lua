local isInCombatZone = false
local combatZoneCenter = vector3(650.3895, 644.9913, 128.9109)
local combatZoneRadius = 150.0 
devprint('savezone', 'loaded savezone for red team!')
function IsPlayerInCombatZone(playerCoords)
    local distance = #(playerCoords - combatZoneCenter)
    return distance <= combatZoneRadius
end
Citizen.CreateThread(function()
    while true do
        --print(sourceteam)
        if sourceteam == 'red' then
        Citizen.Wait(1000) -- Adjust the interval as needed

        local playerId = PlayerId()
        local playerPed = GetPlayerPed(playerId)
        local playerCoords = GetEntityCoords(cache.ped)

        local isInZone = IsPlayerInCombatZone(playerCoords)

        -- Check if the player has entered or left the combat zone
        if isInZone and not isInCombatZone then
            isInCombatZone = true
            SetPlayerInvincible(source, true)
            SetEntityAlpha(PlayerPedId(), 150, false)

            --print("You have entered the combat zone. Combat is disabled.")
            lib.notify({
                title = 'Biztonsági Zóna!',
                description = 'beléptél a biztonsági zónába!',
                type = 'inform'
            })
        elseif not isInZone and isInCombatZone then
            isInCombatZone = false
            SetPlayerInvincible(source, false)
            SetEntityAlpha(PlayerPedId(), 255, false)
            --print("You have left the combat zone. Combat is enabled.")
            lib.notify({
                title = 'Biztonsági Zóna!',
                description = 'Elhagytad a biztonsági zónát!',
                type = 'inform'
            })
        end
    else
        Wait(1000)
    end
    end
end)