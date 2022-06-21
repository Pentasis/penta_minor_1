local cims = {}

local cims_data = require "como/data/cims_data"
local helper = require "pentasis/helper_functions"

-- ------------------------------------------------------------------ --

local function overlapWardrobe(filename, character)
  local charName = ""

  if string.find(filename, "/model/characters/") ~= nil then
    charName = helper.getFileName(filename)
    charName = string.sub(charName, 1, -5)

    if CIMS[charName] ~= nil then
      character.metadata.availability.yearFrom = cims_data.CIMS[charName][1]
      character.metadata.availability.yearTo = cims_data.CIMS[charName][2]
    end
  end

  return character
end

-- ------------------------------------------------------------------ --

local function overlapCars(filename, car)
  local carName = ""

  if string.find(filename, "/model/vehicle/car/") ~= nil then
    carName = helper.getFileName(filename)
    carName = string.sub(carName, 1, -5)

    if CARS[carName] ~= nil then
      car.metadata.availability.yearFrom = cims_data.CARS[carName][1]
      car.metadata.availability.yearTo = cims_data.CARS[carName][2]
    end
  end

  return car
end

-- ================================================================== --

function cims.tweakBehaviour()
  addModifier("loadModel", overlapWardrobe)
  addModifier("loadModel", overlapCars)
end

return cims
