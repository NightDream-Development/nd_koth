local dead = false
RegisterNetEvent('lss-basicdeath:client:SetPlayerDead', function()
    Wait(500)
    dead = true
    if lib.progressActive() then
        lib.cancelProgress()
    end
    lib.requestAnimDict("veh@low@front_ps@idle_duck")
    lib.requestAnimDict('combat@damage@writhe')

    local PedPos = GetEntityCoords(cache.ped)
    local Heading = GetEntityHeading(cache.ped)
    while GetEntitySpeed(cache.ped) > 0.5 or IsPedRagdoll(cache.ped) do
        Wait(100)
    end
    SendNUIMessage({
        type = "show",
        timer = Config.DeathTime,
        header = locale('header'),
        desc = locale('description')
    })
    SetEntityHealth(cache.ped, 200)
    ClearPedBloodDamage(cache.ped)
    ResetPedVisibleDamage(cache.ped)
    ClearPedLastWeaponDamage(cache.ped)
    SetPedArmour(cache.ped, 0)
    while dead do
        if IsPedInAnyVehicle(cache.ped, false) then
            if not IsEntityPlayingAnim(cache.ped, "veh@low@front_ps@idle_duck", "sit", 3) then
                TaskPlayAnim(cache.ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 1.0, -1, 1, 0, false, false, false)
            end
        else
            if not IsEntityPlayingAnim(cache.ped, 'combat@damage@writhe', 'writhe_loop', 3) then
                TaskPlayAnim(cache.ped, 'combat@damage@writhe', 'writhe_loop', 1.0, 1.0, -1, 1, 0, false, false,
                    false)
            end
        end
        Wait(100)
    end
end)

RegisterNetEvent('lss-basicdeath:client:RevivePlayer', function(type)
    Wait(500)
    SetEntityHealth(cache.ped, 200)
    ClearPedBloodDamage(cache.ped)
    ResetPedVisibleDamage(cache.ped)
    ClearPedLastWeaponDamage(cache.ped)
    SetPedArmour(cache.ped, 0)
    SetEntityInvincible(cache.ped, false)
    TriggerEvent('koth:revive')
    TriggerEvent('playerSpawned')
    dead = false
end)

RegisterNuiCallback("time_expired", function(data)
    Wait(500)
    exports.ox_target:disableTargeting(false)
    SetEntityHealth(cache.ped, 200)
    ClearPedBloodDamage(cache.ped)
    ResetPedVisibleDamage(cache.ped)
    ClearPedLastWeaponDamage(cache.ped)
    SetPedArmour(cache.ped, 0)
    SetEntityInvincible(cache.ped, false)
    TriggerEvent('koth:revive')
    SendNUIMessage({ type = "hide" })
    TriggerEvent('playerSpawned')
    dead = false
    dead = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local health = GetEntityHealth(cache.ped)
        if health <= 0 then
            if dead then
                Wait(500)
            else
                dead = true
            TriggerEvent('lss-basicdeath:client:SetPlayerDead')
            ens
        end
    end
end)