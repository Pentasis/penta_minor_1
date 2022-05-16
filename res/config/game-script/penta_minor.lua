local isGamePaused = false

local function startPaused()
    if game ~= nil and not isGamePaused then
        game.interface.setGameSpeed(0)
        isGamePaused = true
    end
end

function data()
    return {
        update = startPaused,
    }
end
