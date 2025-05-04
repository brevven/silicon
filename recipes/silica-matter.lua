local util = require("data-util");
if util.k2() then
  util.k2matter({
    k2matter = {
      material = {
        name = "silica",
        type = "item",
        amount = 20
      },
      matter_count = .65,
      energy_required = 2,
      needs_stabilizer = false,
      allow_productivity = true,      
      unlocked_by = "kr-matter-stone-processing"
    },
  }, false)
end
