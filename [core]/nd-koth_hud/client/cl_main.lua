-- CreateThread(function()
--     while true do
--         --print(zoneteam)
--         Wait(1000)
--     end
-- end)

lib.locale()
zoneteam = Senki

RegisterNetEvent('koth:ui:kingupdate')
AddEventHandler('koth:ui:kingupdate', function(team)
	print('[koth:ui] Team with most players in the zone: ' ..team )
    SendNUIMessage({
        kingteam = team
    })
    zoneteam = team
end)


RegisterNetEvent('koth:ui:teamnum')
AddEventHandler('koth:ui:teamnum', function(red, green, blue)
	print('[koth:ui] Players in the zone red: '..red.. ' green: ' ..green.. ' blue:' ..blue)
    SendNUIMessage({
        team1 = red,
        team2 = blue,
        team3 = green
    })
end)

RegisterNetEvent('koth:ui:timeupdate')
AddEventHandler('koth:ui:timeupdate', function(gettime)
    SendNUIMessage({
        time = gettime
    })
end)


RegisterNetEvent("koth:ui:endmatchscrn")
AddEventHandler("koth:ui:endmatchscrn",function()
        if zoneteam == 'Senki' then
            lib.alertDialog({
				header = lib.locale('ended'),
				content = lib.locale('draw_end'),
				centered = true,
				cancel = false
			})
        else
		lib.alertDialog({
			header = lib.locale('ended'),
			content = lib.locale('team_won'),
			centered = true,
			cancel = false
		})
        end
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
end)