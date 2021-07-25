-- Silica
local util = require("__bzsilicon__.util");
data:extend(
{
  mods["Krastorio2"] and {
    type = "recipe",
    name = "silica",
    category = "crushing",
    enabled = false,
    energy_required = 4,
    ingredients = {{"quartz", 10}},
    result = "silica",
    result_count = 30
  } or util.me.use_bio_crushed_stone() and {
    type = "recipe",
    name = "silica",
    category = "smelting",
    enabled = false,
    energy_required = 6,
    ingredients = {{"stone-crushed", 4}},
    result = "silica",
    result_count = 5,
  } or mods["omnimatter"] and {
    type = "recipe",
    name = "silica",
    category = "smelting",
    enabled = false,
    energy_required = 6,
    ingredients = {{"stone-crushed", 4}},
    result = "silica",
    result_count = 5,
  } or
  {
    type = "recipe",
    name = "silica",
    category = "smelting",
    normal = 
    {
      enabled = false,
      energy_required = 3.2,
      ingredients = {{"stone-brick", 1}},
      result = "silica",
      result_count = 5
    },
    expensive =
    {
      enabled = false,
      energy_required = 6.4,
      ingredients = {{"stone-brick", 2}},
      result = "silica",
      result_count = 5
    },
    
  },
  {
    type = "item",
    name = "silica",
    icon = "__bzsilicon__/graphics/icons/silica.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[silica]",
    stack_size = util.get_stack_size(100)
  },
  mods["Krastorio2"] and {
    type = "technology",
    name = "silica-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__bzsilicon__/graphics/technology/silica-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silica"
      },
      {
        type = "unlock-recipe",
        recipe = "quartz"
      },
    },
    prerequisites = {"kr-fluids-chemistry", "kr-stone-processing"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 30
    },
    order = "b-b"
  } or {
    type = "technology",
    name = "silica-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__bzsilicon__/graphics/technology/silica-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silica"
      }
    },
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 30
    },
    order = "b-b"
  },
}
)
