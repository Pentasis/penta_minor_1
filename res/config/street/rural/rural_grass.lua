function data()
  return {
    numLanes = 2,
    streetWidth = 6.0,
    sidewalkWidth = 0.6,
    sidewalkHeight = .0,
    yearFrom = 0,
    yearTo = 0,
    aiLock = true,
    country = true,
    speed = 30.0,
    type = "country old",
    name = _("Rural grass"),
    desc = _("Grass road 30 km/h."),
    categories = { "rural_road" },
    materials = {
      streetPaving = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      }
    },
    borderGroundTex = "none.lua",
    sidewalkFillGroundTex = "",
    cost = 10.0,
  }
end
