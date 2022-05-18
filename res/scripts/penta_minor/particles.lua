local helper = require "penta_minor/helpers"
local shader = require "penta_minor/shader"

local particles = {}

---------------------------------------------------------------------------------------------------
local function positionsDataBase()
	data = {} -- x z y
	data[ "ALCO HH 600" ] = { { 3.45, 0, 4.78 } }
	data[ "NoHAB AA16" ] = { { -4.18, 0, 4.50 }, { -4.87, 0, 4.50 } }
	data[ "Class V 100" ] = { { 0.45, 0, 4.35 } }
	data[ "Class 246" ] = { { 0, -0.25, 4.50 }, { 0, 0.25, 4.50 } }
	return data
end
---------------------------------------------------------------------------------------------------
local function getParticleEmitter()
	local emitter
		=	{
				child = 1
			,	color = { 1.0, 1.0, 1.0, }
			,	frequency = 1
			,	lifeTime = 1
			,	position = { 0, 0, 0, }
			,	size01 = { 0.0, 1.0, }
			,	velocity = { 0, 0, 0, }
		}
	return emitter
end
---------------------------------------------------------------------------------------------------
local function getParticleSystem()
	local particleSystem = {}
	particleSystem.emitters = {}
	return particleSystem
end
---------------------------------------------------------------------------------------------------
local function recreateParticleSystem( _name )
	local system = getParticleSystem()

	local positions = positionsDataBase()[ _name ]

	if positions == nil then
		return nil
	end

	local systems = 0

	for index, value in ipairs( positions ) do
		system.emitters[ index ] = getParticleEmitter()
		system.emitters[ index ].position = value
	end

	return system
end

local function adjustSteamParticles(filename, steamLocoModel)

    if steamLocoModel.metadata.particleSystem == nil then
        return steamLocoModel
    end

    if steamLocoModel.metadata.particleSystem.emitters == nil then
        return steamLocoModel
    end

    -- assume systems above the height of 3.3 and lifetime above 7 are major stacks
    local heightOfMajorStack = 3.30
    local lifetimeOfMajorStack = 7

    -- assume systems below height 2 are cylinder leakage
    local heightOfCylinderLeakage = 2

    local maximumSensiblePowerOfAnEngine = 20000;

    local power = math.min(
        steamLocoModel.metadata.railVehicle.engines[1].power
        , maximumSensiblePowerOfAnEngine
    );

    local majorSteamSources = 0

    local majorPositions = {}

    for index, emitter in ipairs(steamLocoModel.metadata.particleSystem.emitters) do
        if emitter.position[3] > heightOfMajorStack and emitter.lifeTime > lifetimeOfMajorStack then
            majorSteamSources = majorSteamSources + 1
            majorPositions[majorSteamSources] = emitter.position
        end
    end

    for index, emitter in ipairs(steamLocoModel.metadata.particleSystem.emitters) do
        if emitter.position[3] > heightOfMajorStack and emitter.lifeTime < lifetimeOfMajorStack then
            for index, position in ipairs(majorPositions) do
                if helper.aroundStack(position, emitter.position) then
                    majorSteamSources = majorSteamSources + 1
                    emitter.lifeTime = 10
                end
            end
        end
    end

    if majorSteamSources == 0 then
        return steamLocoModel
    end

    power = power / majorSteamSources
    power = helper.powerLimit(power)

    for index, emitter in ipairs(steamLocoModel.metadata.particleSystem.emitters) do
        if emitter.position[3] > heightOfMajorStack and emitter.lifeTime > lifetimeOfMajorStack then

            emitter.lifeTime = 5 + (power / 450)
            emitter.frequency = (25 * ((power + 6000) / 7000))
            emitter.color = { .65, 0, 0 }
            emitter.velocity = { .0, .0, 2 + (power + 350) / 350 }
            emitter.velocityDampingFactor = 1.75
            emitter.initialAlpha = 1.05

            emitter.size01 = shader.mainStackSteamShaderParameters(
                0.65 + power / 6500
                , 5 + power / 500
            )

        elseif emitter.position[3] < heightOfCylinderLeakage then
            emitter.frequency = 3 + power / 1200
            emitter.lifeTime = 1 + power / 2000
            emitter.color = { .7, 0, 0 }
            emitter.size01 = { .4, 1.5 + power / 1600 }
        end
    end

    return steamLocoModel
end

function adjustDieselParticles(filename, dieselLocoModel)

    if dieselLocoModel.metadata.particleSystem == nil
        or dieselLocoModel.metadata.particleSystem.emitters == nil
    then
        return dieselLocoModel
    end

    local power = dieselLocoModel.metadata.railVehicle.engines[1].power
    local powerFactor = power / 1000.0

    local designMagnitudeBase = 5
    local designYearFactor = 7.5
    local designYearStart = 1965
    local designYearEnd = 2015
    local designPeriod = designYearEnd - designYearStart

    if dieselLocoModel.metadata.availability.yearFrom ~= nil then
        local designYear = dieselLocoModel.metadata.availability.yearFrom;

        designYearFactor = designMagnitudeBase
            + (designYearEnd - (math.max(designYear, designYearStart))) / designPeriod
            * designMagnitudeBase;
    end

    local fumeCount = 0

    for index, emitter in ipairs(dieselLocoModel.metadata.particleSystem.emitters) do
        fumeCount = fumeCount + 1
    end

    local isAlcoDiesel = false
    local alco = "no"

    if dieselLocoModel.metadata.description ~= nil
        and dieselLocoModel.metadata.description.name ~= nil
    then
        local nameLowered = string.lower(dieselLocoModel.metadata.description.name)
        isAlcoDiesel = string.match(nameLowered, "alco") ~= nil

        if isAlcoDiesel then alco = "yes" end
    end

    local addedFume = false

    if fumeCount == 1 then
        table.insert(
            dieselLocoModel.metadata.particleSystem.emitters
            , helper.deepcopy(dieselLocoModel.metadata.particleSystem.emitters[1])
        )
        fumeCount = 2
        addedFume = true
    end

    powerFactor = powerFactor / fumeCount
    local fumeCountedDesignFactor = designYearFactor / fumeCount

    for index, emitter in ipairs(dieselLocoModel.metadata.particleSystem.emitters) do

        emitter.velocityDampingFactor = 3.2 - powerFactor

        emitter.lifeTime = 1 + (designYearFactor) / 5 * helper.randomNR()
        emitter.frequency = 40 + ((fumeCountedDesignFactor * 6 + powerFactor * 12)) * helper.randomNR()

        if (isAlcoDiesel) then
            emitter.lifeTime = emitter.lifeTime * 2
            emitter.frequency = emitter.frequency * 2
        end

        emitter.color = { .22, 0, 0 }

        local particleMin = 0.25 + 0.3 * powerFactor * helper.randomNR()
        local particleMax = 0.25 + 4.25 * powerFactor * helper.randomNR()

        if (designYearFactor > 8.5) then
            emitter.size01 = shader.oldDieselShaderParameters(particleMin, particleMax)
            emitter.velocity = { .0, .0, 1 + 4 * powerFactor }
            emitter.initialAlpha = 0.7
        else
            emitter.size01 = shader.newDieselShaderParameters(particleMin, particleMax)
            emitter.velocity = { .0, .0, 1 + 3 * powerFactor }
            emitter.initialAlpha = 0.55
        end

        if addedFume and index == 1 then
            emitter.velocity[2] = -0.5
            emitter.position[2] = emitter.position[2] - 0.025
        elseif addedFume and index == 2 then
            emitter.velocity[2] = 0.5
            emitter.position[2] = emitter.position[2] + 0.025
        end

    end

    return dieselLocoModel
end

local function adjustRailVehicleParticles(filename, locoModel)

    if not (locoModel.metadata == nil
        or locoModel.metadata.railVehicle == nil
        or locoModel.metadata.railVehicle.engines == nil
        or locoModel.metadata.railVehicle.engines[1] == nil)
    then
        if locoModel.metadata.railVehicle.engines[1].type == "STEAM" then
            return adjustSteamParticles(filename, locoModel)
        elseif locoModel.metadata.railVehicle.engines[1].type == "DIESEL" then
            return adjustDieselParticles(filename, locoModel)
        end
    end

    return locoModel
end

local function adjustBuildingParticles(filename, buildingModel)

    if string.match(filename, "industry/oil_refinery/era_a/oil_refinery_unit_lvl1.mdl") then
        buildingModel.metadata.particleSystem = {
            emitters = {
                {
                    position = { -9.00, -2, 18.2 }
                    , velocity = { 1, 1, 6 }
                    , color = { 0.0, 0, 0 }
                    , frequency = 25
                    , lifeTime = 4.0
                    , size01 = shader.fireEffectShaderParameters(4.5, 0.25)
                    , child = 0,
                },
            }
        }
    elseif string.match(filename, "industry/oil_refinery/era_a/oil_refinery_unit_lvl2.mdl") then
        buildingModel.metadata.particleSystem = {
            emitters = {
                {
                    position = { -8.95, 0, 31.68 }
                    , velocity = { 1, 1, 6 }
                    , color = { 0.0, 0, 0 }
                    , frequency = 25
                    , lifeTime = 6.0
                    , size01 = shader.fireEffectShaderParameters(5.5, 0.25)
                    , child = 0,
                },
            }
        }
    end

    return buildingModel
end

local function adjustShipParticles(filename, shipModel)

    if shipModel.metadata == nil
        or shipModel.metadata.waterVehicle == nil
        or shipModel.metadata.waterVehicle.availPower == nil
    then
        return shipModel
    end

    if shipModel.metadata.particleSystem == nil
        or shipModel.metadata.particleSystem.emitters == nil
    then
        return shipModel
    end

    if shipModel.metadata.availability.yearFrom ~= nil
        and shipModel.metadata.availability.yearFrom > 1930
    then
        return shipModel
    end

    local power = shipModel.metadata.waterVehicle.availPower / 1000
    power = math.min(20000, power)

    local majorSteamSources = 0

    for index, emitter in ipairs(shipModel.metadata.particleSystem.emitters) do
        majorSteamSources = majorSteamSources + 1
    end

    power = power / majorSteamSources
    power = helper.powerLimit(power)

    for index, emitter in ipairs(shipModel.metadata.particleSystem.emitters) do
        emitter.lifeTime = 5 + (power / 450)
        emitter.frequency = (25 * ((power + 6000) / 7000))
        emitter.color = { .65, 0, 0 }
        emitter.velocity = { .0, .0, 2 + (power + 350) / 350 }
        emitter.velocityDampingFactor = 1.75
        emitter.initialAlpha = 1.05

        emitter.size01 = shader.mainStackSteamShaderParameters(
            0.65 + power / 6500
            , 5 + power / 500
        )
    end

    return shipModel

end

-- ---------------------------------------------------------------------

function particles.adjustPArticles()
    addModifier("loadModel", adjustRailVehicleParticles)
    addModifier("loadModel", adjustBuildingParticles)
    addModifier("loadModel", adjustShipParticles)
end

return particles
