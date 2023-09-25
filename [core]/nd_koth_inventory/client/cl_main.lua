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
    while true do
        Citizen.Wait(0)

        -- Update the UI with the latest inventory data
        SendNUIText("updateInventory", inventorySlots)

        -- Handle keybindings to switch between slots and use items.
        if IsControlJustPressed(0, 157) then -- Key 1 for primary weapon
            GiveWeaponToPlayer(inventorySlots.primaryWeapon)
            inventorySlots.primaryWeapon = nil
        elseif IsControlJustPressed(0, 158) then -- Key 2 for secondary weapon
            GiveWeaponToPlayer(inventorySlots.secondaryWeapon)
            inventorySlots.secondaryWeapon = nil
        end

        -- Disable weapon wheel (optional)
        HideHudComponentThisFrame(19) -- Weapon wheel

    end
end)

-- Function to send NUI (HTML) messages
function SendNUIText(action, data)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = action,
        inventoryData = data
    })
end

-- Function to give a weapon to the player
function GiveWeaponToPlayer(weaponName)
    if weaponName then
        local playerPed = GetPlayerPed(-1)
        local weaponHash = GetHashKey(weaponName)
        GiveWeaponToPed(playerPed, weaponHash, 0, false, true)
    end
end

-- Exported function to add a weapon to the inventory
exports("AddWeaponToInventory", function(weaponName)
    -- You can add logic here to determine which slot to add the weapon to
    -- For simplicity, let's assume we always add to the primary weapon slot
    inventorySlots.primaryWeapon = weaponName

    -- Trigger an event to update the UI
    TriggerEvent("updateInventory", inventorySlots)
end)