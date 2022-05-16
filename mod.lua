local modTracks      = require "penta_minor/tracks"
local modVehicles    = require "penta_minor/cargo_vehicles"
local modRoads       = require "penta_minor/streets"
local modTowns       = require "penta_minor/towns"
local modTweaks      = require "penta_minor/tweaks"
local modEnvironment = require "penta_minor/environment"
local modGui         = require "penta_minor/gui"

-- ---------------------------------------------------------------------

function data()
    return {
        info    = {
            name           = _("Penta Minor"),
            description    = _("A collection of changes and additions aimed at detailing/model gameplay."),
            authors        = {
                {
                    name = "Pentasis",
                    role = 'CREATOR',
                },
            },
            minorVersion   = 0,
            severityAdd    = "WARNING",
            severityRemove = "CRITICAL",
            params         = { }
        },
        options = {},
        runFn   = function(settings, modParams)
            modTracks.initTrackChanges()
            modVehicles.initCargoChanges()
            modRoads.initStreetChanges()
            modTowns.initTownChanges()
            modTweaks.initTweaks()
            modEnvironment.initEnvironmentChanges()
            modGui.initGui()
        end
        -- postRunFn = function (settings, params) ...
    }
end
