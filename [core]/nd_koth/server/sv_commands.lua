lib.addCommand('admin:ad', {
    help = 'Advert For Admin',
    restricted = 'group.admin'
}, function(source, args, raw)
    local message = table.concat(args, ' ')
    TriggerClientEvent('chat:addMessage', -1 , {
        templateId =  'ccChat',
        multiline =  false,
        args = {
            '#e74c3c',
            'fa-solid fa-shield',
            'Admin felhívás - ' ..GetPlayerName(source),
            '',
            message
        } 
    })
end)

lib.addCommand('say', {
    help = 'Közös csevegő',
}, function(source, args, raw)
    local message = table.concat(args, ' ')

    TriggerClientEvent('chat:addMessage', -1 , {
        templateId =  'ccChat',
        multiline =  false,
        args = {
            '#4287f5',
            'fa-solid fa-walkie-talkie',
            '' .. GetPlayerName(source) .. ' - ' .. source,
            '',
            message
        }
    })
end)