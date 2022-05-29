local industry = {}

local factorWorkers = 4
local factorProduction = 4

local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

local function changeIndustry(filename, factory)
    local originalUpdateFn = factory.updateFn

    if filename == "res/construction/industry/goods_factory.con" then
        factory.placementParams.tags = { "INPUT_PLASTIC", "INPUT_PLANKS", }
        factory.placementParams.distanceWeights = { INPUT_GOODS = 1, INPUT_PLASTIC = -1, INPUT_PLANKS = -1, }
    end

    if filename == "res/construction/industry/tools_factory.con" then
        factory.placementParams.tags = { "INPUT_STEEL" }
        factory.placementParams.distanceWeights = { INPUT_TOOLS = 1, INPUT_STEEL = -2 }
    end

    if factory.type == "INDUSTRY" then
        factory.updateFn = function(params)
            --execute original function and get result
            local result = originalUpdateFn(params)
            if result.rule ~= nil then
                -- increase production
                result.rule.capacity = result.rule.capacity * factorProduction
                -- add workers
                if not result.personCapacity then
                    result.personCapacity = {
                        type = "INDUSTRIAL",
                        capacity = math.ceil(result.rule.capacity / factorWorkers),
                    }
                end

                -- change inputs for goods & tools
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

function industry.initIndustry()
    addModifier("loadConstruction", changeIndustry)
end

return industry
