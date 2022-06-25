local helper = require "pentasis/helper_functions"


local function addCheckboxToTownEditor(window, town_id)
  local window_content = window:getContent()
  local editor_tab = window_content:getTab(4) -- Should I test if exists first? If not: TODO: combine into one
  local tab_layout = editor_tab:getLayout()
  local town = api.engine.getComponent(town_id, api.type.ComponentType.TOWN)

  local development_checkbox = api.gui.comp.CheckBox.new("Town Develops", "ui/checkbox0.tga", "ui/checkbox1.tga")
  development_checkbox:setSelected(town.developmentActive, false)
  development_checkbox:onToggle(function(state)
    --game.interface.sendScriptEvent("toggle_development", "", { town_id = town_id, state = state })
    -- ffs; really?
    api.cmd.sendCommand(api.cmd.make.sendScriptEvent("como_town_development.lua", "toggle_development", "", { town_id = town_id, state = state }))
  end)

  tab_layout:addItem(development_checkbox)
end


local function getTownId(id, name)
  if name == "idAdded" and id:match("temp.view.entity_%d") then
    local town_id = id:gsub("temp.view.entity_", "")
    town_id = tonumber(town_id)
    if town_id then
      if api.engine.getComponent(town_id, api.type.ComponentType.TOWN) then
        return town_id
      end
    end
  end

  return false
end

-- ================================================================== --

function data()
  return {
    guiHandleEvent = function(id, name, param)
      local town_id = getTownId(id, name)
      if town_id then
        addCheckboxToTownEditor(api.gui.util.getById(id), town_id)
      end
    end,
    handleEvent = function(src, id, name, param)
      if id == "toggle_development" then
        game.interface.setTownDevelopmentActive(param.town_id, param.state)
      end
    end
  }
end
