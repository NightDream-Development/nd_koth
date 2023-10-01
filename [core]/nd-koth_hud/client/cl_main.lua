-- CreateThread(function()
--     while true do
--         --print(zoneteam)
--         Wait(1000)
--     end
-- end)
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
				header = 'Match has ended!',
				content = 'Every team has won! DRAW! \n The server will restart!',
				centered = true,
				cancel = true
			})
        else
		lib.alertDialog({
			header = 'Match has ended!',
			content = 'The ' ..zoneteam.. ' has won the match! \n The server will restart!',
			centered = true,
			cancel = true
		})
        end
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
end)