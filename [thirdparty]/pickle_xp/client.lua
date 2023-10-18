XP = {}
Categories = Config.Categories

function GetXP(name)
    return math.ceil(XP and XP[name] or 0)
end 

function GetLevel(name)
    return GetCategoryLevel(name, GetXP(name))
end 

function GetXPData() 
    local data = {}
    for k,v in pairs(Categories) do 
        local xp = GetXP(k)
        local level = GetCategoryLevel(k, xp)
        data[k] = {
            label = v.label,
            xp = xp,
            level = level,
            level_xp = GetLevelXP(k, level),
        }
    end
    return data
end

function ShowDisplay()
    SendNUIMessage({
        type = "show",
        data = GetXPData()
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback("hide", function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent("pickle_xp:updateXP", function(xp, name)
    if name then 
        XP[name] = xp
    else 
        XP = xp
    end
end)

RegisterNetEvent("pickle_xp:updateCategories", function(categories)
    Categories = categories
end)


RegisterNetEvent("pickle_xp:xpEvent", function(event, name, xp, total)
    if Config.NotifyXP then 
        local category = Categories[name]
        if not category then return end
        if event == "add" then 
            --ShowNotification(_L("xp_add", xp, category.label))
            lib.showTextUI(' '..xp..' '..category.label, {
                position = "top-center",
                icon = 'fa-solid fa-plus',
                style = {
                    borderRadius = 0,
                    backgroundColor = '#48BB78',
                    color = 'white'
                }
            })
            Wait(5000)
            lib.hideTextUI()
        elseif event == "remove" then 
           -- ShowNotification(_L("xp_remove", xp, category.label))
            lib.showTextUI('- '..xp..' '..category.label, {
                position = "top-center",
                icon = 'fa-solid fa-minus',
                style = {
                    borderRadius = 0,
                    backgroundColor = '#cf1b0e',
                    color = 'white'
                }
            })
            Wait(5000)
            lib.hideTextUI()
        end 
    end
end)

RegisterCommand('xp', function()
    ShowDisplay()
end)

exports("GetXPData", GetXPData)
exports("GetXP", GetXP)
exports("GetLevel", GetLevel)

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  Wait(1000)
  TriggerServerEvent("pickle_xp:initializePlayer")
end)
