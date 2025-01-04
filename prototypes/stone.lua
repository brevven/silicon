local util = require("data-util")
if mods["space-age"] then
  data:extend({
  {
    type = "recipe",
    name = "stone-from-lava",
    icons = {
     {icon = "__space-age__/graphics/icons/fluid/lava.png", icon_size=64, shift={0,-8}},
     {icon = "__base__/graphics/icons/stone.png", icon_size=64, scale = 0.333, shift={0,8}},
    },
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-a[lava-a]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "calcite", amount = 1},
      {type = "fluid", name = "lava", amount = 500},
      {type = "fluid", name = "water", amount = 250},
    },
    energy_required = 16,
    results =
    {
      {type = "item", name = "stone", amount = 25},
    },
    allow_productivity = true
  },
  })
  util.add_unlock("foundry", "stone-from-lava")
end
