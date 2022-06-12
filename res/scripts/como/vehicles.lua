local vehicles = {}

local function makeAllTrainsReverse(filename, train)
  if train.metadata.railVehicle then
    train.metadata.transportVehicle.reversible = true
  end

  return train
end

local function allowBAE146OnAirfield(filename, bae)
  if string.find(filename, "bae_146") and bae.metadata.airVehicle then
    bae.metadata.airVehicle.type = "SMALL"
  end

  return bae
end

-- ================================================================== --

function vehicles.tweakVehicles()
  game.config.trainBrakeDeceleration = 1
  game.config.chargeMaintenanceInterval = 180

  addModifier("loadModel", makeAllTrainsReverse)
  addModifier("loadModel", allowBAE146OnAirfield)
end

return vehicles
