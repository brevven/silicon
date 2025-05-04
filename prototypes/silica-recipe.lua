-- Silica
local util = require("__bzsilicon__.data-util");
local item_sounds = require('__base__.prototypes.item_sounds')
data:extend(
{
  util.k2() and {
    type = "recipe",
    name = "silica",
    category = "kr-crushing",
    enabled = false,
    energy_required = 4,
    allow_productivity = true,
    ingredients = {util.item("kr-quartz", 10)},
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
  -- } or mods["aai-industry"] and {
  --   type = "recipe",
  --   name = "silica",
  --   category = mods["space-age"] and "basic-crushing" or "crafting",
  --   enabled = false,
  --   energy_required = 0.5,
  --   allow_productivity = true,
  --   ingredients = {util.item("sand", 1)},
  --   results = {util.item("silica", 1)},
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
    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
    subgroup = "raw-material",
    order = "b[silica]",
    stack_size = util.get_stack_size(100),
    weight = 0.2*kg,
  },
  util.k2() and {
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
        recipe = "kr-quartz"
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
    prerequisites = {"logistic-science-pack"},
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
        {"logistic-science-pack", 1},
      },
      time = 30
    },
    order = "b-b",
    localised_description = {"", {"technology-description.silica-processing"},
                             {"technology-description.silica-processing-vanilla"}}
  },
}
)
if mods.maraxsis then
data:extend({
  {
    type = "recipe",
    name = "silica-from-sand-maraxsis",
    localised_name = {"item-name.silica"},
    category = "basic-crushing",
    enabled = false,
    energy_required = 1.6,
    allow_productivity = true,
    ingredients = {util.item("sand", 1)},
    results = {util.item("silica", 5)},
  }
})
end
