require("recipe-updates")
require("strange-matter")
require("recipes/silicon-vulcanite")
require("compatibility/248k")
require("compatibility/any-planet-start")
require("compatibility/krastorio2")

local util = require("data-util");

if data.raw.resource["stone"] then
  if mods["space-exploration"] then
    -- local noise = require('noise');
    -- -- Increase richness of stone a bit
    -- data.raw.resource["stone"].autoplace.richness_expression = 
    --   data.raw.resource["stone"].autoplace.richness_expression  noise.to_noise_expression(4/3)
  else
    log("Replacing vanilla stone autoplace")
    local resource_autoplace = require('resource-autoplace');
    data.raw.resource["stone"].autoplace = resource_autoplace.resource_autoplace_settings{
      name = "stone",
      order = "b",
      base_density = 7, -- increased from 4 in vanilla
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.1,
    }
  end
end

util.redo_recycling()
