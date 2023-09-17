local talkingonradio = false
local playinganim = false
AddEventHandler("pma-voice:radioActive", function(isRadioTalking)
    talkingonradio = isRadioTalking
end)

local previousState = false
CreateThread(function()
    while true do
        RequestAnimDict("cellphone@")
        Wait(100) 
        if talkingonradio ~= previousState then
            previousState = talkingonradio
            if talkingonradio then
                local ped = cache.ped
                radioProp = CreateObject(GetHashKey("prop_cs_hand_radio"), 1.0, 0.0, 0.0, true, true, true)
                AttachEntityToEntity(radioProp, ped, GetPedBoneIndex(ped, 57005), 0.12, 0.0, -0.05, 80.0, 0.0, 80.0, true, true, false, true, 1, true)
                TaskPlayAnim(ped, "cellphone@", "cellphone_text_to_call", 8.0, -8, -1, 50, 0, false, false, false)
            else
                ClearPedTasks(cache.ped)
                DetachEntity(radioProp, true, true)
                DeleteObject(radioProp)
                SetPedMovementClipset(cache.ped, 'move_m@bag')
                ResetPedWeaponMovementClipset(cache.ped)
                ResetPedStrafeClipset(cache.ped)
            end
        end
    end
end)
