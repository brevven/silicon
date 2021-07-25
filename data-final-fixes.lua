require("deadlock-stacking")
require("modules")

local util = require("__bzsilicon__.util");
 
-- Mod Mash Splinter Electronics
if mods.modmashsplinterelectronics then
  if util.me.more_intermediates() then
    util.multiply_recipe("advanced-circuit", 3)
    util.add_ingredient("advanced-circuit", "silicon-wafer", 1)
  end
  util.add_ingredient("processing-unit", "silicon-wafer", 1)
end
