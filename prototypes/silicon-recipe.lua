-- Silicon
local util = require("data-util");
if mods["Krastorio2"] then
  util.remove_raw("recipe", "silicon-2")
  util.remove_recipe_effect("kr-silicon-processing", "silicon-2")
  if mods["Sebs-Electrics"] then
    util.add_unlock("kr-silicon-processing", "silicon")
  end
end

data:extend(
{
  mods["Krastorio2"] and {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    enabled = false,
    energy_required = 14.4,
    allow_productivity = true,
    ingredients = {
      util.item("silica", 18),
      util.item("coke", 1),
    },
    results = {util.item("silicon", 3)}
  } or {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    enabled = false,
    energy_required = 3.2,
    allow_productivity = true,
    ingredients = {util.item("silica", 10)},
    results = {util.item("silicon", 1)}
    -- expensive =
    -- {
    --   enabled = false,
    --   energy_required = 3.2,
    --   ingredients = {{"silica", 10}},
    --   result = "silicon",
    --   result_count = 1
    -- },
    
  },
  (not mods["Krastorio2"]) and 
  {
    type = "item",
    name = "silicon",
    icon = "__bzsilicon__/graphics/icons/silicon.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "raw-material",
    order = "b[silicon]",
    stack_size = util.get_stack_size(100)
  } or nil,
  (not mods["Krastorio2"]) and 
  {
    type = "technology",
    name = "silicon-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__bzsilicon__/graphics/technology/silicon-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silicon",
      },
      util.me.more_intermediates() and
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
    prerequisites = {"silica-processing", "logistic-science-pack"},
    order = "b-b"
  } or nil,
}
)
if util.me.more_intermediates() then
data:extend({
  {
    type = "item",
    name = "silicon-wafer",
    icon = "__bzsilicon__/graphics/icons/silicon-wafer.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "intermediate-product",
    stack_size = util.get_stack_size(100),
    order = "s[silicon]-silicon-wafer",
  },
  {
    type = "recipe",
    name = "silicon-wafer",
    category = "crafting-with-fluid",
    subgroup = "intermediate-product",
    enabled = false,
    energy_required = 20,
    allow_productivity = true,
    ingredients = (mods["Krastorio2"] and {
      {type= "item", name="silicon", amount=20},
      {type= "fluid", name="hydrogen-chloride", amount=50},
    } or {
      {type= "item", name="silicon", amount=20},
      {type= "fluid", name="sulfuric-acid", amount=50},
    }),
    results = {util.item("silicon-wafer", 10)}
  },
  {
    type = "item",
    name = "solar-cell",
    icon = "__bzsilicon__/graphics/icons/solar-cell.png",
    icon_size = 64, icon_mipmaps = 3,
    subgroup = "intermediate-product",
    stack_size = util.get_stack_size(100),
    order = "s[silicon]-solar-cell",
  },
  {
    type = "recipe",
    name = "solar-cell",
    category = "crafting-with-fluid",
    subgroup = "intermediate-product",
    enabled = false,
    energy_required = 2,
    allow_productivity = true,
    ingredients = (mods["bzlead"] and not mods["angelssmelting"] and {
      {type= "item", name="silicon", amount=1},
      {type= "item", name="electronic-circuit", amount=1},
      {type= "item", name="lead-plate", amount=1},
    } or {
      {type= "item", name="silicon", amount=1},
      {type= "item", name="electronic-circuit", amount=1},
    }),
    results = {util.item("solar-cell", 2)}
  },
})

util.add_effect("kr-fluids-chemistry", {type="unlock-recipe", recipe="hydrogen-chloride"})
end
