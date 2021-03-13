if mods["Bio_Industries"] and data.raw.item["stone-crushed"] then
  data.raw.recipe["silica"] = {
    type = "recipe",
    name = "silica",
    category = "smelting",
    normal = {
      enabled = false,
      energy_required = 3,
      ingredients = {{"stone-crushed", 4}},
      result = "silica",
      result_count = 5,
    },
    expensive = {
      enabled = false,
      energy_required = 4.5,
      ingredients = {{"stone-crushed", 6}},
      result = "silica",
      result_count = 5,
    }
  }
end


if mods["aai-industry"] and data.raw.recipe["glass-from-sand"] then
  
end
