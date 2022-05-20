function data()
return {
	laneConfig = {
		{ forward = true },
		{ forward = true },
		{ forward = true },
	},
	streetWidth = 4.0,
	sidewalkWidth = 2.0,
	sidewalkHeight = .02,
	yearFrom = 1970,
	yearTo = 0,
	upgrade = true,
	country = true,
	speed = 30.0,
	type = "country2 1-way (highway)",
	name = _("1-way 1-lane"),
	desc = _("country 1-way road with roadside / (highway) / %2%."),
	categories = { "country2 1-way (highway)" },
	borderGroundTex = "street_border.lua",
	materials = {
		streetPaving = {
			name = "street/country_new_medium_paving.mtl",
			size = { 8.0, 8.0 }
		},		
		streetBorder = {
			name = "street/country_new_large_border.mtl",
			size = { 24, 0.459 }		
		},
		junctionBorder = {
			name = "street/country_new_large_border.mtl",
			size = { 24, 0.459 }		
		},				
		streetLane = {
			name = "street/country_new_medium_lane.mtl",
			size = { 3.0, 3.0 }
		},
		streetArrow = {
			name = "street/default_arrows.mtl",
			size = { 6.0, 3.0 }
		},
		streetStripe = {
	
		},
		streetStripeMedian = {
					
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
			name = "street/country_new_medium_lane.mtl",
			size = { 3.0, 3.0 }
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
			name = ""		
		},
		sidewalkPaving = {
			name = ""		
		},
		sidewalkLane = {	
		},
		sidewalkBorderInner = {
			name = "street/country_new_large_sidewalk_border_inner.mtl",		
			size = { 9, 3.6 }
		},
		sidewalkBorderOuter = {
		},
		sidewalkCurb = {
		},
		sidewalkWall = {
		}	
	},
	assets = {	
		
	},
	cost = 40.0,
	borderGroundTex = "street_border.lua",
	sidewalkFillGroundTex = "country_sidewalk.lua",
}
end
