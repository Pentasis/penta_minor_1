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

local INFO_WINDOWS = {
  "TOWN",
  "LINE",
  "SIM_PERSON",
  "SIM_BUILDING",
  "TOWN_BUILDING",
  "STATION_GROUP",
  "TRANSPORT_VEHICLE",
}

-- ------------------------------------------------------------------ --

local function resizableInfoWindows(id, name)
  if name == "idAdded" and id:match("temp.view.entity_%d") then
    local entity_id = id:gsub("temp.view.entity_", "")
    entity_id = tonumber(entity_id)
    if entity_id then
      for _, component_type in pairs(INFO_WINDOWS) do
        if api.engine.getComponent(entity_id, api.type.ComponentType[component_type]) then
          local window = api.gui.util.downcast(api.gui.util.getById(id))
          if window then
            window:setResizable(true)
          end
        end
      end
    end
  end
end

local function resizableSettingsWindows()
  for _, id in pairs(SETTINGS_WINDOWS) do
    local window = api.gui.util.getById(id)
    if window then
      window:setResizable(true)
    end
  end
end

-- ================================================================== --

function data()
  return {
    guiInit = function()
      resizableSettingsWindows()  -- These are permanent windows, so can be initialized
    end,
    guiHandleEvent = function(id, name, param)
      resizableInfoWindows(id, name)  -- These are generated windows, so need to be handled when 'created'
    end
  }
end
