red = {}
green = {}
blue = {}

CreateThread(function()
    while true do
        Wait(1100)
        -- print('Piros: '..json.encode(red))
        -- print('Kék: '..json.encode(blue))
        -- print('Zöld: '..json.encode(green))
        TriggerClientEvent('koth:ui:teamnum', -1, #json.encode(red) - 2 , #json.encode(green) - 2, #json.encode(blue) - 2)
    end
end)


function GetAllPlayerIDs()
    local playerIDs = {}
    
    for _, player in ipairs(GetPlayers()) do
        table.insert(playerIDs, GetPlayerIdentifier(player))
    end
    
    return playerIDs
end

-- Example usage
local allPlayerIDs = GetAllPlayerIDs()


local inzone = {
    blue = 0,
    green = 0,
    red = 0
}
local currentHighestTeam = "none"

RegisterNetEvent('koth:updatezone')
AddEventHandler('koth:updatezone', function(team, isInZone)
    if type(team) == 'string' then
        if isInZone == false then
            inzone[team] = math.max(inzone[team] - 1, 0)
        else
            inzone[team] = inzone[team] + 1
        end
        --print(json.encode(inzone))

        -- Calculate percentage for each team
        local totalPlayers = inzone.blue + inzone.green + inzone.red
        local bluePercentage = (inzone.blue / totalPlayers) * 100
        local greenPercentage = (inzone.green / totalPlayers) * 100
        local redPercentage = (inzone.red / totalPlayers) * 100

        -- Find the team with the highest percentage
        local highestTeam = "none"
        local highestPercentage = 0

        if bluePercentage > highestPercentage then
            highestTeam = "blue"
            highestPercentage = bluePercentage
        end

        if greenPercentage > highestPercentage then
            highestTeam = "green"
            highestPercentage = greenPercentage
        end

        if redPercentage > highestPercentage then
            highestTeam = "red"
            highestPercentage = redPercentage
        end

        if highestTeam ~= currentHighestTeam then
            currentHighestTeam = highestTeam
            --print(currentHighestTeam)
            
            -- Retrieve all player IDs
            local allPlayerIDs = GetAllPlayerIDs()
            
            --TriggerClientEvent('koth:zoneui', source, currentHighestTeam)
            if highestTeam == "red" then
                --TriggerClientEvent('ox_lib:notify', -1, { description = 'A zóna urai a piros csapat!', type = 'warning' })
                TriggerClientEvent('koth:ui:kingupdate', -1, 'Piros')
            elseif highestTeam == "blue" then
                --TriggerClientEvent('ox_lib:notify', -1, { description = 'A zóna urai a kék csapat!', type = 'warning' })
                TriggerClientEvent('koth:ui:kingupdate', -1, 'Kék')
            elseif highestTeam == "green" then
                --TriggerClientEvent('ox_lib:notify', -1, { description = 'A zóna urai a zöld csapat!', type = 'warning' })
                TriggerClientEvent('koth:ui:kingupdate', -1, 'Zöld')
            else
                --TriggerClientEvent('ox_lib:notify', -1, { description = 'A zónát senki nem uralja!!', type = 'warning' })
                TriggerClientEvent('koth:ui:kingupdate', -1, 'Senki')
            end
        end
    end
end)


RegisterNetEvent('koth:setteam')
AddEventHandler('koth:setteam', function(team)
    if type(team) == 'string' then
        if team == 'red' then
            red[#red + 1] = source
            TriggerClientEvent('koth:setcteam', source, 'red')
            -- print(json.encode(red))
        elseif team == 'blue' then
            blue[#blue + 1] = source
            TriggerClientEvent('koth:setcteam', source, 'blue')
            -- print(json.encode(blue))
        elseif team == 'green' then
            green[#green + 1] = source
            TriggerClientEvent('koth:setcteam', source, 'green')
            -- print(json.encode(green))
        end
    end
end)

RegisterNetEvent('koth:join')
AddEventHandler('koth:join', function()
    print('[join:npc]: ' .. source .. ' ID joined 0 dimension! All npc spawn have been turned off for him!')
    SetRoutingBucketPopulationEnabled(0, false)
end)

RegisterNetEvent('koth:kill')
AddEventHandler('koth:kill', function()
    exports.pickle_xp:AddPlayerXP(source, 'shooting', 150)
end)
