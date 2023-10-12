
function DisableCopHUDAndWantedSystem()
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
end

CreateThread(function()
    Wait(100)
    DisableCopHUDAndWantedSystem()
end)
