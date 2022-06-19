function data()
  return {
    numLanes = 2,
    streetWidth = 0.1,
    sidewalkWidth = 1.5,
    sidewalkHeight = .00,
    yearFrom = 0,
    yearTo = 0,
    aiLock = true,
    country = true,
    speed = 0.1,
    type = "footpath dirt",
    name = _("Pedestrian dirt"),
    desc = _("Dirt footpath."),
    categories = { "pedestrian_road" },
    materials = {
      streetPaving = {
        name = "street/old_country_dirt_01.mtl",
        size = { 60.0, 60.0 }
      },
      sidewalkPaving = {
        name = "street/old_country_dirt_01.mtl",
        size = { 60.0, 60.0 }
      },
    },
    cost = 10.0,
  }
end
