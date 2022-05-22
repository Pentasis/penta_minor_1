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
        speed = 40.0,
        type = "country old",
        name = _("Rural gravel"),
        desc = _("Gravel road 40 km/h."),
        categories = { "rural_road" },
        materials = {
            streetPaving = {
                name = "street/country_kies_02.mtl",
                size = { 60.0, 60.0 }
            }
        },
        borderGroundTex = "none.lua",
        sidewalkFillGroundTex = "",
        cost = 10.0,
    }
end
