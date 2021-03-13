local util = require("__bzsilicon__.util");

recipes = {"silica", "silicon"}
if util.more_intermediates() then
  table.insert(recipes, "silicon-wafer")
  table.insert(recipes, "solar-cell")
end

if mods["space-exploration"] then
  table.insert(recipes, "silicon-smelting-vulcanite")
end

if data.raw.recipe["silicon-coke"] then
  table.insert(recipes, "silicon-coke")
end

for i, recipe in pairs(recipes) do
  if data.raw.recipe[recipe] then
    for j, module in pairs(data.raw.module) do
      if module.effect then
        for effect_name, effect in pairs(module.effect) do
          if effect_name == "productivity" and effect.bonus > 0 and module.limitation and #module.limitation > 0 then
            table.insert(module.limitation, recipe)
          end
        end
      end
    end
  end
end
