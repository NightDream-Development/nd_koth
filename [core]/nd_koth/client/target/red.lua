function spawncartargetred()

    lib.requestModel(red.carshopped)
    Ped = CreatePed(1, red.carshopped, redcarshop.x, redcarshop.y, redcarshop.z - 1, false)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    SetEntityHeading(Ped, redcarshop.rotation)
    local vehicleshop = {
      {
              name = 'carshop',
              icon = 'fas fa-car',
              label = red.carshoplabel,
              onSelect = function()
                  TriggerEvent('koth:openvehiclehop')
              end,
              distance = 1.9
      }
          }
    exports.ox_target:addLocalEntity(Ped, vehicleshop)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
    devprint('target', 'red team target for vehicle shop has been loaded!')
    exports['pma-voice']:setRadioChannel(3)
    devprint('radio', 'radio for the team: red has been set!')
end

function spawnweapontargetred()
    lib.requestModel(red.carshopped)
    Ped = CreatePed(1, red.carshopped, redweaponshop.x, redweaponshop.y, redweaponshop.z - 1, false)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
    SetEntityHeading(Ped, redweaponshop.rotation)
    local weaponshop = {
      {
        name = 'carshop',
        icon = 'fa-solid fa-person-rifle',
        label = red.weaponshoplabel,
        onSelect = function()
            TriggerEvent('koth:openweaponshop')
        end,
        distance = 1.9
    }}
    exports.ox_target:addLocalEntity(Ped, weaponshop)
    devprint('target', 'red team target for weapon shop has been loaded!')
end

