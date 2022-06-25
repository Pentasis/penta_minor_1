local isFirstRun = true

local function pauseGame()
    game.interface.setGameSpeed(0)
end

-- ================================================================== --

function data()
  return {
    update = function()
      if isFirstRun and game then
        pauseGame()
        isFirstRun = false
      end
    end
  }
end
