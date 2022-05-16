local tracks = {}

local function addVanillaCategory(filename, track)
    if filename == "res/config/track/standard.lua" then
        track.categories = {"Standard"}
    elseif filename == "res/config/track/high_speed.lua" then
        track.categories = {"High-Speed"}
    end

    return track
end

local function changeCrossingDelay(filename, crossing)
    if crossing.trafficDelay ~= nil and crossing.trafficDelay < 4000 then
        crossing.trafficDelay = 4000
    end

    return crossing
end

-- TODO: make this work
-- local function changeSignalDistance(fileName, signal)
--     if signal.metadata.signal then
--         if not signal.metadata.signal.type == "WAYPOINT" then
--             -- move the signal forward
--         end
--     end
--     return signal
-- end

-- ---------------------------------------------------------------------

function tracks.initTrackChanges()
    addModifier("loadTrack", addVanillaCategory)
    addModifier("loadRailroadCrossing", changeCrossingDelay)
    -- TODO Add signal distance
    -- addModifier("loadModel", changeSignalDistance)
end

return tracks
