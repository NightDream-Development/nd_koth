
lib.addCommand('revive', {
    help = locale('admin_revive'),
	restricted = "group.admin",
		params = {
        { name = 'id', help = locale('kill_id'), optional = true },
    }
}, function(source, args)
		TriggerClientEvent('lss-basicdeath:client:RevivePlayer', args.id, 'admin')
end)

-- lib.addCommand('kill', {
--     help = locale('admin_kill'),
-- 	restricted = "group.admin",
-- 	params = {
--         { name = 'id', help = locale('kill_id'), optional = true },
--     }
-- }, function(source, args)
-- 	if not args.id then
-- 		TriggerClientEvent('lss-basicdeath:client:SetPlayerDead', source)
-- 	else	
-- 		if type(tonumber(args.id)) == 'number' then
-- 			local xPlayer = tonumber(source)
-- 			local IsDead = Player(args.id).state.isDead
-- 			TriggerClientEvent('ox_lib:notify', xPlayer.source, { description = locale('got_killed'), type = 'inform' })
-- 			TriggerClientEvent('lss-basicdeath:client:SetPlayerDead', xPlayer.source)
-- 		else
-- 			TriggerClientEvent('ox_lib:notify', source, { description = locale('went_wrong'), type = 'error' })
-- 		end	
-- 	end
-- end)
