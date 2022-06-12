local helper_functions = {}

-- TODO: clean this up and use them instead of local functions
-- ------------------------------------------------------------------ --

local function getFileName(uri)
  return uri:match("^.+/(.+)$")
end

-- ------------------------------------------------------------------ --

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

-- ------------------------------------------------------------------ --

local function hasValue(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end

  return false
end

-- ------------------------------------------------------------------ --

return helper_functions
