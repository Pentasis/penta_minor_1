local cargos = {}

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
            if numSeats == 0 and numSeatsOld and numSeatsOld > 0 then --in case seats are not defined
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

-- ---------------------------------------------------------------------

function cargos.initCargoChanges()
    game.config.trainBrakeDeceleration    = 1
    game.config.chargeMaintenanceInterval = 180
    addModifier("loadModel", makeAllTrainsReverse)
    addModifier("loadCargoType", changeCargoWeights)
    addModifier("loadModel", changeCapacity)
end

return cargos
