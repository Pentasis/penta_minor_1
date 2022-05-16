function data()
return {
	numLanes = 2,
	streetWidth = 0.1,
	sidewalkWidth = 1.5,
	sidewalkHeight = .0,
	yearFrom = 0,
	yearTo = 0,
	upgrade = false,
	country = true,
	speed = 0.1,
	type = "footpath dirt",
	name = _("dirt 3m"),
	desc = _("pedestrian footpath 3m wide"),
	categories = { "footpath no buildings" },
	materials = {
		streetPaving = {
			
		},		
		streetBorder = {
			name = "",
			size = { 16.0, 2.0 }
		},			
		streetLane = {
			
		},
		streetStripe = {
			
		},
		streetStripeMedian = {
			name = "",
			size = { 16.0, 2.0 }
		},
		streetTram = {
			name = "street/old_medium_tram_paving.mtl",
			size = { 2.0, 2.0 }
		},
		streetTramTrack = {
			name = "street/old_medium_tram_track.mtl",
			size = { 2.0, 2.0 }
		},
		streetBus = {
			name = "",
		},
		crossingLane = {
			
		},
		crossingBus = {
			name = "",
		},
		crossingTram = {
			
		},
		crossingTramTrack = {
			
		},
		crossingCrosswalk = {
			name = "",		
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
		},

		sidewalkPaving = {
			name = "street/transparent.mtl",
			size = { 33.0, 33.0 }
		},

	},
	borderGroundTex = "street_border.lua",
	sidewalkFillGroundTex = "country_sidewalk.lua",
	cost = 10.0,
}
end
