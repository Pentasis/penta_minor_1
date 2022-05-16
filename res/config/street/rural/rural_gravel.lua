function data()
return {
	numLanes = 2,
	streetWidth = 6.0,
	sidewalkWidth = 0.6,
	sidewalkHeight = .0,
	yearFrom = 0,
	yearTo = 0,
	upgrade = false,
	country = true,
	speed = 40.0,
	type = "country old",
	name = _("Kiesweg Einbahn 40 kmh "),
	desc = _("Eine Fahrbahnen 6.0 m Breit."),
	categories = { "mx" },
	materials = {
		streetPaving = {
			name = "street/country_kies_02.mtl",
			size = { 60.0, 60.0 }
		},		
		streetBorder = {
			name = "",
			
			
		},			
		streetLane = {
			
		},
		streetStripe = {
			
		},
		streetStripeMedian = {
					
		},
		streetTram = {
			
		},
		streetTramTrack = {
			
		},
		streetBus = {
			
		},
		crossingLane = {
			
		},
		crossingBus = {
			
		},
		crossingTram = {
			
		},
		crossingTramTrack = {
			
		},
		crossingCrosswalk = {
			
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
			
		}

	
                 
		},
	borderGroundTex = "none.lua",
	sidewalkFillGroundTex = "",
	cost = 10.0,
}
end
