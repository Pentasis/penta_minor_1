local SETTINGS_WINDOWS = {
  "menu.modules.settingsWindow",
  "menu.construction.air.settingsWindow",
  "menu.construction.town.settingsWindow",
  "menu.construction.road.settingsWindow",
  "menu.construction.rail.settingsWindow",
  "menu.construction.water.settingsWindow",
  "menu.construction.terrain.settingsWindow",
  "menu.construction.industry.settingsWindow",
}

-- TODO: aren't these globals defined by the game itself? How to access?
local INFO_WINDOWS = {
  TOWN = 46,
  LINE = 65,
  SIM_PERSON = 28,
  SIM_BUILDING = 27,
  TOWN_BUILDING = 49,
  STATION_GROUP = 60,
  TRANSPORT_VEHICLE = 70,
}

local function resizableInfoWindows(gui_id, event_name)
  if event_name == "idAdded" and gui_id:match("temp.view.entity_%d") then
    local s = gui_id:gsub("temp.view.entity_", "")
    local ui_entity = tonumber(s)
    if ui_entity then
      for _, component_type in pairs(INFO_WINDOWS) do
        if api.engine.getComponent(ui_entity, component_type) then
          local window = api.gui.util.downcast(api.gui.util.getById(gui_id))
          if window then
            window:setResizable(true)
          end
        end
      end
    end
  end
end

local function resizableSettingsWindows()
  for _, gui_id in pairs(SETTINGS_WINDOWS) do
    local window = api.gui.util.getById(gui_id)
    if window then
      window:setResizable(true)
    end
  end
end

-- ================================================================== --

function data()
  return {
    guiInit = function()
      resizableSettingsWindows()
    end,
    guiHandleEvent = function(id, name, param)
      resizableInfoWindows(id, name)
    end
  }
end
