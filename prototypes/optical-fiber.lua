-- Optical Fiber
local util = require("__bzsilicon__.data-util");
local item_sounds = require('__base__.prototypes.item_sounds')
data:extend(
{
  {
    type = "item",
    name = "optical-fiber",
    icon = "__bzsilicon__/graphics/icons/optical-fiber.png",
    icon_size = 64, icon_mipmaps = 3,
    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
    subgroup = util.cablesg,
    order = "a[optical-fiber]",
    stack_size = util.get_stack_size(200),
    weight = 1*kg,
  },
  {
    type = "recipe",
    name = "optical-fiber",
    enabled = false,
    allow_productivity = true,
    ingredients = {util.item("silica", 1)},
    results = {util.item("optical-fiber",  1)},
    -- expensive =
    -- {
    --   enabled = false,
    --   ingredients = {{"silica", 2}},
    --   results = {util.item("optical-fiber",  1)},
    -- },
  },

  {
    type = "technology",
    name = "fiber-optics",
    icon = "__bzsilicon__/graphics/technology/optical-fiber-tech.png",
    icon_size = 256, icon_mipmaps = 4,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "optical-fiber"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 10
    },
    prerequisites = {"lamp", "silica-processing"},
    order = "b-b"
  },
}
)
