function data()
return {
	numLanes = 2,
	streetWidth = 10.0,
	sidewalkWidth = 4.0,
	sidewalkHeight = .00,
	yearFrom = 1925,
	yearTo = 0,
	upgrade = true,
	country = true,
	speed = 30.0,
	type = "new small",
	name = _("Small street"),
	desc = _("Two-lane street with a speed limit of %2%."),
	categories = { "urban" },
	borderGroundTex = "street_border.lua",
	materials = {
		streetPaving = {
			name = "street/new_medium_paving.mtl",
			size = { 6.0, 6.0 }
		},		
		--streetBorder = {
			--name = "street/new_small_border.mtl",
			--size = { 1.5, 0.625 }
		
		--},			
		streetLane = {
			name = "street/new_medium_lane.mtl",
			size = { 4.0, 4.0 }
		},
		streetStripe = {

		},
		streetStripeMedian = {

		},
		streetBus = {
			name = "street/new_medium_bus.mtl",
			size = { 12, 2.7 }
		},
		streetTram = {
			name = "street/new_medium_tram_paving.mtl",
			size = { 2.0, 2.0 }
		},
		streetTramTrack = {
			name = "street/new_medium_tram_track.mtl",
			size = { 2.0, 2.0 }
		},
		crossingLane = {
			name = "street/new_medium_lane.mtl",
			size = { 4.0, 4.0 }
		},
		crossingBus = {
			name = ""		
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
			name = ""		
		},
		sidewalkPaving = {
			name = "street/new_medium_paving.mtl",
			size = { 6.0, 6.0 }
		},
		sidewalkLane = {	

		},
		sidewalkBorderOuter = {
			name = "street/new_small_sidewalk_border_outer.mtl",		
			size = { 16.0, 0.3 }
		},
		sidewalkCurb = {
			name = "street/new_medium_sidewalk_curb.mtl",
			size = { 3, .3 }
		},
		sidewalkWall = {
			name = "street/new_medium_sidewalk_wall.mtl",
			size = { .3, .3 }
		},
		catenary = {
			name = "street/tram_cable.mtl"
		}
	},
	assets = {
		{
			name = "street/street_light_eu_c.mdl",
			offset = 8.0,
			distance = 16.0,
			prob = 1.0,
			offsetOrth = 3.0,
			randRot = false,
			oneSideOnly = true,
			alignToElevation = false,
			avoidFaceEdges = false,
			placeOnBridge = true,
		}, 
		{
			name = "street/street_asset_mix/fireplug_eu_c.mdl",
			offset = 10.0,
			distance = 40.0,
			prob = 0.5,
			offsetOrth = 0.35,
			randRot = false,
			oneSideOnly = false,
			alignToElevation = true,
			avoidFaceEdges = false,
		}, 
		{
			name = "street/street_asset_mix/trash_standing_c.mdl",
			offset = 20,
			distance = 50.0,
			prob = 0.5,
			offsetOrth = 0.6,
			randRot = false,
			oneSideOnly = false,
			alignToElevation = true,
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
	cost = 20.0,
}
end