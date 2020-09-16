-- Silica
data:extend(
{
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
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[silica]",
    stack_size = 100
  },
  {
    type = "technology",
    name = "silica-processing",
    icon_size = 128,
    icon = "__bzsilicon__/graphics/icons/silica-processing.png",
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
