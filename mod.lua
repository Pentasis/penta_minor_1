-- namespace = como

local modTracks = require "como/tracks"
local modCargo = require "como/cargo"
local modPassengers = require "como/cargo"
local modVehicles = require "como/cargo"
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

      }
    },
    options = {},
    runFn = function(settings, modParams)
      --math.randomseed(os.time())
      --local params = modParams[getCurrentModId()]

      modTracks.tweakTracks()
      modCargo.tweakCargo()
      modPassengers.tweakPassengerSeats()
      modVehicles.tweakVehicles()
      modIndustry.tweakIndustry()
      modRoads.tweakStreets()
      modTowns.tweakTowns()
      modCims.tweakBehaviour()
      modEnvironment.tweakEnvironment()
      modGui.tweakGUI()
      modTweaks.tweakGeneral()
    end
    -- postRunFn = function (settings, params) ...
  }
end
