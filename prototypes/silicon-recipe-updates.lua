local util = require("__bzsilicon__.util");

local need_update = false

if not mods["Krastorio2"] then
if mods["Bio_Industries"] and data.raw.item["wood-charcoal"] then
  need_update = true

  data.raw.recipe["silicon"] = {
    type = "recipe",
    name = "silicon",
    category = "biofarm-mod-smelting",
    subgroup = "bio-cokery",
    enabled = false,
    energy_required = 4,
    ingredients = { {"silica", 10}, {"wood-charcoal", 1} },
    result = "silicon",
    result_count = 1,
    icons = {
      { icon = "__bzsilicon__/graphics/icons/silicon.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = BioInd.iconpath .. "charcoal.png", icon_size = 64, scale=0.25, shift= {10, -10}},
    },
  }
end
if mods["Bio_Industries"] and data.raw.item["pellet-coke"] then
  need_update = true
  data:extend({{
    type = "recipe",
    name = "silicon-coke",
    category = "biofarm-mod-smelting",
    subgroup = "bio-cokery",
    enabled = false,
    energy_required = 8,
    ingredients = { {"silica", 20}, {"pellet-coke", 1} },
    result = "silicon",
    result_count = 3,
    icons = {
      { icon = "__bzsilicon__/graphics/icons/silicon.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = BioInd.iconpath .. "pellet_coke.png", icon_size = 64, scale=0.25, shift= {10, -10}},
    },
  }
  })
  util.add_effect("bi-tech-coal-processing-3", {type="unlock-recipe", recipe="silicon-coke"})
end

if need_update then
  for i, entity in pairs(data.raw["assembling-machine"]) do
    if entity.ingredient_count ~= nil and entity.ingredient_count < 2 and util.contains(entity.crafting_categories, "biofarm-mod-smelting") then
      -- Cokery will need to handle 2 ingredients, sorry.
      entity.ingredient_count = 2
    end
    if util.contains(entity.crafting_categories, "biofarm-mod-smelting") and
       not util.contains(entity.allowed_effects, "productivity") then
      -- Cokery also needs to allow productivity for silicon. But not for anything else
      table.insert(entity.allowed_effects, "productivity")
    end
  end
end
end

