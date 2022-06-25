local cargo_data = {}

-- Based on the assumption that 1 cargo unit = 1 m3 or 1000 liter.
-- Mostly based on https://mojobob.com/roleplay/weight_chart.html and wikipedia
-- I assume packaging and empty space cancel each other out.
cargo_data.CARGO_WEIGHTS = {
  COAL                   = 1400,
  CONSTRUCTION_MATERIALS = 2500, -- made from stone, small deviation
  CRUDE                  = 880,
  FOOD                   = 166,  -- based on an average bread. 1 loaf ~ 500 grams and ~ 0.003 m3
  FUEL                   = 850,  -- based on diesel
  GOODS                  = 1115, -- made from plastics & planks (assume 50/50)
  GRAIN                  = 790,  -- based on wheat
  IRON_ORE               = 5125, -- based on hematite
  LOGS                   = 910,  -- based on oak, small deviation
  MACHINES               = 4430, -- since made from steel & planks (assume 50/50)
  OIL                    = 880,
  PASSENGERS             = 70,   -- europe: 70, usa: 80, asia: 60. => Avg: 70
  PLANKS                 = 900,  -- based on oak
  PLASTIC                = 1330, -- based on PVC
  STEEL                  = 7760, -- based on carbon steel
  STONE                  = 2725, -- based on granite
  TOOLS                  = 7200  -- since made from steel, small deviation
}

-- ------------------------------------------------------------------ --

-- The game divides the capacity by 4 (for balancing purposes?)
-- I cannot imagine this being done for performance since
-- The population and demand is the same despite this factor
-- The only thing it does is increase the amount of vehicles needed
-- to transport cargo. So let's try to see what happens when we reset this factor
-- and use 'realistic' capacities.
cargo_data.CAPACITY_MULTIPLIER = 4

-- ------------------------------------------------------------------ --

return cargo_data
