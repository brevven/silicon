local util = require("data-util");
local item_sounds = require('__base__.prototypes.item_sounds')

if util.me.use_gyros() then
gyro_ingredients = {  -- outputs 4
  util.item("copper-cable", 2),
  util.item("silica", 1),
  util.item("silicon", 4)}

gyro_prereqs = {util.me.silicon_processing}
if mods.bzcarbon then
  table.insert(gyro_ingredients, util.item("diamond", 1))
  table.insert(gyro_prereqs, "diamond-processing")
end
if mods.bztungsten and not mods["space-age"] then
  table.insert(gyro_ingredients, util.item("tungsten-plate", 1))
  table.insert(gyro_prereqs, "tungsten-processing")
elseif mods.bztitanium and data.raw.item["titanium-plate"] then
  table.insert(gyro_ingredients, util.item("titanium-plate", 1))
  table.insert(gyro_prereqs, "titanium-processing")
elseif mods.Krastorio2 then
  table.insert(gyro_ingredients, util.item("rare-metals", 1))
end


data:extend({
  {
    type = "item",
    name = "gyro",
    icon = "__bzsilicon__/graphics/icons/gyro.png",
    icon_size = 128,
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    subgroup = util.se6() and "electronic" or "intermediate-product",
    order = "s[silicon]-z-gyro",
    stack_size = util.get_stack_size(200),
    weight = 0.5*kg,
  },
  {
    type = "recipe",
    name = "gyro",
    category = "crafting",
    subgroup = "intermediate-product",
    enabled = false,
    energy_required = 12,
    allow_productivity = true,
    ingredients = gyro_ingredients,
    results = {util.item("gyro", 4)},
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
