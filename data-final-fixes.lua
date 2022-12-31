require("deadlock-stacking")
require("modules")

local util = require("__bzsilicon__.data-util");
 
-- Mod Mash Splinter Electronics
if mods.modmashsplinterelectronics then
  if util.me.more_intermediates() then
    util.multiply_recipe("advanced-circuit", 3)
    util.add_ingredient("advanced-circuit", "silicon-wafer", 1)
  end
  util.add_ingredient("processing-unit", "silicon-wafer", 1)
end


util.add_to_product("vtk-deepcore-mining-ore-chunk-refining-stone-focus", "vtk-deepcore-mining-stone-chunk", 12)
util.add_to_product("vtk-deepcore-mining-ore-chunk-refining", "vtk-deepcore-mining-stone-chunk", 10)
util.add_to_product("vtk-deepcore-mining-ore-chunk-refining-no-uranium", "vtk-deepcore-mining-stone-chunk", 10)
util.set_vtk_dcm_ingredients()

if util.me.use_gyros() then
  -- Mod portal reported issue, can't reproduce, attempt to add gyro at the very end
  util.add_ingredient("flying-robot-frame", "gyro", 1)
end
