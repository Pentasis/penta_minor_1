local cargos       = {}

-- Based on the assumption that 1 cargo unit = 1 m3 or 1 liter, some values are estimated
local cargoWeights = {
    COAL                   = 1400,
    CONSTRUCTION_MATERIALS = 1650,
    CRUDE                  = 881,
    FOOD                   = 200,
    FUEL                   = 750,
    GOODS                  = 4000,
    GRAIN                  = 790,
    IRON_ORE               = 7800,
    LOGS                   = 780,
    MACHINES               = 7500,
    OIL                    = 790,
    PASSENGERS             = 80,
    PLANKS                 = 750,
    PLASTIC                = 1000,
    STEEL                  = 7850,
    STONE                  = 1680,
    TOOLS                  = 1000
}

-- ---------------------------------------------------------------------

local function makeAllTrainsReverse(filename, train)
    if train.metadata.railVehicle then
        train.metadata.transportVehicle.reversible = true
    end

    return train
end

local function changeCargoWeights(filename, cargo)
    if cargoWeights[cargo.id] ~= nil then
        cargo.weight = cargoWeights[cargo.id]
    end

    return cargo
end

-- ---------------------------------------------------------------------

function cargos.initCargoChanges()
    game.config.trainBrakeDeceleration    = 1
    game.config.chargeMaintenanceInterval = 180
    addModifier("loadModel", makeAllTrainsReverse)
    addModifier("loadCargoType", changeCargoWeights)

end

return cargos
