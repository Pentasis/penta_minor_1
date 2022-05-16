function data()
return {
	numLanes = 2,
	streetWidth = 6.0,
	sidewalkWidth = 1.0,
	sidewalkHeight = .00,
	yearFrom = 1925,
	yearTo = 0,
	upgrade = false,
	country = false,
	speed = 70.0,
	type = "new small",
	name = _("Very small green track"),
	desc = _("Two-lane priority green track with a speed limit of %2% - enable bus and tram track"),
	categories = { "tram" },
	borderGroundTex = "none.lua",
    sidewalkFillGroundTex = "none.lua",
	materials = {
		streetPaving = {
			name = "street/gras.mtl",
			size = { 6.0, 6.0 }
		},		
		--streetBorder = {
			--name = "street/new_small_border.mtl",
			--size = { 1.5, 0.625 }
		
		--},			
		streetLane = {
			name = "street/gras.mtl",
			size = { 4.0, 4.0 }
		},
		streetStripe = {

		},
		streetStripeMedian = {

		},
		streetBus = {
			
		},
		streetTram = {
			name = "street/gras.mtl",
			size = { 2.0, 2.0 }
		},
		streetTramTrack = {
			name = "street/new_medium_tram_track.mtl",
			size = { 2.0, 2.0 }
		},
		crossingLane = {
			name = "street/gras.mtl",
			size = { 4.0, 4.0 }
		},
		crossingBus = {
			name = ""		
		},
		crossingTram = {
			name = "street/gras.mtl",
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
			name = "street/gras.mtl",
			size = { 6.0, 6.0 }
		},
		sidewalkLane = {	

		},
		sidewalkBorderOuter = {
			
		},
		sidewalkCurb = {
			
		},
		sidewalkWall = {
			
		},
		catenary = {
			name = "street/tram_cable.mtl"
		}
		
	},
	
	cost = 15.0,
}
end
