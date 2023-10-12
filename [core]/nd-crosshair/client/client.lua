CreateThread(
    function()
        while true do
            Wait(100) -- Increase the Wait time to 100 milliseconds for better performance
            
            if IsPedArmed(cache.ped, 4 | 2) then
                local isPlayerFreeAiming = IsPlayerFreeAiming(cache.ped) -- Avoid repeated function calls
                
                if isPlayerFreeAiming then
                    SendNUIMessage({display = "crosshairShow"})
                else
                    SendNUIMessage({display = "crosshairHide"})
                end
            else
                SendNUIMessage({display = "crosshairHide"})
            end
        end
    end
)
