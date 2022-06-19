local cargo_data = {}

-- Based on the assumption that 1 cargo unit = 1 m3 or 1 liter.
-- Mostly based on https://mojobob.com/roleplay/weight_chart.html and wikipedia
cargo_data.CARGO_WEIGHTS = {
  COAL                   = 1400,
  CONSTRUCTION_MATERIALS = 2500, -- made from stone, small deviation
  CRUDE                  = 881,
  FOOD                   = 200,  -- based on bread
  FUEL                   = 750,
  GOODS                  = 700,  -- made from plastics & planks (assume 50/50)
  GRAIN                  = 790,
  IRON_ORE               = 5125, -- based on hematite
  LOGS                   = 910,  -- based on oak, small deviation
  MACHINES               = 4430, -- since made from steel & planks (assume 50/50)
  OIL                    = 790,
  PASSENGERS             = 80,
  PLANKS                 = 900,  -- based on oak
  PLASTIC                = 500,
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

return cargo_data
