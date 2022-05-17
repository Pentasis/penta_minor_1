local isGamePaused = false

function data()
    return {
        update = function()
            if game ~= nil and not isGamePaused then
                game.interface.setGameSpeed(0)
                isGamePaused = true
            end
        end,
    }
end
