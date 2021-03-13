require("recipe-updates")
require("recipes/silicon-vulcanite")


if data.raw.resource["stone"] then
  local noise = require('noise');
  -- Increase richness of stone a bit
  data.raw.resource["stone"].autoplace.richness_expression = 
    data.raw.resource["stone"].autoplace.richness_expression * noise.to_noise_expression(4/3)
end
    
