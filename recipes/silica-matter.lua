if mods["Krastorio2"] then
local matter = require("__Krastorio2__/lib/public/data-stages/matter-util")
local silica_matter = 
  {
    item_name = "silica",
    minimum_conversion_quantity = 10,
    matter_value = .65,
    energy_required = 2,
    only_deconversion = false,
    need_stabilizer = false,
    unlocked_by_technology = "kr-matter-stone-processing"
  }
matter.createMatterRecipe(silica_matter)
end
