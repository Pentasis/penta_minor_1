function data()
  return {
    numLanes = 2,
    streetWidth = 6.0,
    sidewalkWidth = 1.0,
    sidewalkHeight = .00,
    yearFrom = 1925,
    yearTo = 0,
    aiLock = true,
    country = true,
    speed = 60.0,
    type = "new small",
    name = _("Tram on grass"),
    desc = _("Tram tracks only on grass."),
    categories = { "tram_tracks" },
    borderGroundTex = "none.lua",
    sidewalkFillGroundTex = "none.lua",
    materials = {
      streetPaving = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      streetLane = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      streetTram = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      streetTramTrack = {
        name = "street/new_medium_tram_track.mtl",
        size = { 2.0, 2.0 }
      },
      crossingLane = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      crossingTram = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      crossingTramTrack = {
        name = "street/new_medium_tram_track.mtl",
        size = { 2.0, 2.0 }
      },
      crossingCrosswalk = {
        name = ""
      },
      sidewalkPaving = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      catenary = {
        name = "street/tram_cable.mtl"
      }
    },

    cost = 15.0,
  }
end
