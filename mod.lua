-- namespace = como

local modTracks = require "como/tracks"
local modCargo = require "como/cargo"
local modVehicles = require "como/vehicles"
local modIndustry = require "como/industry"
local modRoads = require "como/streets"
local modTowns = require "como/towns"
local modCims = require "como/cims"
local modEnvironment = require "como/environment"
local modGui = require "como/gui"
local modTweaks = require "como/general"

-- ------------------------------------------------------------------ --

function data()
  return {
    info = {
      name = "Consolidated Mods",
      description = "My personal collection of changes and additions.",
      authors = {
        {
          name = "Pentasis",
          role = 'CREATOR',
        },
      },
      minorVersion = 7,
      severityAdd = "WARNING",
      severityRemove = "CRITICAL",
      params = {
        {
          key = "como_maintenance",
          name = "Maintenance interval",
          uiType = "BUTTON",
          values = { "1 month", "2 months", "1 quarter", "half year", "1 year" },
          defaultIndex = 0,
        },
        {
          key = "como_grid",
          name = "Town Layout",
          uiType = "BUTTON",
          values = { "Grid", "Less Grid", "No Grid" },
          defaultIndex = 0,
        },
        {
          key = "como_towndevinterval",
          name = "Town Development interval",
          uiType = "BUTTON",
          values = { "1 week", "1 month", "2 months", "1 quarter", "half year", "1 year" },
          defaultIndex = 1,
        },
      },
    },
    options = {},
    runFn = function(settings, modParams)
      local params = modParams[getCurrentModId()]

      modTracks.tweakTracks()
      modCargo.tweakCargo()
      modVehicles.tweakVehicles(params.como_maintenance)
      modIndustry.tweakIndustry()
      modRoads.tweakStreets()
      modTowns.tweakTowns(params.como_grid, params.como_towndevinterval)
      modCims.tweakBehaviour()
      modEnvironment.tweakEnvironment()
      modGui.tweakGUI()
      modTweaks.tweakGeneral()
    end,
    postRunFn = function(settings, modParams)

    end
  }
end
