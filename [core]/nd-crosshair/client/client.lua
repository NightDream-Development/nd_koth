CreateThread(
    function()
        while true do
            Wait(0)
            if IsPedArmed(cache.ped, 4 | 2) then
                if (IsPlayerFreeAiming(cache.ped)) then
                    SendNUIMessage({display = "crosshairShow"})
                    Wait(100)
                else
                    SendNUIMessage({display = "crosshairHide"})
                    Wait(100)
                end
            else
                SendNUIMessage({display = "crosshairHide"})
                Wait(1000)
            end
        end
    end
)
