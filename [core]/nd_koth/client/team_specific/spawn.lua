lib.locale()
CreateThread(function()
    DoScreenFadeOut(0)
    Wait(4000)
    lib.registerContext({
        id = 'join_menu',
        title = locale('chose_team'),
        menu = 'join_menu',
        onBack = function()
		-- I will make a better menu later!
                lib.showContext('join_menu')
        end,
        options = {{
            title = locale('chose_red'),
            description = '',
            icon = 'fa-solid fa-gun',
            onSelect = function()
                -- ExecuteCommand('team red')
                TriggerServerEvent('koth:setteam', 'red')
                Wait(5000)
                DoScreenFadeIn(1000)
            end
        }, {
            title = locale('chose_green'),
            description = '',
            icon = 'fa-solid fa-gun',
            onSelect = function()
                TriggerServerEvent('koth:setteam', 'green')
                Wait(5000)
                DoScreenFadeIn(1000)
            end
        }, {
            title = locale('chose_blue'),
            description = '',
            icon = 'fa-solid fa-gun',
            onSelect = function()
                TriggerServerEvent('koth:setteam', 'blue')
                Wait(5000)
                DoScreenFadeIn(1000)
            end
        }}
    })
    TriggerServerEvent('koth:join')
    lib.showContext('join_menu')
end)