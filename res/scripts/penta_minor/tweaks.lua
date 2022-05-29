local tweaks = {}

-- ---------------------------------------------------------------------
local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function tweaks.initTweaks()
    game.config.earnAchievementsWithMods = true
    game.config.industryButton           = true
    game.config.sandboxButton            = true

end

return tweaks
