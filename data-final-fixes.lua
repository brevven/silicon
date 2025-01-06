require("deadlock-stacking")

local util = require("__bzsilicon__.data-util");
 
-- Mod Mash Splinter Electronics
if mods.modmashsplinterelectronics then
  if util.me.more_intermediates() then
    util.multiply_recipe("advanced-circuit", 3)
    util.add_ingredient("advanced-circuit", "silicon-wafer", 1)
  end
  util.add_ingredient("processing-unit", "silicon-wafer", 1)
end

if mods["space-age"] then
-- If furnaces are treated as furnaces, we need 2 outputs
for i, entity in pairs(data.raw.furnace) do
  if entity.result_inventory_size ~= nil and entity.result_inventory_size < 2 and util.contains(entity.crafting_categories, "smelting") then
    entity.result_inventory_size = 2
  end
end
end 


util.add_to_product("vtk-deepcore-mining-ore-chunk-refining-stone-focus", "vtk-deepcore-mining-stone-chunk", 12)
util.add_to_product("vtk-deepcore-mining-ore-chunk-refining", "vtk-deepcore-mining-stone-chunk", 10)
util.add_to_product("vtk-deepcore-mining-ore-chunk-refining-no-uranium", "vtk-deepcore-mining-stone-chunk", 10)
util.set_vtk_dcm_ingredients()

if util.me.use_gyros() then
  util.add_ingredient("recipe-space-locomotive", "gyro", 1) -- must be in final fixes
end

if util.me.use_gyros() then
  -- Mod portal reported issue, can't reproduce, attempt to add gyro at the very end
  util.add_ingredient("flying-robot-frame", "gyro", 1)
end

util.size_recycler_output()
