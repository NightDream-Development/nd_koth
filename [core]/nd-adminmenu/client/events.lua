lib.locale()
showids = false
RegisterNetEvent('nd-adminmenu/togglePlayerIDs', function()
    -- ExecuteCommand('txAdmin:menu:togglePlayerIDs')
if showids then
    showids = false
    lib.notify({
        id = 'godmode1',
        title = locale('menu_title'),
        description = locale('ids_off'),
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },
        icon = 'fa-solid fa-id-card-clip',
    })
else
    showids = true
    lib.notify({
        id = 'godmode1',
        title = locale('menu_title'),
        description = locale('ids_on'),
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },
        icon = 'fa-solid fa-id-card-clip',
    })
end
end)

local godmode = false
RegisterNetEvent('nd-adminmenu/togglegodmode', function()
    if godmode == false then
        SetEntityInvincible(cache.ped, true)
        godmode = true
        lib.notify({
            id = 'godmode1',
            title = locale('menu_title'),
            description = locale('god_mode_on'),
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'cross',
            iconColor = 'green'
        })
    else
        SetEntityInvincible(cache.ped, false)
        godmode = false
        lib.notify({
            id = 'godmode2',
            title = locale('menu_title'),
            description = locale('god_mode_off'),
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'cross',
            iconColor = '#C53030'
        })
    end
end)



RegisterNetEvent('nd-adminmenu/spawnVehicle', function()
    lib.hideMenu('vehiclemenu')
    Wait(500)
    local input = lib.inputDialog(locale('Vehicle_Spawn'), {locale('spawn_vehicle_model')})
    if not input then return end
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 8.0, 0.5))
    local veh = input[1] or "adder"
    local vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Wait(100)
            if waiting > 5000 then
                -- lib.notify({
                --     id = 'admincarnothingerror1',
                --     title = locale('menu_title'),
                --     description = locale('vehicle_not_exist'),
                --     position = 'top',
                --     style = {
                --         backgroundColor = '#141517',
                --         color = '#C1C2C5',
                --         ['.description'] = {
                --             color = '#909296'
                --         }
                --     },
                --     icon = 'ban',
                --     iconColor = '#C53030'
                -- })
                break
            end
        end
        CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(cache.ped) + 90, 1, 0)
    end)
    lib.showMenu('vehiclemenu')
end)


--Vehicle deleter
RegisterNetEvent('nd-adminmenu/deleteVehicle', function()
    local vehicle = nil
    local veh = GetVehiclePedIsUsing(cache.ped)
    if veh ~= 0 then
        SetEntityAsMissionEntity(veh, true, true)
        DeleteVehicle(veh)

        if not DoesEntityExist(veh) then
            lib.notify({
                id = 'admincardelete',
                title = locale('menu_title'),
                description = locale('vehicle_deleted'),
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#C1C2C5',
                    ['.description'] = {
                        color = '#909296'
                    }
                },
                icon = 'car',
                iconColor = '#C1C2C5'
            })
            lib.showMenu('adminmenu')
        end
    else
        local pcoords = GetEntityCoords(cache.ped)
        local vehicles = GetGamePool('CVehicle')
        for _, v in pairs(vehicles) do
            if #(pcoords - GetEntityCoords(v)) <= 5.0 then
                SetEntityAsMissionEntity(v, true, true)
                DeleteVehicle(v)

                if not DoesEntityExist(v) then
                    lib.notify({
                        id = 'admincardelete',
                        title = locale('menu_title'),
                        description = locale('vehicle_deleted'),
                        position = 'top',
                        style = {
                            backgroundColor = '#141517',
                            color = '#C1C2C5',
                            ['.description'] = {
                                color = '#909296'
                            }
                        },
                        icon = 'car',
                        iconColor = '#C1C2C5'
                    })
                    lib.showMenu('adminmenu')
                end
            end
        end
    end
end)

--spectate (yep txAdmin)
RegisterNetEvent('nd-adminmenu/spectateplayer', function()
    local input = lib.inputDialog(locale('spectate'), {locale('spectate_id')})
    if not input then return end
    local target = GetPlayerPed(input[1])
    local myServerId = GetPlayerServerId(PlayerId())
    if input[1] == source then
        lib.notify({
            id = 'admincardelete',
            title = locale('menu_title'),
            description = locale('spectate_sameid'),
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'car',
            iconColor = '#C1C2C5'
        })
    else
    TriggerServerEvent('txsv:req:spectate:start', input[1])
    end
end)

--anouncment
RegisterNetEvent('nd-adminmenu/annountcmentsender', function()
    local input = lib.inputDialog(locale('staff_ann'), {locale('staff_ann_msg')})
    if not input then return end
    TriggerServerEvent('nd-adminmenu/announcment', input[1])
    lib.showMenu('playermenu')
end)

RegisterNetEvent('nd-adminmenu/cannouncment', function(msg)
        lib.notify({
            id = 'adminannouncment',
            title = locale('staff_announcment'),
            description = msg,
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'fa-solid fa-circle-exclamation',
            iconColor = 'yellow'
        })
end)



RegisterNetEvent('nd-adminmenu/revive/client', function()
    local input = lib.inputDialog(locale('player_revive'), {locale('revive_player_id')})
    if not input then return end
      lib.notify({
        id = 'adminannouncment',
        title = locale('menu_title'),
        description = input[1].. ' ' ..locale('revive_notify'),
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },
        icon = 'hospital',
        iconColor = 'green'
    })
    --TriggerServerEvent('nd-adminmenu/server/revive', input[1])
    ExecuteCommand('revive ' ..input[1])
    lib.showMenu('playermenu')
end)



RegisterNetEvent('nd-adminmenu/repairVehicle')
AddEventHandler('nd-adminmenu/repairVehicle', function()
    local vehicle = GetVehiclePedIsIn(cache.ped, false)
    local coords = GetEntityCoords(cache.ped)
    local nearbyVehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 70)

    if vehicle ~= nil and vehicle ~= 0 then
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineOn(vehicle, true, true)
        ClearVehicleLastDamage(vehicle)
        SetVehicleLights(vehicle, 0)
        lib.notify({
            id = 'adminannouncment',
            title = locale('menu_title'),
            description = locale('vehicle_repaired'),
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'car',
            iconColor = 'green'
        })
    elseif DoesEntityExist(nearbyVehicle) then
        SetVehicleFixed(nearbyVehicle)
        SetVehicleDeformationFixed(nearbyVehicle)
        SetVehicleUndriveable(nearbyVehicle, false)
        SetVehicleEngineOn(nearbyVehicle, true, true)
        ClearVehicleLastDamageEntity(nearbyVehicle)
        SetVehicleLights(nearbyVehicle, 0)

        lib.notify({
            id = 'adminannouncment',
            title = locale('menu_title'),
            description = locale('vehicle_repaired'),
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'car',
            iconColor = 'green'
        })
    else
        lib.notify({
            id = 'adminannouncment',
            title = locale('menu_title'),
            description = locale('vehicle_not_repaired'),
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                    color = '#909296'
                }
            },
            icon = 'car',
            iconColor = 'red'
        })
    end
end)



--Ban system
RegisterNetEvent('nd-adminmenu/banplayer/client', function()
    local Input = lib.inputDialog('Ban', {
        { type = 'input', label = 'ID', placeholder = '13'},
        { type = 'input', label = locale('inputkick'), placeholder = 'VDM'},
        { type = 'number', label = locale('input1ban')},
        { type = 'number', label = locale('input2ban')},
        { type = 'number', label = locale('input3ban')}
    })
    --   print(tostring(input[3]))
    --   if tostring(input[3]) then
    --        input[4] = 9999999999
    --        end
    --   if tostring(input[3]) then
    --   lib.registerContext({
    --     id = 'ban_time',
    --     title = locale('ban_time'),
    --     options = {
    --       {
    --         title = locale('1day'),
    --         description = '',
    --         icon = 'hammer',
    --         onSelect = function()
    --             time2 = 86400
    --             TriggerServerEvent('nd-adminmenu/server/ban', input[1], input[4], input[2], tostring(input[3]))
    --           end,
    --       },
    --       {
    --         title = locale('3day'),
    --         description = '',
    --         icon = 'hammer',
    --         onSelect = function()
    --             time2 = 259200
    --             TriggerServerEvent('nd-adminmenu/server/ban', input[1], input[4], input[2], tostring(input[3]))
    --           end,
    --       },
    --       {
    --         title = locale('1week'),
    --         description = '',
    --         icon = 'hammer',
    --         onSelect = function()
    --             time2 = 604800
    --             TriggerServerEvent('nd-adminmenu/server/ban', input[1], input[4], input[2], tostring(input[3]))
    --           end,
    --       },
    --       {
    --         title = locale('1month'),
    --         description = '',
    --         icon = 'hammer',
    --         onSelect = function()
    --             time2 = 2678400
    --             TriggerServerEvent('nd-adminmenu/server/ban', input[1], input[4], input[2], tostring(input[3]))
    --           end,
    --       },
    --       {
    --         title = locale('6month'),
    --         description = '',
    --         icon = 'hammer',
    --         onSelect = function()
    --             time2 = 16070400
    --             TriggerServerEvent('nd-adminmenu/server/ban', input[1], input[4], input[2], tostring(input[3]))
    --           end,
    --       },
    --     }
    --   })
    --   lib.showContext('ban_time')
    --   lib.notify({
    --     id = 'adminannouncment',
    --     title = locale('menu_title'),
    --     description = locale('player_banned'),
    --     position = 'top',
    --     style = {
    --         backgroundColor = '#141517',
    --         color = '#C1C2C5',
    --         ['.description'] = {
    --             color = '#909296'
    --         }
    --     },
    --     icon = 'hammer',
    --     iconColor = 'red'
    -- })
    -- else
    --     time2 = 99999
    --   lib.notify({
    --     id = 'adminannouncment',
    --     title = locale('menu_title'),
    --     description = locale('player_banned'),
    --     position = 'top',
    --     style = {
    --         backgroundColor = '#141517',
    --         color = '#C1C2C5',
    --         ['.description'] = {
    --             color = '#909296'
    --         }
    --     },
    --     icon = 'hammer',
    --     iconColor = 'red'
    -- })
    -- TriggerServerEvent('nd-adminmenu/server/ban', input[1], time2, input[2], tostring(input[3]))
    TriggerServerEvent('nd-adminmenu/server/ban', Input)
    print('ID: ' ..Input[1].. ' REASON: ' ..Input[2]..  ' óra: ' ..Input[3].. ' nap: ' ..Input[4].. ' hónap: ' ..Input[5])
-- end
end)


local isinvis = false
RegisterNetEvent('nd-adminmenu/invisible/client', function()
    NoClipEntity = PlayerPedId(source)    ---- why source?  
    PlayerPed = GetPlayerPed(source)
if isinvis == false then
    isinvis = true
    SetEntityVisible(NoClipEntity, false, false)
    SetEntityInvincible(NoClipEntity, true)
    SetLocalPlayerVisibleLocally(true)
    SetEveryoneIgnorePlayer(PlayerPed, true)
    SetPoliceIgnorePlayer(PlayerPed, true)
    else
        isinvis = false
        SetEntityVisible(NoClipEntity, true, false)
        SetLocalPlayerVisibleLocally(true)
        ResetEntityAlpha(NoClipEntity)
        ResetEntityAlpha(PlayerPed)
        SetEveryoneIgnorePlayer(PlayerPed, false)
        SetPoliceIgnorePlayer(PlayerPed, false)
        SetPoliceIgnorePlayer(PlayerPed, true)
        SetEntityInvincible(NoClipEntity, false)
    end
end)



RegisterCommand("coord", function()
    coords = GetEntityCoords(cache.ped)
    head = GetEntityHeading(cache.ped)
    lib.setClipboard('' .. coords.x .. ', ' .. coords.y .. ', ' .. coords.z .. ', ' .. head)
    lib.notify({
      title = locale('menu_title'),
      description = locale('coord_copied'),
      type = 'success'
    })
    print('X: ' .. coords.x .. ' Y: ' .. coords.y .. ' Z: ' .. coords.z .. ' H: ' .. head)
  end)








  --id show above head
local disPlayerNames = 5
local playerDistances = {}

local function DrawText3D(position, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(position.x,position.y,position.z+1)
    local dist = #(GetGameplayCamCoords()-position)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        if not useCustomScale then
            SetTextScale(0.0*scale, 0.55*scale)
        else 
            SetTextScale(0.0*scale, customScale)
        end
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

CreateThread(function()
	Wait(500)
    while showids do
        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            if targetPed ~= cache.ped then
                if playerDistances[id] then
                    if playerDistances[id] < disPlayerNames then
                        local targetPedCords = GetEntityCoords(targetPed)
                        if NetworkIsPlayerTalking(id) then
                            DrawText3D(targetPedCords, GetPlayerServerId(id).. ' - '..GetPlayerName(id), 247,124,24)
                            DrawMarker(27, targetPedCords.x, targetPedCords.y, targetPedCords.z-0.97, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 173, 216, 230, 100, 0, 0, 0, 0)
                        else
                            DrawText3D(targetPedCords, GetPlayerServerId(id).. ' - ' ..GetPlayerName(id), 255,255,255)
                        end
                    end
                end
            end
        end
        Wait(0)
    end
end)

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(cache.ped)
        
        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            if targetPed ~= cache.ped then
                local distance = #(playerCoords-GetEntityCoords(targetPed))
				playerDistances[id] = distance
            end
        end
        if showids then
        Wait(1000)
        else
            Wait(5000)
        end
    end
end)
