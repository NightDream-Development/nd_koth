
function DisableCopHUDAndWantedSystem()
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
end

Citizen.CreateThread(function()
    Citizen.Wait(100)
    DisableCopHUDAndWantedSystem()
end)
