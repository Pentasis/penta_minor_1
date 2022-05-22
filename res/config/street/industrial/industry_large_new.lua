function data()
    return {
        numLanes = 4,
        streetWidth = 16.0,
        sidewalkWidth = 4.0,
        sidewalkHeight = .00,
        yearFrom = 1925,
        yearTo = 0,
        aiLock = true,
        country = true,
        speed = 60.0,
        type = "industry new large",
        name = _("Large industry street"),
        desc = _("Four-lane industrial street with a speed limit of 60 km/h."),
        categories = { "industrial_road" },
        borderGroundTex = "street_border.lua",
        materials = {
            streetPaving = {
                name = "street/new_medium_paving.mtl",
                size = { 8.0, 8.0 }
            },
            streetBorder = {

            },
            streetLane = {
                name = "street/new_medium_lane.mtl",
                size = { 4.0, 4.0 }
            },
            streetArrow = {
                name = "street/default_arrows.mtl",
                size = { 9.0, 3.0 }
            },
            streetStripe = {

            },
            streetStripeMedian = {
                name = "street/new_large_median.mtl",
                size = { 4.0, 1 }
            },
            streetTram = {
                name = "street/new_medium_tram_paving.mtl",
                size = { 2.0, 2.0 }
            },
            streetTramTrack = {
                name = "street/new_medium_tram_track.mtl",
                size = { 2.0, 2.0 }
            },
            streetBus = {
                name = "street/new_medium_bus.mtl",
                size = { 12, 2.7 }
            },
            crossingLane = {
                name = "street/new_medium_lane.mtl",
                size = { 4.0, 4.0 }
            },
            crossingBus = {
                name = "",
            },
            crossingTram = {
                name = "street/new_medium_tram_paving.mtl",
                size = { 2.0, 2.0 }
            },
            crossingTramTrack = {
                name = "street/new_medium_tram_track.mtl",
                size = { 2.0, 2.0 }
            },
            crossingCrosswalk = {
                name = "street/new_medium_crosswalk.mtl",
                size = { 3.0, 2.5 }
            },
            sidewalkPaving = {
                name = "street/new_medium_sidewalk.mtl",
                size = { 4.0, 4.0 }
            },
            sidewalkLane = {

            },
            sidewalkBorderInner = {
                name = "street/new_medium_sidewalk_border_inner.mtl",
                size = { 3, 0.6 }
            },
            sidewalkBorderOuter = {
                name = "street/new_medium_sidewalk_border_outer.mtl",
                size = { 8.0, 0.41602 }
            },
            sidewalkCurb = {
                name = "street/new_medium_sidewalk_curb.mtl",
                size = { 3, .35 }
            },
            sidewalkWall = {
                name = "street/new_medium_sidewalk_wall.mtl",
                size = { 8.0, 0.41602 }
            },
            catenary = {
                name = "street/tram_cable.mtl"
            }
        },
        assets = {
            {
                name = "street/street_light_eu_c.mdl",
                offset = 8.0,
                distance = 30.0,
                prob = 1.0,
                offsetOrth = 3.4,
                randRot = false,
                oneSideOnly = false,
                alignToElevation = false,
                avoidFaceEdges = false,
                placeOnBridge = true,
            },
            {
                name = "street/street_asset_mix/fireplug_eu_c.mdl",
                offset = 10.0,
                distance = 50.0,
                prob = 0.5,
                offsetOrth = 0.5,
                randRot = false,
                oneSideOnly = false,
                alignToElevation = false,
                avoidFaceEdges = false,
            },
        },
        catenary = {
            pole = {
                name = "asset/tram_pole.mdl",
                assets = { "asset/tram_pole_light.mdl" }
            },
            poleCrossbar = {
                name = "asset/tram_pole_crossbar.mdl",
                assets = { "asset/tram_pole_light.mdl" }
            },
            poleDoubleCrossbar = {
                name = "asset/tram_pole_double_crossbar.mdl",
                assets = { "asset/tram_pole_light.mdl" }
            },
            isolatorStraight = "asset/cable_isolator.mdl",
            isolatorCurve = "asset/cable_isolator.mdl",
            junction = "asset/cable_junction.mdl"
        },
        signalAssetName = "asset/ampel.mdl",
        cost = 60.0,
    }
end
