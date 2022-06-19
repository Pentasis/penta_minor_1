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
    type = "footpath grass",
    name = _("Pedestrian grass"),
    desc = _("Grass footpath"),
    categories = { "pedestrian_road" },
    materials = {
      streetPaving = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
      sidewalkPaving = {
        name = "street/rural_grass.mtl",
        size = { 60.0, 60.0 }
      },
    },
    cost = 10.0,
  }
end
