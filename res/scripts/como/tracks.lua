local tracks = {}

local vec3 = require "vec3"
local transf = require "transf"

local SIGNAL_OFFSET = { 8, 0, 0 } -- x, y, z

-- ------------------------------------------------------------------ --

local function changeSignalBoundingBox(bounding_box, offset_vector)
  local box = vec3.new(bounding_box[1], bounding_box[2], bounding_box[3]) + vec3.new(offset_vector[1], offset_vector[2], offset_vector[3])
  return { box.x, box.y, box.z }
end

-- ------------------------------------------------------------------ --

local function addVanillaCategories(filename, track)
  if filename == "res/config/track/standard.lua" then
    track.categories = { "wooden_tracks" }
    track.desc = "Standard wooden tracks with max speed of 120 km/h"
  elseif filename == "res/config/track/high_speed.lua" then
    track.categories = { "concrete_tracks" }
    track.desc = "High-speed concrete tracks with max speed of 300 km/h"
  end

  return track
end

-- ------------------------------------------------------------------ --

local function changeCrossingDelay(filename, crossing)
  if crossing.trafficDelay ~= nil and crossing.trafficDelay < 4000 then
    crossing.trafficDelay = 4000
  end

  return crossing
end

-- ------------------------------------------------------------------ --

local function changeSignalDistance(fileName, signal)
    if signal.metadata.signal then
        if signal.metadata.signal.type ~= "WAYPOINT" then
          for _, lod in pairs(signal.lods) do
            if lod.node then
              lod.node.transf = transf.mul(transf.transl(vec3.new(SIGNAL_OFFSET[1], SIGNAL_OFFSET[2], SIGNAL_OFFSET[3])), lod.node.transf)
            end
          end

          if signal.boundingInfo then
            signal.boundingInfo.bbMax = changeSignalBoundingBox(signal.boundingInfo.bbMax, SIGNAL_OFFSET)
            signal.boundingInfo.bbMin = changeSignalBoundingBox(signal.boundingInfo.bbMin, SIGNAL_OFFSET)
          end
        end
    end
    return signal
end

-- ---------------------------------------------------------------------

function tracks.tweakTracks()
  addModifier("loadTrack", addVanillaCategories)
  addModifier("loadRailroadCrossing", changeCrossingDelay)
  addModifier("loadModel", changeSignalDistance)
end

return tracks
