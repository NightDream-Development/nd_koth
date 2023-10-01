lib.locale()
local inventorySlots = {
    label1 = lib.loacle('noslot'),
    label2 = lib.loacle('noslot'),
    label3 = lib.loacle('noslot'),
    primaryWeapon = nil,
    secondaryWeapon = nil,
    customItems = {},
    throwables = {}
}

RegisterNetEvent("updateInventory")
AddEventHandler("updateInventory", function(updatedInventory)
    inventorySlots = updatedInventory
end)

Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    while true do
        Wait(100)
        -- Update the UI with the latest inventory data
        SendNUIText("updateInventory", inventorySlots)

    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
            DisableControlAction(0, 37, true)
        HideHudComponentThisFrame(19) -- Weapon wheel
    end
end)

-- Function to send NUI (HTML) messages
function SendNUIText(action, data)
    SendNUIMessage({
        type = action,
        inventoryData = data
    })
end

-- Function to give a weapon to the player
function GiveWeaponToPlayer(weaponName)
    if weaponName then
        local weaponHash = GetHashKey(weaponName)
        GiveWeaponToPed(cache.ped, weaponHash, 999999, false, true)
    end
end

-- Exported function to add a weapon to the inventory
--example exports.nd_koth_inventory:AddWeaponToInventory(3, "WEAPON_GRENADE")
exports("AddWeaponToInventory", function(what,weaponName)
    if what == 1 then
        inventorySlots.primaryWeapon = weaponName
    elseif what == 2 then
        inventorySlots.secondaryWeapon = weaponName
    elseif what == 3 then
        inventorySlots.throwables = weaponName
    end
    
        TriggerEvent("updateInventory", inventorySlots)
end)
--example exports.nd_koth_inventory:removeinv()
exports("removeinv", function()
    inventorySlots.primaryWeapon = nil
    inventorySlots.secondaryWeapon = nil
    inventorySlots.throwables = nil
    RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
    RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
    TriggerEvent("updateInventory", inventorySlots)
    inventorySlots.label1 = lib.loacle('noslot')
    inventorySlots.label2 = lib.loacle('noslot')
    inventorySlots.label3 = lib.loacle('noslot')
end)


--keybinds

primary = false
lib.addKeybind({
    name = '1',
    description = 'Primary Weapon Useage',
    defaultKey = '1',
    onReleased = function(self)
        if inventorySlots.primaryWeapon == nil then
            lib.notify({
                id = 'noWP',
                title = 'Inventory',
                description = lib.locale('no_wpslot'),
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#C1C2C5',
                    ['.description'] = {
                      color = '#909296'
                    }
                },
                icon = 'ban',
                iconColor = '#C53030'
            })
            inventorySlots.label1 = lib.loacle('noslot')
        else

        if not primary then
        second = false    
            RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
            GiveWeaponToPlayer(inventorySlots.primaryWeapon)
            primary = true
            throw = false
            RemoveWeaponFromPed(cache.ped, inventorySlots.throwables)
            inventorySlots.label3 = lib.loacle('grenade_off')
            inventorySlots.label1 = lib.loacle('bigkaliber_on')
            inventorySlots.label2 = lib.loacle('bigsmall_off')
        else
            RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
            inventorySlots.label1 = lib.loacle('bigkaliber_off')
            primary = false
    end
end
end
})

second = false
lib.addKeybind({
    name = '2',
    description = 'Secondary Weapon Useage',
    defaultKey = '2',
    onReleased = function(self)
        if inventorySlots.secondaryWeapon == nil then
            lib.notify({
                id = 'noWP',
                title = 'Inventory',
                description = lib.locale('no_wpslot'),
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#C1C2C5',
                    ['.description'] = {
                      color = '#909296'
                    }
                },
                icon = 'ban',
                iconColor = '#C53030'
            })
            inventorySlots.label2 = lib.loacle('noslot')
        else

        if not second then   
                primary = false
                RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
                RemoveWeaponFromPed(cache.ped, inventorySlots.throwables)
                GiveWeaponToPlayer(inventorySlots.secondaryWeapon)
                inventorySlots.label1 = lib.loacle('bigkaliber_off')
                second = true
                inventorySlots.label2 = lib.loacle('bigsmall_on')
        else
            second = false
            RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
            inventorySlots.label2 = lib.loacle('bigsmall_off')
    end
end
end
})


throw = false
lib.addKeybind({
    name = '3',
    description = 'Throwables',
    defaultKey = '3',
    onReleased = function(self)
        if json.encode(inventorySlots.throwables) == '[]' then
            lib.notify({
                id = 'noWP',
                title = 'Inventory',
                description = lib.loacle('no_grslot'),
                position = 'top',
                style = {
                    backgroundColor = '#141517',
                    color = '#C1C2C5',
                    ['.description'] = {
                      color = '#909296'
                    }
                },
                icon = 'ban',
                iconColor = '#C53030'
            })
            inventorySlots.label3 = lib.loacle('noslot')
        else
        if not throw then
                    primary = false
                    second = false
                    RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
                    RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
                    inventorySlots.label1 = lib.loacle('bigkaliber_off')
                    inventorySlots.label2 = lib.loacle('bigsmall_off')
                    GiveWeaponToPlayer(inventorySlots.throwables)
                    throw = true
                    inventorySlots.label3 = lib.loacle('grenade_on')

        else
            throw = false
            RemoveWeaponFromPed(cache.ped, inventorySlots.throwables)
            inventorySlots.label3 = lib.loacle('grenade_off')
    end
end
end
})
