local helpers = {}

function helpers.has_value(table, value)
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end

    return false
end

function helpers.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

---------------------------------------------------------------------------------------------------
function helpers.randomNR()
    return math.random() * 0.05 + 0.95
end

function helpers.aroundStack(_first, _second)

    retval = math.abs(_first[1] - _second[1])
        + math.abs(_first[2] - _second[2])
        + math.abs(_first[3] - _second[3]);

    return retval < 0.5
end

---------------------------------------------------------------------------------------------------
function helpers.powerLimit(_power)

    local Limit1 = 1600
    local Limit2 = 3200

    local aboveLimit2 = math.max(0, _power - Limit1)
    local aboveLimit1 = math.max(0, _power - aboveLimit2 - Limit1)
    local reminder = _power - aboveLimit1 - aboveLimit2

    return reminder + aboveLimit1 * 0.5 + aboveLimit2 * 0.25

end

return helpers
