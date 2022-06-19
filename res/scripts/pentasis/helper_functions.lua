local helper_functions = {}

-- TODO: clean this up and use them instead of local functions
-- ------------------------------------------------------------------ --
local function tprint(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    else
      print(formatting .. tostring(v))
    end
  end
end

local function printTable(table)

  local string = '{ '
  for key, value in pairs(table) do
    if type(key) ~= 'number' then
      key = '"' .. key .. '"'
    end
    string = string .. '[' .. key .. '] = ' .. printTable(value) .. ',\n'
  end
  string = string .. '}'

  print(string)

end

function helper_functions.getFileName(uri)
  return uri:match("^.+/(.+)$")
end

-- ------------------------------------------------------------------ --

function helper_functions.dump(subject)
  if type(subject) == 'table' then
    printTable(subject)
  else
    print(subject)
  end
end

-- ------------------------------------------------------------------ --

function helper_functions.hasValue(table, value)
  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end

  return false
end

-- ------------------------------------------------------------------ --

return helper_functions
