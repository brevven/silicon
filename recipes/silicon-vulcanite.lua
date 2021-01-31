if mods["space-exploration"] then
  if mods["Krastorio2"] then
    recipe = data.raw.recipe["silicon-vulcanite"]
    recipe.ingredients = {
      {"silica", 18},
      {"se-vulcanite-block", 1}
    }
    recipe.result_count=6
    recipe.energy_required=21.6
  else
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
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "silicon", amount = 3},
      },
      icons =
      {
          { icon = "__bzsilicon__/graphics/icons/silicon.png", icon_size = 64 },
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "silicon-smelting-vulcanite"})
  end
end
