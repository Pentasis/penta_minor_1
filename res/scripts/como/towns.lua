local towns = {}

local STREET_ANGLES = { 0, 7, 20 }
-- ---------------------------------------------------------------------

function towns.tweakTowns(grid)
  game.config.townMajorStreetAngleRange = STREET_ANGLES[grid + 1]
  game.config.townInitialMajorStreetAngleRange = STREET_ANGLES[grid + 1]
end

return towns
