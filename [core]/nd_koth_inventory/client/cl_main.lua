local inventorySlots = {
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

        -- Handle keybindings to switch between slots and use items.
        if IsControlJustPressed(0, 157) then -- Key 1 for primary weapon
        elseif IsControlJustPressed(0, 158) then -- Key 2 for secondary weapon
            GiveWeaponToPlayer(inventorySlots.secondaryWeapon)
            inventorySlots.secondaryWeapon = nil
        end

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
exports("AddWeaponToInventory", function(what,weaponName)
        -- You can add logic here to determine which slot to add the weapon to
    -- For simplicity, let's assume we always add to the primary weapon slot
    if what == 1 then
        inventorySlots.primaryWeapon = weaponName
    elseif what == 2 then
        inventorySlots.secondaryWeapon = weaponName
    elseif what == 3 then
        inventorySlots.throwables = weaponName
    end
    
        -- Trigger an event to update the UI
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
        GiveWeaponToPlayer(inventorySlots.secondaryWeapon)
        second = true
        else
            second = false
            RemoveWeaponFromPed(cache.ped, inventorySlots.secondaryWeapon)
    end
end
})
