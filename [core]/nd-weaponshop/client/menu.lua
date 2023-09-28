local lvl = exports.pickle_xp:GetLevel("shooting")

RegisterNetEvent('koth:openweaponshop')
AddEventHandler('koth:openweaponshop', function(cteam)
    lib.registerContext({
        id = 'kit_menut',
        title = 'Válassz egy kitet',
        menu = 'kit_menut',
        options = {
            {
            title = 'AK-47 kit - Nem szinthez kötött',
            description = '',
            icon = 'fa-solid fa-gun',
            onSelect = function()
                exports.nd_koth_inventory:removeinv()
                Wait(600)
                    exports.nd_koth_inventory:AddWeaponToInventory(3, "WEAPON_GRENADE")
                    --GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_ASSAULTRIFLE"), 800, false, true)
                    exports.nd_koth_inventory:AddWeaponToInventory(1, "WEAPON_ASSAULTRIFLE")
                    --GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_PISTOL50"), 500, false, true)
                    exports.nd_koth_inventory:AddWeaponToInventory(2, "WEAPON_PISTOL50")
                SetPedArmour(cache.ped, 100)
                lib.notify({
                    title = 'Fegyverbolt',
                    description = 'AK-47 Kit megkapva!',
                    type = 'success'
                })
            end
        },
        {
            title = 'M4 kit - LVL 10',
            description = '',
            icon = 'fa-solid fa-gun',
            onSelect = function()
                print(lvl)
                if lvl > 10 then
                exports.nd_koth_inventory:removeinv()
                Wait(600)
                exports.nd_koth_inventory:AddWeaponToInventory(3, "WEAPON_GRENADE")
                --GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_ASSAULTRIFLE"), 800, false, true)
                exports.nd_koth_inventory:AddWeaponToInventory(1, "WEAPON_CARBINERIFLE")
                --GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_PISTOL50"), 500, false, true)
                exports.nd_koth_inventory:AddWeaponToInventory(2, "WEAPON_PISTOL50")
                SetPedArmour(cache.ped, 100)
                lib.notify({
                    title = 'Fegyverbolt',
                    description = 'M4 Kit megkapva!',
                    type = 'success'
                })
            else
                lib.notify({
                    title = 'Fegyverbolt',
                    description = 'M4 Kit csak 10-es szinttől lehet megkapni!',
                    type = 'error'
                })
            end
            end
        }
    }
    })
    lib.showContext('kit_menut')
end)

RegisterCommand('test', function()
    RequestModel(GetHashKey( "a_c_cow"))
    CreatePed(5, GetHashKey( "a_c_cow"), 659.4348,618.0666,128.9108 - 1, 123.1347, false, false)
    while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Citizen.Wait( 1 )
	end
end)