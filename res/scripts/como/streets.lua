local streets = {}

local function has_value(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end

  return false
end

-- ------------------------------------------------------------------ --

local function assignNewSlopes(street)
  -- Vanilla values are 20% (.2) for SlopeBuild & 0.75 for Embankment
  street.maxSlopeBuild = 0.15
  street.maxSlope = street.maxSlopeBuild * 1.4
  street.maxSlopeShape = street.maxSlope * 1.2
  street.embankmentSlopeLow = 0.5
  street.embankmentSlopeHigh = street.embankmentSlopeLow * 3

  return street
end

-- ------------------------------------------------------------------ --

local function adjustStreetSlope(filename, street)
  -- The vanilla streets do not define slope in config, so we assume modded ones do it themselves (hence we test on nil).
  -- TODO: clean this mess up, but combining conditional throws "not a table" error.

  if street.transportModesStreet ~= nil then
    if not has_value(street.transportModesStreet, "AIRCRAFT") and not has_value(street.transportModesStreet, "SHIP") then
      if street.maxSlopeBuild == nil then
        street = assignNewSlopes(street)
      end
    end
  elseif street.maxSlopeBuild == nil then
    street = assignNewSlopes(street)
  end

  return street
end

-- ================================================================== --

function streets.tweakStreets()
  addModifier("loadStreet", adjustStreetSlope)
end

return streets
