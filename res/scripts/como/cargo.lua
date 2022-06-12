local cargo = {}

-- Based on the assumption that 1 cargo unit = 1 m3 or 1 liter.
-- Mostly based on https://mojobob.com/roleplay/weight_chart.html and wikipedia
local CARGO_WEIGHTS = {
  COAL = 1400,
  CONSTRUCTION_MATERIALS = 2500, -- made from stone, small deviation
  CRUDE = 881,
  FOOD = 200, -- based on bread
  FUEL = 750,
  GOODS = 700,  -- made from plastics & planks (assume 50/50)
  GRAIN = 790,
  IRON_ORE = 5125, -- based on hematite
  LOGS = 910, -- based on oak, small deviation
  MACHINES = 4430, -- since made from steel & planks (assume 50/50)
  OIL = 790,
  PASSENGERS = 80,
  PLANKS = 900, -- based on oak
  PLASTIC = 500,
  STEEL = 7760, -- based on carbon steel
  STONE = 2725, -- based on granite
  TOOLS = 7200 -- since made from steel, small deviation
}

-- ---------------------------------------------------------------------

local function changeCargoWeights(filename, cargo_type)
  if CARGO_WEIGHTS[cargo_type.id] ~= nil then
    cargo_type.weight = CARGO_WEIGHTS[cargo_type.id]
  end

  return cargo_type
end




-- TODO: clean this mess up
local function changeCapacity(filename, vehicle)
  if vehicle.metadata.transportVehicle and vehicle.metadata.seatProvider and vehicle.metadata.seatProvider.seats then

    local thisVehicle = vehicle.metadata.transportVehicle
    local factor = 0
    local numSeatsOld = 0
    local numSeats = #vehicle.metadata.seatProvider.seats --count all seats
    local numComs = 0

    for i = 1, numSeats do
      if vehicle.metadata.seatProvider.seats[i].crew then
        numSeats = numSeats - 1 --substract the number of crew seats
      end
    end

    if thisVehicle.compartments then
      if thisVehicle.compartments[1] then
        if thisVehicle.compartments[1][1] then
          if thisVehicle.compartments[1][1][1] then
            if thisVehicle.compartments[1][1][1][1] then
              if thisVehicle.compartments[1][1][1][1].capacity then
                if thisVehicle.compartments[1][1][1][1].type == "PASSENGERS" then
                  numSeatsOld = thisVehicle.compartments[1][1][1][1].capacity
                end
              end
            elseif thisVehicle.compartments[1][1][1].capacity then
              if thisVehicle.compartments[1][1][1].type == "PASSENGERS" then
                numSeatsOld = thisVehicle.compartments[1][1][1].capacity --check original capacity
              end
            end
          elseif thisVehicle.compartments[1][1].capacity then
            if thisVehicle.compartments[1][1].type == "PASSENGERS" then
              numSeatsOld = thisVehicle.compartments[1][1].capacity
            end
          end
        elseif thisVehicle.compartments[1].capacity then
          if thisVehicle.compartments[1].type == "PASSENGERS" then
            numSeatsOld = thisVehicle.compartments[1].capacity
          end
        end
      elseif thisVehicle.compartments.capacity then
        if thisVehicle.compartments.type == "PASSENGERS" then
          numSeatsOld = thisVehicle.compartments.capacity
        end
      end
      if numSeats == 0 and numSeatsOld and numSeatsOld > 0 then
        factor = 0.25
        numSeats = numSeatsOld
      elseif numSeatsOld and numSeatsOld > 0 then
        factor = numSeatsOld / numSeats
      end
      if numSeatsOld and numSeatsOld > 0 then
        thisVehicle.compartments = { { { { capacity = numSeats * 4, type = "PASSENGERS", } } } }
      end
    elseif thisVehicle.capacities then
      if thisVehicle.capacities[1] then
        if thisVehicle.capacities[1][1] then
          if thisVehicle.capacities[1][1].capacity then
            if thisVehicle.capacities[1][1].type == "PASSENGERS" then
              numSeatsOld = thisVehicle.capacities[1][1].capacity
            end
          end
        elseif thisVehicle.capacities[1].capacity then
          if thisVehicle.capacities[1].type == "PASSENGERS" then
            numSeatsOld = thisVehicle.capacities[1].capacity
          end
        end
      elseif thisVehicle.capacities.capacity then
        if thisVehicle.capacities.type == "PASSENGERS" then
          numSeatsOld = thisVehicle.capacities.capacity
        end
      end
      if numSeats == 0 and numSeatsOld and numSeatsOld > 0 then
        factor = 0.25
        numSeats = numSeatsOld
      elseif numSeatsOld and numSeatsOld > 0 then
        factor = numSeatsOld / numSeats
      end
      if numSeatsOld and numSeatsOld > 0 then
        thisVehicle.capacities = { { capacity = numSeats * 4, type = "PASSENGERS", } }
      end
    elseif thisVehicle.compartmentsList then
      numSeatsOld = 0
      numComs = #thisVehicle.compartmentsList
      for i = 1, numComs do
        for j = 1, #thisVehicle.compartmentsList[i].loadConfigs do
          for k = 1, #thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries do
            if thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries[k].type == "PASSENGERS" then
              if thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries[k].capacity then
                numSeatsOld = numSeatsOld + thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries[k].capacity
              end
            end
          end
        end
      end --count original capacity
      if numSeats == 0 and numSeatsOld and numSeatsOld > 0 then
        --in case seats are not defined
        factor = 0.25
        numSeats = numSeatsOld
      elseif numSeatsOld and numSeatsOld > 0 then
        factor = numSeatsOld / numSeats
      end
      for i = 1, numComs do
        for j = 1, #thisVehicle.compartmentsList[i].loadConfigs do
          for k = 1, #thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries do
            if thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries[k].type == "PASSENGERS" then
              thisVehicle.compartmentsList[i].loadConfigs[j].cargoEntries[k].capacity = numSeats * 4 / numComs
            end
          end
        end
      end
    end

    if params ~= nil and params["adjusted_costs"] == 1 then
      --if data.metadata and data.metadata.mainenance and data.metadata.cost and factor then
      vehicle.metadata.cost.priceScale = factor
      vehicle.metadata.maintenance.runningCostScale = factor
      --end
    end
  end

  return vehicle
end

-- -------------------------------------------------------------------------- --

function cargo.tweakCargo()
  addModifier("loadCargoType", changeCargoWeights)
end

return cargo
