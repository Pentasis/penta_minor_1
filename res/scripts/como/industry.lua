local industry = {}

-- TODO: move this to a data-file?
local PRODUCTION_MULTIPLIER = 4

local function increaseProduction(capacity)
  return capacity * PRODUCTION_MULTIPLIER
end

local function addWorkers(capacity)
  return {
    type = "INDUSTRIAL",
    capacity = math.floor((capacity / PRODUCTION_MULTIPLIER) + 0.5),  -- round
  }
end

-- TODO: not proud of this code, revisit later
local function changeIndustry(filename, factory)

  if filename == "res/construction/industry/goods_factory.con" then
    factory.placementParams.tags = { "INPUT_PLASTIC", "INPUT_PLANKS", }
    factory.placementParams.distanceWeights = { INPUT_GOODS = 1, INPUT_PLASTIC = -1, INPUT_PLANKS = -1, }
  end

  if filename == "res/construction/industry/tools_factory.con" then
    factory.placementParams.tags = { "INPUT_STEEL" }
    factory.placementParams.distanceWeights = { INPUT_TOOLS = 1, INPUT_STEEL = -2 }
  end

  if factory.type == "INDUSTRY" then
    local originalUpdateFn = factory.updateFn

    factory.updateFn = function(params)
      local result = originalUpdateFn(params)  --execute original function and get result

      if result.rule ~= nil then
        result.rule.capacity = increaseProduction(result.rule.capacity)
        if not result.personCapacity then
          result.personCapacity = addWorkers(result.rule.capacity)
        end

        if filename == "res/construction/industry/goods_factory.con" then
          result.stocks[1].cargoType = "PLASTIC"
          result.stocks[2].cargoType = "PLANKS"
        end

        if filename == "res/construction/industry/tools_factory.con" then
          result.stocks[1].cargoType = "STEEL"
        end
      end

      return result
    end
  end

  return factory
end

-- ================================================================== --

function industry.tweakIndustry()
  addModifier("loadConstruction", changeIndustry)
end

return industry
