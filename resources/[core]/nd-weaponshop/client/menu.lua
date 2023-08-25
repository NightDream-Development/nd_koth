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
                if not HasPedGotWeapon(cache.ped, GetHashKey("WEAPON_GRENADE"), false) then
                    GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_GRENADE"), 8, false, true)
                end
                
                if not HasPedGotWeapon(cache.ped, GetHashKey("WEAPON_ASSAULTRIFLE"), false) then
                    GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_ASSAULTRIFLE"), 800, false, true)
                end
                
                if not HasPedGotWeapon(cache.ped, GetHashKey("WEAPON_PISTOL50"), false) then
                    GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_PISTOL50"), 500, false, true)
                end
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
            GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_ASSAULTRIFLE"), 200, false, true)
            GiveWeaponToPed(cache.ped, GetHashKey("WEAPON_PISTOL"), 100, true, true)
            if HasPedGotWeapon(cache.ped, GetHashKey("WEAPON_PISTOL"), false) then
                  GiveWeaponComponentToPed(cache.ped, GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            end
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