function data()
    local t = {}

    t.name = _("Weathered tracks 25 km/h")
    t.desc = _("Weathered wooden tracks limited to 25km/h.")
    t.categories = { "weathered_tracks" }

    t.yearFrom = 0
    t.yearTo = 0

    t.shapeWidth = 4.0
    t.shapeStep = 4.0
    t.shapeSleeperStep = 8.0 / 12.0

    t.ballastHeight = .3
    t.ballastCutOff = .1

    t.sleeperBase = t.ballastHeight
    t.sleeperLength = .26
    t.sleeperWidth = 2.6
    t.sleeperHeight = .08
    t.sleeperCutOff = .02

    t.railTrackWidth = 1.435
    t.railBase = t.sleeperBase + t.sleeperHeight
    t.railHeight = .15
    t.railWidth = .07
    t.railCutOff = .02

    t.embankmentSlopeLow = 0.75
    t.embankmentSlopeHigh = 2.5

    t.catenaryBase = 5.917 + t.railBase + t.railHeight
    t.catenaryHeight = 1.35
    t.catenaryPoleDistance = 32.0
    t.catenaryMaxPoleDistanceFactor = 2.0
    t.catenaryMinPoleDistanceFactor = 0.8

    t.trackDistance = 5.0

    t.speedLimit = 25.0 / 3.6
    t.speedCoeffs = { .85, 30.0, .6 } -- curve speed limit = a * (radius + b) ^ c

    t.minCurveRadius = 44.0
    t.minCurveRadiusBuild = 60.0

    t.maxSlopeBuild = 0.075
    t.maxSlope = t.maxSlopeBuild * 1.6
    t.maxSlopeShape = t.maxSlope * 1.25

    t.slopeBuildSteps = 2

    t.ballastMaterial = "track/old_track_ballast.mtl"
    t.sleeperMaterial = "track/old_track_sleeper.mtl"
    t.railMaterial = "track/old_track_rail.mtl"
    t.catenaryMaterial = "track/catenary.mtl"
    t.tunnelWallMaterial = "track/tunnel_rail_ug.mtl"
    t.tunnelHullMaterial = "track/tunnel_hull.mtl"

    t.catenaryPoleModel = "empty.mdl"
    t.catenaryMultiPoleModel = "empty.mdl"
    t.catenaryMultiGirderModel = "empty.mdl"
    t.catenaryMultiInnerPoleModel = "empty.mdl"

    t.bumperModel = "railroad/bumper.mdl"
    t.switchSignalModel = "railroad/switch_box.mdl"

    t.fillGroundTex = "tree_ground.lua"
    t.borderGroundTex = "ballast.lua"

    t.railModel = "railroad/tracks/old_track_single_rail.mdl"
    t.sleeperModel = "railroad/tracks/old_track_single_sleeper_base.mdl"
    t.trackStraightModel = {
        "railroad/tracks/old_track_2m_base.mdl",
        "railroad/tracks/old_track_4m_base.mdl",
        "railroad/tracks/old_track_8m_base.mdl",
        "railroad/tracks/old_track_16m_base.mdl",
    }

    t.cost = 15.0

    return t
end
