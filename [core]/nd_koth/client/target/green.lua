function spawncartargetgreen()

  lib.requestModel(green.carshopped)
  Ped = CreatePed(1, green.carshopped, greencarshop.x, greencarshop.y, greencarshop.z - 1, false)
  FreezeEntityPosition(Ped, true)
  SetEntityInvincible(Ped, true)
  SetBlockingOfNonTemporaryEvents(Ped, true)
  SetEntityHeading(Ped, greencarshop.rotation)
  local vehicleshop = {
    {
            name = 'carshop',
            icon = 'fas fa-car',
            label = green.carshoplabel,
            onSelect = function()
                TriggerEvent('koth:openvehiclehop')
            end,
            distance = 1.9
    }
        }
  exports.ox_target:addLocalEntity(Ped, vehicleshop)
  TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
  devprint('target', 'green team target for vehicle shop has been loaded!')
  exports['pma-voice']:setRadioChannel(3)
  devprint('radio', 'radio for the team: green has been set!')
end

function spawnweapontargetgreen()
  lib.requestModel(green.carshopped)
  Ped = CreatePed(1, green.carshopped, greenweaponshop.x, greenweaponshop.y, greenweaponshop.z - 1, false)
  FreezeEntityPosition(Ped, true)
  SetEntityInvincible(Ped, true)
  SetBlockingOfNonTemporaryEvents(Ped, true)
  TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
  SetEntityHeading(Ped, greenweaponshop.rotation)
  local weaponshop = {
    {
      name = 'carshop',
      icon = 'fa-solid fa-person-rifle',
      label = green.weaponshoplabel,
      onSelect = function()
          TriggerEvent('koth:openweaponshop')
      end,
      distance = 1.9
  }}
  exports.ox_target:addLocalEntity(Ped, weaponshop)
  devprint('target', 'green team target for weapon shop has been loaded!')
end

