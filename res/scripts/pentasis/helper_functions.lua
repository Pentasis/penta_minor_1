local helper_functions = {}


local function printTable(table, indent)
  if not indent then indent = 0 end
  for key, value in pairs(table) do
    if type(key) ~= "number" then
      key = "'" .. key .. "'"
    end
    local formatting = string.rep("  ", indent) .. "[" .. key .. "] = "
    if type(value) == "table" then
      print(formatting)
      printTable(value, indent+1)
    else
      print(formatting .. tostring(value) .. "\n")
    end
  end
end

-- ================================================================== --

function helper_functions.getFileName(uri)
  return uri:match("^.+/(.+)$")
end

-- ------------------------------------------------------------------ --

function helper_functions.dump(subject)
  if type(subject) ~= "table" then
    print(subject)
  else
    printTable(subject, 0)
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
