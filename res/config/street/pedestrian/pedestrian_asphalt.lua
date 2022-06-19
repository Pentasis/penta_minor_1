function data()
  return {
    numLanes = 2,
    streetWidth = 0.1,
    sidewalkWidth = 1.5,
    sidewalkHeight = .00,
    yearFrom = 1925,
    yearTo = 0,
    aiLock = true,
    country = true,
    speed = 0.1,
    type = "footpath asphalt",
    name = _("Pedestrian asphalt"),
    desc = _("Asphalt footpath"),
    categories = { "pedestrian_road" },
    borderGroundTex = "street_border.lua",
    materials = {
      streetPaving = {
        name = "street/footpath_asphalt_03.mtl",
        size = { 33.0, 33.0 }
      },
      sidewalkPaving = {
        name = "street/footpath_asphalt_03.mtl",
        size = { 33.0, 33.0 }
      }
    },
    cost = 10.0,
  }
end
