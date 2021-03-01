-- Deadlock stacking recipes
if deadlock then
  deadlock.add_stack("silica",  nil, "deadlock-stacking-1", 64)
  deadlock.add_stack("optical-fiber", nil, "deadlock-stacking-2", 64)
  if not mods["Krastorio2"] then
    deadlock.add_stack("silicon", nil, "deadlock-stacking-2", 64)
  end
  if settings.startup["bzsilicon-more-intermediates"].value  == "yes" then
    deadlock.add_stack("silicon-wafer", nil, "deadlock-stacking-2", 64)
    deadlock.add_stack("solar-cell", nil, "deadlock-stacking-2", 64)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("silica", "deadlock-crating-1")
  deadlock_crating.add_crate("optical-fiber", "deadlock-crating-2")
  if not mods["Krastorio2"] then
    deadlock_crating.add_crate("silicon", "deadlock-crating-2")
  end
   if settings.startup["bzsilicon-more-intermediates"].value  == "yes" then
    deadlock_crating.add_crate("silicon-wafer", "deadlock-crating-2", 64)
    deadlock_crating.add_crate("solar-cell", "deadlock-crating-2", 64)
  end
end
