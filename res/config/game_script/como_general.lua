local helper = require "pentasis/helper_functions"

local isFirstRun = true

local function toggleTownDevelopment()
  --local isActive = true
  -- TODO: How do I read a param in this file?
  --if town_dev == 1 then
  --  isActive = false
  --end

  --local all_towns = game.interface.getTowns()
  --for _, town_id in pairs(all_towns) do
  --  game.interface.setTownDevelopmentActive(town_id, isActive)
  --end
end

local function pauseGame()
    game.interface.setGameSpeed(0)
end

-- ================================================================== --

function data()
  return {
    update = function()
      if isFirstRun and game then
        pauseGame()
        toggleTownDevelopment()
        isFirstRun = false
      end
    end
  }
end
