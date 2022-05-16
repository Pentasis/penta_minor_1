function data()
return {
	numLanes = 2,
	streetWidth = 0.1,
	sidewalkWidth = 1.5,
	sidewalkHeight = .00,
	yearFrom = 1925,
	yearTo = 0,
	upgrade = false,
	country = true,
	speed = 0.1,
	type = "footpath asphalt",
	name = _("asphalt 3m"),
	desc = _("pedestrian footpath 3m wide"),
	categories = { "footpath no buildings" },
	borderGroundTex = "street_border.lua",
	materials = {
		streetPaving = {
			name = "street/footpath_asphalt_03.mtl",
			size = { 33.0, 33.0 }
		},		
		--streetBorder = {
			--name = "street/new_small_border.mtl",
			--size = { 1.5, 0.625 }
		
		--},			
		streetLane = {
			
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
			name = "street/footpath_asphalt_03.mtl",
			size = { 33.0, 33.0 }
		},
		sidewalkLane = {	

		},
		sidewalkBorderOuter = {
			name = "street/new_medium_sidewalk_border_outer.mtl",		
			size = { 8.0, 0.41602 }
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
	cost = 25.0,
}
end
