-- Optical Fiber
local util = require("__bzsilicon__.util");
data:extend(
{
  {
    type = "item",
    name = "optical-fiber",
    icon = "__bzsilicon__/graphics/icons/optical-fiber.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "intermediate-product",
    order = "a[optical-fiber]",
    stack_size = util.get_stack_size(200)
  },
  {
    type = "recipe",
    name = "optical-fiber",
    normal = 
    {
      enabled = false,
      ingredients = {{"silica", 1}},
      result = "optical-fiber",
      result_count = 1
    },
    expensive =
    {
      enabled = false,
      ingredients = {{"silica", 2}},
      result = "optical-fiber",
      result_count = 1
    },
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
    prerequisites = {"optics", "silica-processing"},
    order = "b-b"
  },
}
)
