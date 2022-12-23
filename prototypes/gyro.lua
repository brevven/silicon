local util = require("data-util");

if util.me.use_gyros() then
gyro_ingredients = {  -- outputs 4
  {"copper-cable", 2},
  {"silica", 1},
  {"silicon", 4}}

gyro_prereqs = {util.me.silicon_processing}
if mods.bzcarbon then
  table.insert(gyro_ingredients, {"diamond", 1})
  table.insert(gyro_prereqs, "diamond-processing")
end
if mods.bztungsten then
  table.insert(gyro_ingredients, {"tungsten-plate", 1})
  table.insert(gyro_prereqs, "tungsten-processing")
elseif mods.bztitanium then
  table.insert(gyro_ingredients, {"titanium-plate", 1})
  table.insert(gyro_prereqs, "titanium-processing")
elseif mods.Krastorio2 then
  table.insert(gyro_ingredients, {"rare-metals", 1})
  -- table.insert(gyro_prereqs, "titanium-processing")
end


data:extend({
  {
    type = "item",
    name = "gyro",
    icon = "__bzsilicon__/graphics/icons/gyro.png",
    icon_size = 128,
    subgroup = util.se6() and "electronic" or "intermediate-product",
    order = "s[silicon]-z-gyro",
    stack_size = util.get_stack_size(200)
  },
  {
    type = "recipe",
    name = "gyro",
    category = "crafting",
    subgroup = "intermediate-product",
    enabled = false,
    energy_required = 12,
    ingredients = gyro_ingredients,
    result = "gyro",
    result_count = 4,
  },
  {
    type = "technology",
    name = "gyro",
    icon_size = 256, 
    icon = "__bzsilicon__/graphics/technology/gyro.png",
    effects = {{type = "unlock-recipe", recipe="gyro"}},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
    },
    prerequisites = gyro_prereqs,
    order = "b-b"
  },
})
end
