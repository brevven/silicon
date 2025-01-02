-- Silica
local util = require("__bzsilicon__.data-util");
data:extend(
{
  mods["Krastorio2"] and {
    type = "recipe",
    name = "silica",
    category = "crushing",
    enabled = false,
    energy_required = 4,
    allow_productivity = true,
    ingredients = {util.item("quartz", 10)},
    results = {util.item("silica", 30)}
  } or util.me.use_bio_crushed_stone() and {
    type = "recipe",
    name = "silica",
    category = "smelting",
    enabled = false,
    energy_required = 6,
    allow_productivity = true,
    ingredients = {util.item("stone-crushed", 4)},
    results = {util.item("silica", 5)},
  } or mods["omnimatter"] and {
    type = "recipe",
    name = "silica",
    category = "smelting",
    enabled = false,
    energy_required = 6,
    allow_productivity = true,
    ingredients = {util.item("stone-crushed", 4)},
    results = {util.item("silica", 5)},
  } or
  {
    type = "recipe",
    name = "silica",
    category = mods["space-age"] and "basic-crushing" or "smelting",
    enabled = false,
    energy_required = 3.2,
    allow_productivity = true,
    ingredients = mods["space-age"] and {util.item("stone", 2)} or {util.item("stone-brick", 1)},
    results = {util.item("silica", 5)}
    -- expensive =
    -- {
    --   enabled = false,
    --   energy_required = 6.4,
    --   ingredients = {util.item("stone-brick", 2)},
    --   results = {util.item("silica", 5)}
    -- },
    
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
    order = "b-b",
    localised_description = {"", {"technology-description.silica-processing"},
                             {"technology-description.silica-processing-k2"}}
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
    order = "b-b",
    localised_description = {"", {"technology-description.silica-processing"},
                             {"technology-description.silica-processing-vanilla"}}
  },
}
)
