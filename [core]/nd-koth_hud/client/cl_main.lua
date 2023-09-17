-- CreateThread(function()
--     while true do
--         --print(zoneteam)
--         Wait(1000)
--     end
-- end)
zoneteam = Senki

RegisterNetEvent('koth:ui:kingupdate')
AddEventHandler('koth:ui:kingupdate', function(team)
    SendNUIMessage({
        kingteam = team
    })
    zoneteam = team
end)


RegisterNetEvent('koth:ui:teamnum')
AddEventHandler('koth:ui:teamnum', function(red, green, blue)
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
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~r~MECCS VÉGETÉRT!")
        if zoneteam == 'Senki' then
            PushScaleformMovieMethodParameterString('DÖNTETLEN!')
        else
		PushScaleformMovieMethodParameterString('A meccset a ' ..zoneteam.. ' csapat nyerte!')
        end
		PushScaleformMovieMethodParameterInt(5)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
		ClearDrawOrigin()
		while true do
			Citizen.Wait(0)
			DisableAllControlActions(0)
			DisableFrontendThisFrame()
			local ped = GetPlayerPed(-1)
			SetEntityCoords(ped, 0, 0, 0, 0, 0, 0, false)
			FreezeEntityPosition(ped, true)
			DrawRect(0.0,0.0,2.0,2.0,0,0,0,255)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
end)