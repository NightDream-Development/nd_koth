
function DisableCopHUDAndWantedSystem()
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    DisableCopHUDAndWantedSystem()
end)
