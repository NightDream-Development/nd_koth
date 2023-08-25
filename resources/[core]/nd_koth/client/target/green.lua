function greenspawncartarget()
    local NPC = { x = 52.4490, y = -1553.0044, z = 29.4602, rotation = 227.7356, NetworkSync = true}
    function createNPC()
    created_ped = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
    end
  
    Citizen.CreateThread(function()
      modelHash = GetHashKey("mp_m_bogdangoon")
      RequestModel(modelHash)
      while not HasModelLoaded(modelHash) do
           Wait(1)
      end
      createNPC() 
    end)
  
    exports.ox_target:addBoxZone({
      coords = vec3(NPC.x,NPC.y,NPC.z + 1),
      size = vec3(1, 1, 2),
      rotation = NPC.rotation,
      debug = false,
      CanInteract = function()
        if sourceteam == red then
            return true
        end
      end,
      options = {
        {
            name = 'carshop',
            icon = 'fas fa-car',
            label = 'katalógus megnézése',
            onSelect = function()
                TriggerEvent('koth:openvehiclehop')
            end,
            distance = 1.9,
        },
        }
    })
    devprint('target', 'green team target for vehicle shop has been loaded!')
    exports['pma-voice']:setRadioChannel(2)
    devprint('radio', 'radio for the team: green has been set!')
end


function greenspawnweapontarget()
  local NPC2 = { x = 60.4238, y = -1579.8210, z = 29.5978, rotation = 52.6066, NetworkSync = true}
  function createNPC2()
  created_ped2 = CreatePed(0, modelHash , NPC2.x, NPC2.y, NPC2.z - 1, NPC2.rotation, true)
  FreezeEntityPosition(created_ped2, true)
  SetEntityInvincible(created_ped2, true)
  SetBlockingOfNonTemporaryEvents(created_ped2, true)
  TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_GUARD_STAND_CASINO", 0, true)
  end

  Citizen.CreateThread(function()
    modelHash = GetHashKey("mp_m_bogdangoon")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
         Wait(1)
    end
    createNPC2() 
  end)

  exports.ox_target:addBoxZone({
    coords = vec3(NPC2.x,NPC2.y,NPC2.z + 1),
    size = vec3(1, 1, 2),
    rotation = NPC2.rotation,
    debug = false,
    CanInteract = function()
      if sourceteam == red then
          return true
      end
    end,
    options = {
      {
          name = 'carshop',
          icon = 'fas fa-gun-squirt',
          label = 'Fegyver bolt megnyitása',
          onSelect = function()
              TriggerEvent('koth:openweaponshop')
          end,
          distance = 1.9,
      },
      }
  })
  devprint('target', 'green team target for weapon shop has been loaded!')
end

