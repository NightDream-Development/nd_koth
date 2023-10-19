lib.locale()
local loaded = false
RegisterNetEvent('nd-adminmenu/openmenu', function()
    --Prepare any menu
   -- vehicle menu
   if not loaded then
    lib.registerMenu({
        id = 'vehiclemenu',
        title = locale('vehicle_menu_title'),
        position = 'top-right',
        onClose = function(keyPressed)
            lib.showMenu('adminmenu')
        end,
        options = {
            {label = locale('Vehicle_Spawn'), description = locale('vehicle_spawn_desc')},
            {label = locale('vehicle_delete'), description = locale('vehicle_delete_decs')},
            {label = locale('vehicle_fix'), description = locale('vehicle_fix_desc')},
        },
    }, function(selected, scrollIndex, args)
        if selected == 1 then
            TriggerEvent('nd-adminmenu/spawnVehicle')
        elseif selected == 2 then
            TriggerEvent('nd-adminmenu/deleteVehicle')
            lib.showMenu('vehiclemenu')
        elseif selected == 3 then
            TriggerEvent('nd-adminmenu/repairVehicle')
            lib.showMenu('vehiclemenu')
        end
    end)

    -- Player options
    lib.registerMenu({
        id = 'playermenu',
        title = locale('player_option_title'),
        position = 'top-right',
        onClose = function(keyPressed)
            lib.showMenu('adminmenu')
        end,
        options = {
            {label = locale('noclip'), description = locale('noclip_desc')},
            {label = locale('show_id'), description = locale('show_id_desc')},
            {label = locale('god_mode'), description = locale('god_mode_desc')},
            {label = locale('spectate'), description = locale('spectate_desc')},
            {label = locale('staff_announcment'), description = locale('staff_announcment_desc')},
            -- {label = locale('ban_player'), description = locale('ban_player_desc')},
            {label = locale('player_revive'), description = locale('player_revive_desc')},
            {label = locale('invisible')},
        },
    }, function(selected, scrollIndex, args)
        if selected == 1 then
            TriggerEvent('nd-adminmenu/togglenoclip')
            lib.showMenu('playermenu')
        elseif selected == 2 then
            TriggerEvent('nd-adminmenu/togglePlayerIDs')
            lib.showMenu('playermenu')
        elseif selected == 3 then
            TriggerEvent('nd-adminmenu/togglegodmode')
            lib.showMenu('playermenu')
        elseif selected == 4 then
            TriggerEvent('nd-adminmenu/spectateplayer')
        elseif selected == 5 then
            TriggerEvent('nd-adminmenu/annountcmentsender')
        --elseif selected == 6 then
            --TriggerEvent('nd-adminmenu/banplayer/client')
        elseif selected == 6 then
            TriggerEvent('nd-adminmenu/revive/client')
        elseif selected == 7 then
            TriggerEvent('nd-adminmenu/invisible/client')
            lib.showMenu('playermenu')
        end

    end)

    -- Main menu
    lib.registerMenu({
        id = 'adminmenu',
        title = locale('menu_title'),
        position = 'top-right',
        options = {
            {label = locale('vehicle_options'), description = locale('vehicle_options_desc'), menuId = 'vehiclemenu'},
            {label = locale('player_options'), description = locale('player_options_desc'), menuId = 'playermenu'},
        },
    }, function(selected, scrollIndex, args)
        if selected == 1 then
            lib.showMenu('vehiclemenu')
        elseif selected == 2 then
            lib.showMenu('playermenu')
        end        
    end)
    loaded = true
     lib.print.info('UI Loaded to ox_Lib')
else
     lib.print.info('moving to opening')
end
    lib.showMenu('adminmenu')
end)

    lib.addKeybind({
     name = 'openmenu',
     description = locale('keybind_name'),
     defaultKey = Config.menukeybind,
     onReleased = function()
         --lib.print.info(Config.menucommand)
        ExecuteCommand(Config.menucommand)
        --TriggerEvent('nd-adminmenu/openmenu')
     end,
    })