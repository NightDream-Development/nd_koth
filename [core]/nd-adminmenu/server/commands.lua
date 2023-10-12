lib.locale()
--Command
--Make more command any adjust the restricted part for your roles!
lib.addCommand(Config.menucommand, {
  help = locale('open_menu_help'),
  params = {},
  restricted = 'group.admin'
}, function(source, args, raw)
    TriggerClientEvent('nd-adminmenu/openmenu', source)
end)

RegisterNetEvent('nd-adminmenu/announcment', function(msg)
  local players = GetPlayers()
  for _, playerId in ipairs(players) do
      TriggerClientEvent('nd-adminmenu/cannouncment', playerId, msg)
      TriggerClientEvent('chat:addMessage', playerId, {
        templateId =  'announcment',
        multiline =  false,
        args = {
            '#e74c3c',
            'fa-solid fa-circle-exclamation',
            locale('staff_announcment'),
            '',
            msg
        } 
    })
  end
end)


RegisterNetEvent('nd-adminmenu/server/revive', function(player)
  --TriggerEvent('hospital:client:Revive', player)
  TriggerClientEvent('lss-basicdeath:client:RevivePlayer', player, 'admin')
end)


--ban system server side! (Imported from qb-adminmenu but modified by drazox to fit the admin menu!)
-- RegisterNetEvent('nd-adminmenu/server/ban', function(input)
--   player = input[1]
--   local BanDuration = (input[3] or 0) * 3600 + (input[4] or 0) * 86400 + (input[5] or 0) * 2629743
--   -- print('ID: ' ..input[1].. ' Ki lett bannolva! Oka: ' ..input[2].. ' Végetér: ' ..BanDuration)
--   MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
--     GetPlayerName(input[1]),
--     QBCore.Functions.GetIdentifier(input[1], 'license'),
--     QBCore.Functions.GetIdentifier(input[1], 'discord'),
--     QBCore.Functions.GetIdentifier(input[1], 'ip'),
--     input[2],
--     BanDuration,
--     GetPlayerName(source)
--   })
--     DropPlayer(player, 'ID: ' ..input[1].. ' Ki lett bannolva! Oka: ' ..input[2])
-- end)

--Use other ban system for now!



CreateThread(function()
	Wait(5000)
    local resName = GetCurrentResourceName()

		print("^2["..resName.."] - NightDream Developments - Advanced Admin Menu.")
		print("^2["..resName.."] - Started! Checking for TxAdmin! ")
    print('Revive dosent use QBCore version of hospital')
    print('Use lss-basicDeath for now')
    Wait(2000)
    if GetResourceState('monitor') == 'started' then
      print("^2["..resName.."] - TxAdmin Has been detected!")
      print("^1["..resName.."] - This script is using Spectate functions from the TxAdmin menu!")
    else
    print("^1["..resName.."] - Make sure that TxAdmin is installed and menu is on!")
    print("^1["..resName.."] - This script is using Spectate functions from the TxAdmin menu!")
  end
end)


