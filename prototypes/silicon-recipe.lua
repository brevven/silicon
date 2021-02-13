-- Silicon
local util = require("__bzsilicon__.util");
if mods["Krastorio2"] then
 util.remove_raw("recipe", "silicon-2")
end

data:extend(
{
  mods["Krastorio2"] and {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    enabled = false,
    energy_required = 14.4,
    ingredients = {
      {"silica", 18},
      {"coke", 1}
    },
    result = "silicon",
    result_count = 3
  } or {
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
  (not mods["Krastorio2"]) and 
  {
    type = "item",
    name = "silicon",
    icon = "__bzsilicon__/graphics/icons/silicon.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[silicon]",
    stack_size = util.get_stack_size(100)
  } or nil,
  (not mods["Krastorio2"]) and 
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
  } or nil,
}
)
