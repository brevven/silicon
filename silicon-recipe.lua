-- Silicon
data:extend(
{
  {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    normal = 
    {
      enabled = false,
      energy_required = 3.2,
      ingredients = {{"silica", 10}},
      result = "silicon",
      result_count = 1
    },
    expensive =
    {
      enabled = false,
      energy_required = 3.2,
      ingredients = {{"silica", 10}},
      result = "silicon",
      result_count = 1
    },
    
  },
  {
    type = "item",
    name = "silicon",
    icon = "__bzsilicon__/graphics/icons/silicon.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[silica]",
    stack_size = 100
  },
  {
    type = "technology",
    name = "silicon-processing",
    icon_size = 128,
    icon = "__bzsilicon__/graphics/icons/silicon-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silicon"
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
      time = 30
    },
    prerequisites = {"silica-processing"},
    order = "b-b"
  },
}
)
