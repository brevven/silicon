local util = require("__bzsilicon__.util");

data:extend({
  {
    type = "item",
    name = "sand-collector",
    icon = "__base__/graphics/icons/electric-mining-drill.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "extraction-machine",
    order = "a[items]-b[sand-collector]",
    place_result = "sand-collector",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "sand-collector",
    energy_required = 2,
    ingredients =
    {
      {"advanced-circuit", 5},
      {"electric-mining-drill", 1},
    },
    result = "sand-collector",
  },
  {
      type = "item",
      name = "sand",
      icon_size = 64, icon_mipmaps = 3,
      icon = "__bzsilicon__/graphics/icons/sand.png",
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(100)
  },
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "sand",
    icon = "__bzsilicon__/graphics/icons/sand.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.35, g=0.35, b=0.10},
    minable =
    {
      hardness = 1,
      mining_particle = "stone-particle",
      mining_time = 1,
      result = "sand"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__base__/graphics/entity/stone/stone.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__base__/graphics/entity/stone/hr-stone.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
          }
    },
  },
})
