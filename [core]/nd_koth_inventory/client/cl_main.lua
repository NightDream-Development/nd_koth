local inventorySlots = {
    label1 = '',
    label2 = '',
    label3 = '',
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
        Citizen.Wait(0)
        -- Update the UI with the latest inventory data
        SendNUIText("updateInventory", inventorySlots)
        -- Disable weapon wheel (optional)
        HideHudComponentThisFrame(19) -- Weapon wheel

    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            DisableControlAction(0, 37, true)
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
end)


--keybinds

primary = false
lib.addKeybind({
    name = '1',
    description = 'Primary Weapon Useage',
    defaultKey = '1',
    onReleased = function(self)
        if not primary then
        second = false
        RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
        GiveWeaponToPlayer(inventorySlots.primaryWeapon)
        primary = true
        else
            RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
            primary = false
    end
end
})

second = false
lib.addKeybind({
    name = '2',
    description = 'Secondary Weapon Useage',
    defaultKey = '2',
    onReleased = function(self)
        if not second then
        primary = false
        RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
        GiveWeaponToPlayer(inventorySlots.secondaryWeapon)
        second = true
        else
            second = false
            RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
    end
end
})


throw = false
lib.addKeybind({
    name = '3',
    description = 'Throwables',
    defaultKey = '3',
    onReleased = function(self)
        if not throw then
        primary = false
        second = false
        RemoveWeaponFromPed(cache.ped, inventorySlots.primaryWeapon)
        RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
        GiveWeaponToPlayer(inventorySlots.throwables)
        throw = true
        else
            throw = false
            RemoveWeaponFromPed(cache.ped, inventorySlots.throwables)
    end
end
})
