-- Deadlock stacking recipes
local util = require("__bzsilicon__.util");

if deadlock then
  deadlock.add_stack("silica", "__bzsilicon__/graphics/icons/silica-stacked.png" , "deadlock-stacking-1", 64)
  deadlock.add_stack("optical-fiber", "__bzsilicon__/graphics/icons/optical-fiber-stacked.png" , "deadlock-stacking-2", 32)
  if not mods["Krastorio2"] then
    deadlock.add_stack("silicon", "__bzsilicon__/graphics/icons/silicon-stacked.png" , "deadlock-stacking-2", 64)
  end
  if util.more_intermediates() then
    deadlock.add_stack("silicon-wafer", "__bzsilicon__/graphics/icons/silicon-wafer-stacked.png" , "deadlock-stacking-2", 64)
    deadlock.add_stack("solar-cell", "__bzsilicon__/graphics/icons/solar-cell-stacked.png" , "deadlock-stacking-2", 64)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("silica", "deadlock-crating-1")
  deadlock_crating.add_crate("optical-fiber", "deadlock-crating-2")
  if not mods["Krastorio2"] then
    deadlock_crating.add_crate("silicon", "deadlock-crating-2")
  end
  if util.more_intermediates() then
    deadlock_crating.add_crate("silicon-wafer", "deadlock-crating-2", 64)
    deadlock_crating.add_crate("solar-cell", "deadlock-crating-2", 64)
  end
end
