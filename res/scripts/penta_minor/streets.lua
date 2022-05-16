local helper  = require "penta_minor/helpers"

local streets = {}

local function doChanges(street)
    -- Vanilla values are 20% (.2) for SlopeBuild & 0.75 for Embankment
    street.maxSlopeBuild       = 0.15
    street.maxSlope            = street.maxSlopeBuild * 1.4
    street.maxSlopeShape       = street.maxSlope * 1.2
    street.embankmentSlopeLow  = 0.5
    street.embankmentSlopeHigh = street.embankmentSlopeLow * 3

    return street
end

local function changeStreetSlope(filename, street)
    -- The vanilla streets do not define slope in config, so we assume modded ones do it themselves (hence we test on nil).
    -- TODO: clean this mess up, but combining conditional throws "not a table" error.

    if street.transportModesStreet ~= nil then
        if not helper.has_value(street.transportModesStreet, "AIRCRAFT") and not helper.has_value(street.transportModesStreet, "SHIP") then
            if street.maxSlopeBuild == nil then
                street = doChanges(street)
            end
        end
    elseif street.maxSlopeBuild == nil then
        street = doChanges(street)
    end

    return street
end
-- ---------------------------------------------------------------------

function streets.initStreetChanges()
    addModifier("loadStreet", changeStreetSlope)
end

return streets
