local isGamePaused = false

local function toggleTownDevelopment()
    -- TODO: Add checkbox to townwindow and do this on a per town basis.
    local towns = game.interface.getTowns()
    for _, id in pairs(towns) do
        game.interface.setTownDevelopmentActive(id, true)
    end
end

function data()
    return {
        update = function()
            if game ~= nil and not isGamePaused then
                game.interface.setGameSpeed(0)
                isGamePaused = true
            end
        end
    }
end
