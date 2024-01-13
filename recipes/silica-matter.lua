if mods["Krastorio2"] then
  local util = require("data-util");
  util.k2matter({
    k2matter = {
      item_name = "silica",
      minimum_conversion_quantity = 20,
      matter_value = .65,
      energy_required = 2,
      only_deconversion = false,
      need_stabilizer = false,
      unlocked_by_technology = "kr-matter-stone-processing"
    },
  })
end
