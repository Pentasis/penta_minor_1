local cargo = {}

local cargo_data = require "como/data/cargo_data"

-- ---------------------------------------------------------------------

local function changeCargoWeights(filename, cargo_type)
  if cargo_data.CARGO_WEIGHTS[cargo_type.id] ~= nil then
    cargo_type.weight = cargo_data.CARGO_WEIGHTS[cargo_type.id]
  end

  return cargo_type
end

-- -------------------------------------------------------------------------- --

local function increaseStorageCapacity(filename, warehouse)
  if warehouse.metadata then
    if warehouse.metadata.moreCapacity then
      warehouse.metadata.moreCapacity.cargo = warehouse.metadata.moreCapacity.cargo * 4
      warehouse.metadata.moreCapacity.passenger = warehouse.metadata.moreCapacity.passenger * 4
    end
  end

  return warehouse
end

-- ------------------------------------------------------------------ --

function cargo.tweakCargo()
  addModifier("loadCargoType", changeCargoWeights)
  addModifier("loadModule", increaseStorageCapacity)
end

return cargo
