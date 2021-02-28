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
        recipe = "silicon",
      },
      util.more_intermediates() and
      {
        type = "unlock-recipe",
        recipe = "silicon-wafer",
      } or nil,
    
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
if util.more_intermediates() then
data:extend({
  {
    type = "item",
    name = "silicon-wafer",
    icon = "__bzsilicon__/graphics/icons/silicon-wafer.png",
    icon_size = "64",
    subgroup = "intermediate-product",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "silicon-wafer",
    category = "crafting-with-fluid",
    subgroup = "intermediate-product",
    enabled = false,
    energy_required = 20,
    ingredients = (mods["Krastorio2"] and {
      {type= "item", name="silicon", amount=20},
      {type= "fluid", name="hydrogen-chloride", amount=50},
    } or {
      {type= "item", name="silicon", amount=20},
      {type= "fluid", name="sulfuric-acid", amount=50},
    }),
    result = "silicon-wafer",
    result_count = 10,
  },
})
end
