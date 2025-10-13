local util = require("data-util");

if mods["space-exploration"] then
  if data.raw["item-subgroup"]["stone"] then
    util.set_item_subgroup("silica", "stone")
    util.set_item_subgroup("silicon", "stone")
    util.set_subgroup("silicon", "stone")
  end
  se_delivery_cannon_recipes["silica"] = {name= "silica"}
  if mods["Krastorio2"] then
    local recipe = data.raw.recipe["se-kr-silicon-with-vulcanite"]
    recipe.ingredients = {
      {type="item", name="silica", amount=18},
      {type="fluid", name="se-pyroflux", amount=10},
    }
    recipe.category = "smelting" -- now uses pyroflux so can't be kiln in se 0.6
    recipe.energy_required=21.6
    recipe.results = {
      {type="item", name = "kr-silicon", amount = 6},
    }
    table.insert(recipe.ingredients, { type = "item", name = "kr-coke", amount = 1 })
    recipe.icons = {
      { icon = "__Krastorio2Assets__/icons/items/silicon.png", icon_size = 64},
      { icon = "__space-exploration-graphics__/graphics/icons/fluid/pyroflux.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
    }
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
        {type="item", name = "silica", amount = 20},
        {type="fluid", name="se-pyroflux", amount=10},
      },
      results = {
        {type="item", name = "silicon", amount = 3},
      },
      icons = {
        { icon = "__bzsilicon__/graphics/icons/silicon.png", icon_size = 64, icon_mipmaps = 3 },
        { icon = "__space-exploration-graphics__/graphics/icons/fluid/pyroflux.png", icon_size = 64, scale=0.25, shift= {-10, -10}}
      },
    },
    })
      util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "silicon-smelting-vulcanite"})
      util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "silicon-smelting-vulcanite"})
  end
end
