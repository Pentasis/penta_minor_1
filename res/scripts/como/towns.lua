local towns = {}

local STREET_ANGLES = { 0, 7, 20 }
local DEVELOPMENT_INTERVALS = { 14, 60, 120, 180, 365, 730 } -- TODO: place this in data-struct?
-- ---------------------------------------------------------------------

function towns.tweakTowns(grid, development_interval)
  game.config.townMajorStreetAngleRange = STREET_ANGLES[grid + 1]
  game.config.townInitialMajorStreetAngleRange = STREET_ANGLES[grid + 1]
  game.config.townDevelopInterval = DEVELOPMENT_INTERVALS[development_interval + 1]
end

return towns
