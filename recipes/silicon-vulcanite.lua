local util = require("data-util");

if mods["space-exploration"] then
  if string.sub(mods["space-exploration"], 1, 3) == "0.6" and data.raw["item-subgroup"]["stone"] then
    util.set_item_subgroup("silica", "stone")
    util.set_item_subgroup("silicon", "stone")
    util.set_subgroup("silicon", "stone")
  end
  se_delivery_cannon_recipes["silica"] = {name= "silica"}
  if mods["Krastorio2"] then
    recipe = data.raw.recipe["silicon-vulcanite"]
    recipe.ingredients = {
      {"silica", 18},
      string.sub(mods["space-exploration"], 1, 3) == "0.6" and 
      {type="fluid", name="se-pyroflux", amount=10} or {"se-vulcanite-block", 1},
    }
    recipe.category = "smelting" -- now uses pyroflux so can't be kiln in se 0.6
    recipe.energy_required=21.6
    recipe.results = {
      {name = "silicon", amount = 6},
    }
    if string.sub(mods["space-exploration"], 1, 3) == "0.6" then
      table.insert(recipe.ingredients, {"coke", 1})
      recipe.icons = {
        { icon = "__Krastorio2Assets__/icons/items-with-variations/silicon/silicon.png", icon_size = 64},
        { icon = "__space-exploration-graphics__/graphics/icons/fluid/pyroflux.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      }
    end
  else
    se_delivery_cannon_recipes["silicon"] = {name= "silicon"}
    data:extend({
    {
      type = "recipe",
      name = "silicon-smelting-vulcanite",
      category = "smelting",
      order = "d[silicon]",
      energy_required = 6,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "silica", amount = 20},
        string.sub(mods["space-exploration"], 1, 3) == "0.6" and 
        {type="fluid", name="se-pyroflux", amount=10} or {"se-vulcanite-block", 1},
      },
      results = {
        {name = "silicon", amount = 3},
      },
      icons = {
        { icon = "__bzsilicon__/graphics/icons/silicon.png", icon_size = 64, icon_mipmaps = 3 },
        string.sub(mods["space-exploration"], 1, 3) == "0.6" and 
        { icon = "__space-exploration-graphics__/graphics/icons/fluid/pyroflux.png", icon_size = 64, scale=0.25, shift= {-10, -10}} or
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    if string.sub(mods["space-exploration"], 1, 3) == "0.6" then
      util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "silicon-smelting-vulcanite"})
      util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "silicon-smelting-vulcanite"})
    else
      table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
          {type = "unlock-recipe", recipe= "silicon-smelting-vulcanite"})
    end
  end
end
