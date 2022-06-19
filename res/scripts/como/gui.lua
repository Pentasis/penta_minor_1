local gui = {}

local function improveContourLines()
  -- TODO: can we get rid of the 'whitewash'?
  game.config.gui.contourLinesConfig.contours = {
    { id = "majorContour", name = _("Major contour (100 m)"), color = { .05, .05, .05, .5 }, level = 100.0, width = 1.6, fadeDist = -1.0 },
    { id = "minorContour", name = _("Minor contour (50 m)"), color = { .05, .05, .05, .5 }, level = 50.0, width = 1.3, fadeDist = -1.0 },
    { id = "intermediateContour", name = _("Intermediate contour (10 m)"), color = { .2, .125, .0, .5 }, level = 10.0, width = 1.0, fadeDist = 6000.0 },
    { id = "detailContour", name = _("Detail contour (2 m)"), color = { .2, .125, .0, .5 * 0.3 }, level = 2.0, width = 0.5, fadeDist = 1000.0 }
  }
end

-- ------------------------------------------------------------------ --

local function improveTerrainTools()
  game.config.terrainToolMinStrength = 5
  game.config.terrainToolMaxStrength = 200
  game.config.terrainToolMaxSize = 32
end

-- ================================================================== --

function gui.tweakGUI()
  improveContourLines()
  improveTerrainTools()
end

return gui
