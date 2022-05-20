local modTracks      = require "penta_minor/tracks"
local modVehicles    = require "penta_minor/cargo_vehicles"
local modRoads       = require "penta_minor/streets"
local modTowns       = require "penta_minor/towns"
local modCims        = require "penta_minor/cims"
local modTweaks      = require "penta_minor/tweaks"
local modEnvironment = require "penta_minor/environment"
local modGui         = require "penta_minor/gui"
-- ---------------------------------------------------------------------

function data()
    return {
        info    = {
            name           = "Consolidated Mods",
            description    = "My personal collection of changes and additions.",
            authors        = {
                {
                    name = "Pentasis",
                    role = 'CREATOR',
                },
            },
            minorVersion   = 7,
            severityAdd    = "WARNING",
            severityRemove = "CRITICAL",
            params         = {}
        },
        options = {},
        runFn   = function(settings, modParams)
            --math.randomseed(os.time())

            modTracks.initTrackChanges()
            modVehicles.initCargoChanges()
            modRoads.initStreetChanges()
            modTowns.initTownChanges()
            modCims.changeBehaviour()
            modTweaks.initTweaks()
            modEnvironment.initEnvironmentChanges()
            modGui.initGui()
        end
        -- postRunFn = function (settings, params) ...
    }
end
