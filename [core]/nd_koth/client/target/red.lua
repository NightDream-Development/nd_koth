function spawncartargetred()
    local NPC = {
        x = 662.4230,
        y = 622.8670,
        z = 128.9111,
        rotation = 67.4852,
        NetworkSync = true
    }
    lib.requestModel("mp_m_bogdangoon")
    Ped = CreatePed(1, "mp_m_bogdangoon", NPC.x, NPC.y, NPC.z - 1, false)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    SetEntityHeading(Ped, NPC.rotation)
    local vehicleshop = {
      {
              name = 'carshop',
              icon = 'fas fa-car',
              label = 'katalógus megnézése',
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
    local NPC2 = {
        x = 664.7071,
        y = 602.9047,
        z = 129.0509,
        rotation = 68.7576,
        NetworkSync = true
    }
    lib.requestModel("mp_m_bogdangoon")
    Ped = CreatePed(1, "mp_m_bogdangoon", NPC2.x, NPC2.y, NPC2.z - 1, false)
    FreezeEntityPosition(Ped, true)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
    SetEntityHeading(Ped, NPC2.rotation)
    local weaponshop = {
      {
        name = 'carshop',
        icon = 'fa-solid fa-person-rifle',
        label = 'Fegyver bolt megnyitása',
        onSelect = function()
            TriggerEvent('koth:openweaponshop')
        end,
        distance = 1.9
    }}
    exports.ox_target:addLocalEntity(Ped, weaponshop)
    devprint('target', 'red team target for weapon shop has been loaded!')
end

