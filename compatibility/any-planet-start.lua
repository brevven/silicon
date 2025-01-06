local util = require("data-util");
if mods["any-planet-start"] and util.me.get_setting("aps-planet") == "vulcanus" then
  -- Avoid cycles or soft locks on Vulcanus start
  util.set_prerequisite("silica-processing", {})
  util.add_unlock("automation", "basic-crusher")
  util.set_prerequisite("silicon-processing", {"silica-processing"})
  util.set_tech_trigger("silica-processing", {type = "mine-entity", entity="huge-volcanic-rock"})
  util.set_tech_trigger("silicon-processing", {type = "craft-item", item="silica", count=50})
  if util.me.more_intermediates() then
    util.add_new_crafting_category("handcrafting", true)
    data:extend({
      {
        type = "recipe",
        name = "silicon-wafer-by-hand",
        localised_name = {"item-name.silicon-wafer"},
        category = "handcrafting",
        subgroup = "intermediate-product",
        enabled = false,
        energy_required = 1,
        allow_productivity = true,
        ingredients = {
          {type= "item", name="silicon", amount=1},
        },
        results = {util.item("silicon-wafer", 1)}
      },
    })
    util.add_unlock("silicon-processing", "silicon-wafer-by-hand") 
  end
elseif mods["any-planet-start"] and util.me.get_setting("aps-planet") == "fulgora" then
  util.set_prerequisite("silica-processing", {"automation-science-pack"})
  util.set_prerequisite("silicon-processing", {"silica-processing"})
  util.remove_prerequisite("advanced-circuit", "silicon-processing")
elseif mods["any-planet-start"] and util.me.get_setting("aps-planet") == "gleba" then
  util.add_new_crafting_category("handcrafting", true)
  data:extend({
    {
      type = "recipe",
      name = "silica-from-ash-by-hand",
      localised_name = {"item-name.silica"},
      category = "handcrafting",
      subgroup = "raw-material",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type= "item", name="razorgrass-ash", amount=1},
      },
      results = {util.item("silica", 1)}
    },
  })
  util.add_unlock("razorgrass", "silica-from-ash-by-hand") 
end
