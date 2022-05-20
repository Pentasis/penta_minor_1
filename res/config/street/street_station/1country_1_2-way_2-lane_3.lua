function data()
return {
	numLanes = 2,
	streetWidth = 10.0,
	sidewalkWidth = 4.0,
	sidewalkHeight = .0,
	yearFrom = 1925,
	yearTo = 0,
	upgrade = true,
	country = true,
	speed = 30.0,
	type = "country1 2-way",
	name = _("2-way 2-lane / type 3"),
	desc = _("country 2-way road %2%."),
	categories = { "country1 2-way" },
	materials = {
		streetPaving = {
			name = "street/country_new_medium_paving.mtl",
			size = { 8.0, 8.0 }
		},		
		streetBorder = {			
			name = "street/country_new_small_street_border.mtl",		
			size = { 9.0, 0.56 }		
		},			
		streetLane = {
			name = "street/new_medium_lane.mtl",
			size = { 2.5, 2.5 }
		},
		streetStripe = {

		},
		streetStripeMedian = {
			name = "street/country_new_large_border.mtl",
			size = { 24, 0.459 }		
		},
		streetArrow = {
			name = "street/default_arrows.mtl",
			size = { 9.0, 3.0 }
		},
		streetBus = {
		
		},
		streetTram = {
			name = "street/new_medium_tram_paving.mtl",
			size = { 2.0, 2.0 }
		},
		streetTramTrack = {
			name = "street/new_medium_tram_track.mtl",
			size = { 2.0, 2.0 }
		},
		junctionBorder = {
			name = "street/country_new_small_street_border.mtl",		
			size = { 9.0, 0.56 }
		},
		crossingLane = {
			name = "street/new_medium_lane.mtl",
			size = { 2.5, 2.5 }
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
			name = ""		
		},
		sidewalkLane = {	
		},
		sidewalkBorderInner = {
		},
		sidewalkBorderOuter = {
		},
		sidewalkCurb = {
		},
		sidewalkWall = {
		}	
	},
	borderGroundTex = "street_border.lua",
	sidewalkFillGroundTex = "country_sidewalk.lua",
	cost = 40.0,
}
end
