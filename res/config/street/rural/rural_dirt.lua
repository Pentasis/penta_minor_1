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
    name = _("Rural dirt"),
    desc = _("Dirt road 30 km/h."),
    categories = { "rural_road" },
    materials = {
      streetPaving = {
        name = "street/old_country_dirt_01.mtl",
        size = { 60.0, 60.0 }
      }
    },
    borderGroundTex = "none.lua",
    sidewalkFillGroundTex = "",
    cost = 10.0,
  }
end
