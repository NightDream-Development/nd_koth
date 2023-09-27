function spawncartargetblue()
  lib.requestModel(blue.carshopped)
  Ped = CreatePed(1, blue.carshopped, bluecarshop.x, bluecarshop.y, bluecarshop.z - 1, false)
  FreezeEntityPosition(Ped, true)
  SetEntityInvincible(Ped, true)
  SetBlockingOfNonTemporaryEvents(Ped, true)
  SetEntityHeading(Ped, bluecarshop.rotation)
  local vehicleshop = {
    {
            name = 'carshop',
            icon = 'fas fa-car',
            label = blue.carshoplabel,
            onSelect = function()
                TriggerEvent('koth:openvehiclehop')
            end,
            distance = 1.9
    }
        }
  exports.ox_target:addLocalEntity(Ped, vehicleshop)
  TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
  devprint('target', 'blue team target for vehicle shop has been loaded!')
  exports['pma-voice']:setRadioChannel(3)
  devprint('radio', 'radio for the team: blue has been set!')
end

function spawnweapontargetblue()
  lib.requestModel(blue.carshopped)
  Ped = CreatePed(1, blue.carshopped, blueweaponshop.x, blueweaponshop.y, blueweaponshop.z - 1, false)
  FreezeEntityPosition(Ped, true)
  SetEntityInvincible(Ped, true)
  SetBlockingOfNonTemporaryEvents(Ped, true)
  TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
  SetEntityHeading(Ped, blueweaponshop.rotation)
  local weaponshop = {
    {
      name = 'carshop',
      icon = 'fa-solid fa-person-rifle',
      label = blue.weaponshoplabel,
      onSelect = function()
          TriggerEvent('koth:openweaponshop')
      end,
      distance = 1.9
  }}
  exports.ox_target:addLocalEntity(Ped, weaponshop)
  devprint('target', 'blue team target for weapon shop has been loaded!')
end

