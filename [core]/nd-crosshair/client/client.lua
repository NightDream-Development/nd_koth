CreateThread(
    function()
        while true do
            Wait(0)
            if IsPedArmed(cache.ped, 4 | 2) then
                if (IsPlayerFreeAiming(cache.ped)) then
                    --print(IsPlayerFreeAiming(cache.ped))
                    SendNUIMessage({display = "crosshairShow"})
                    Wait(100)
                else
                    --print(IsPlayerFreeAiming(cache.ped))
                    SendNUIMessage({display = "crosshairHide"})
                    Wait(100)
                end
            else
                SendNUIMessage({display = "crosshairHide"})
                Wait(100)
            end
        end
    end
)
