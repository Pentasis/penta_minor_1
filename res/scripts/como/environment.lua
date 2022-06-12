local environment = {}

local function changeRenderDistance()
    game.config.settings.geometryQualityOptions = {
        { viewNearFar = { 4.0, 5000.0 }, fogStartEndFarPerc = { .45, 1.0 }, lodDistanceScaling = .5 }, -- Low
        { viewNearFar = { 4.0, 10000.0 }, fogStartEndFarPerc = { .3, 1.0 }, lodDistanceScaling = .75 }, -- Medium
        { viewNearFar = { 4.0, 16000.0 }, fogStartEndFarPerc = { -0.4, 0.8 }, lodDistanceScaling = 1.0 }, -- High
        { viewNearFar = { 4.0, 15000.0 }, fogStartEndFarPerc = { .125, 1.0 }, lodDistanceScaling = 10 }, -- Camera tool
        { viewNearFar = { 0.5, 5000.0 }, fogStartEndFarPerc = { 1.0, 1.0 }, lodDistanceScaling = 1.0 }, -- Cockpit view
    }
end

-- ================================================================== --

function environment.tweakEnvironment()
    changeRenderDistance()
end

return environment
