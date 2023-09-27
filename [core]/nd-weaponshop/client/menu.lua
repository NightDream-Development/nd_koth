RegisterNetEvent('koth:openweaponshop')
AddEventHandler('koth:openweaponshop', function(cteam)
    lib.registerContext({
        id = 'kit_menut',
        title = 'Válassz egy kitet',
        menu = 'kit_menut',
        options = {
            {
            title = 'AK-47 kit',
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
                    type = ''
                })
            end
        },
        {
            title = 'M4 kit',
            description = '',
            icon = 'fa-solid fa-gun',
            onSelect = function()
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
                    type = ''
                })
            end
        }
    }
    })
    lib.showContext('kit_menut')
end)