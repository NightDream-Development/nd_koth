--This is for spawning blips on map
function blipspawn()
    -- red team blips
    local redblip = AddBlipForRadius(650.5582, 646.4577, 128.9109, 250.0)
    SetBlipAlpha(redblip, 155)
    SetBlipColour(redblip, 1)
    -- blue team blips
    local blueblip = AddBlipForRadius(-2078.9465, -327.4488, 13.1342, 250.0)
    SetBlipAlpha(blueblip, 155)
    SetBlipColour(blueblip, 3)
    -- green team blips
    local greenblip = AddBlipForRadius(63.0629, -1572.7197, 29.5978, 250.0)
    SetBlipAlpha(greenblip, 155)
    SetBlipColour(greenblip, 2)
    -- dead zone
    local deadblip = AddBlipForRadius(-362.0161, -303.7297, 32.4943, 650.0)
    SetBlipAlpha(deadblip, 155)
    SetBlipColour(deadblip, 72)
end

function devprint(name, text)
    --print('[' .. name .. ']: ' .. text)
    --Use lib to print for performance suggested by StrixLuca
    --We use mostly info to devprint so it sghould be good!
    lib.print.info(text)
 end