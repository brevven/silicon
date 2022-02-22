-- Deadlock stacking recipes
local util = require("__bzsilicon__.data-util");

if deadlock then
  deadlock.add_stack("silica", "__bzsilicon__/graphics/icons/stacked/silica-stacked.png" , "deadlock-stacking-1", 64)
  deadlock.add_stack("optical-fiber", "__bzsilicon__/graphics/icons/stacked/optical-fiber-stacked.png" , "deadlock-stacking-2", 64)
  if not mods["Krastorio2"] then
    deadlock.add_stack("silicon", "__bzsilicon__/graphics/icons/stacked/silicon-stacked.png" , "deadlock-stacking-2", 64)
  end
  if util.me.more_intermediates() then
    deadlock.add_stack("silicon-wafer", "__bzsilicon__/graphics/icons/stacked/silicon-wafer-stacked.png" , "deadlock-stacking-2", 64)
    deadlock.add_stack("solar-cell", "__bzsilicon__/graphics/icons/stacked/solar-cell-stacked.png" , "deadlock-stacking-2", 64)
  end
  if util.me.use_gyros() then
    deadlock.add_stack("gyro", "__bzsilicon__/graphics/icons/stacked/gyro-stacked.png", "deadlock-stacking-3", 128)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("silica", "deadlock-crating-1")
  deadlock_crating.add_crate("optical-fiber", "deadlock-crating-2")
  if not mods["Krastorio2"] then
    deadlock_crating.add_crate("silicon", "deadlock-crating-2")
  end
  if util.me.more_intermediates() then
    deadlock_crating.add_crate("silicon-wafer", "deadlock-crating-2")
    deadlock_crating.add_crate("solar-cell", "deadlock-crating-2")
  end
  if util.me.use_gyros() then
    deadlock_crating.add_crate("gyro", "deadlock-crating-3")
  end
end

if mods["deadlock_stacked_recipes"] and mods["Krastorio2"] then
  -- We assume the crushing stacked quartz -> silica recipe will be added.
  util.remove_raw("recipe", "kr-vc-deadlock-stack-quartz")
end
