local vehicles = {}

local cargo_data = require "como/data/cargo_data"

-- ------------------------------------------------------------------ --

local function passengerSeatAmount(seatProvider)
  local seatAmount = #seatProvider.seats

  for index = 1, seatAmount do
    if seatProvider.seats[index].crew then
      seatAmount = seatAmount - 1 -- Crew does not count towards capacity
    end
  end

  return seatAmount
end

-- ------------------------------------------------------------------ --
-- TODO: If modded vehicle does not follow the /4 rule, it will be op. See if we can circumvent this here?
-- Is there anyway to differentiate between vanilla and modded vehicles?
local function capacityRectifier(compartments, isList)
  local CAPACITY_MULTIPLIER = 4 -- Base game divides by 4, so we undo this here
  local possible_cargoes

  for compartment = 1, #compartments do
    if isList then
      possible_cargoes = compartments[compartment].loadConfigs
    else
      possible_cargoes = compartments[compartment]
    end

    for cargo_type = 1, #possible_cargoes do
      if isList then
        if #compartments[compartment].loadConfigs[cargo_type].cargoEntries > 0 then
          compartments[compartment].loadConfigs[cargo_type].cargoEntries[1].capacity = compartments[compartment].loadConfigs[cargo_type].cargoEntries[1].capacity * CAPACITY_MULTIPLIER
        end
      else
        if #compartments[compartment][cargo_type] > 0 then
          compartments[compartment][cargo_type][1].capacity = compartments[compartment][cargo_type][1].capacity * CAPACITY_MULTIPLIER
        end
      end
    end
  end

  return compartments
end
-- ------------------------------------------------------------------ --

local function increaseCapacity(filename, vehicle)

  if (vehicle.metadata.transportVehicle) then
    -- TODO: do I need to check if capacity == seats?
    --local passenger_seats = 0
    --if (vehicle.metadata.seatProvider) then
    --  passenger_seats = passengerSeatAmount(vehicle.metadata.seatProvider)
    --end

    if vehicle.metadata.transportVehicle.compartments then
      vehicle.metadata.transportVehicle.compartments = capacityRectifier(vehicle.metadata.transportVehicle.compartments, false)
    elseif vehicle.metadata.transportVehicle.compartmentsList then
      vehicle.metadata.transportVehicle.compartmentsList = capacityRectifier(vehicle.metadata.transportVehicle.compartmentsList, true)
    end

  end

  return vehicle
end

-- ------------------------------------------------------------------ --

local function noEndYear(filename, vehicle)
  if vehicle.metadata.transportVehicle and vehicle.metadata.availability then
    vehicle.metadata.availability.yearTo = 0
  end

  return vehicle
end
-- ------------------------------------------------------------------ --

local function makeAllTrainsReverse(filename, train)
  if train.metadata.railVehicle then
    train.metadata.transportVehicle.reversible = true
  end

  return train
end

-- ------------------------------------------------------------------ --

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
  addModifier("loadModel", noEndYear)
  addModifier("loadModel", allowBAE146OnAirfield)
  addModifier("loadModel", increaseCapacity)
end

return vehicles
