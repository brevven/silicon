local util = require("data-util");

local si = util.me.more_intermediates() and "silicon-wafer" or "silicon"

if util.me.use_gyros() then
  util.add_ingredient("flying-robot-frame", "gyro", 1)
  util.add_prerequisite("robotics", "gyro")

  util.add_ingredient("distractor-capsule", "gyro", 3)
  util.add_prerequisite("distractor", "gyro")

  util.add_ingredient("laser-turret", "gyro", 1)
  util.add_prerequisite("laser-turret", "gyro")

  util.add_ingredient("artillery-shell", "gyro", 1)
  util.add_ingredient("rocket-control-unit", "gyro", 1)

  util.add_ingredient("gunship", "gyro", 1)
  util.add_prerequisite("gunships", "gyro")
  util.add_ingredient("flying-fortress", "gyro", 4)
  util.add_ingredient("jet", "gyro", 4)
  
  util.add_ingredient("jetpack-2", "gyro", 2)
  util.add_prerequisite("jetpack-2", "gyro")
  
  --K2
  util.add_ingredient("advanced-exoskeleton-equipment", "gyro", 4)
  util.add_ingredient("kr-laser-artillery-turret", "gyro", 4)
  util.add_ingredient("kr-railgun-turret", "gyro", 4)
  util.add_ingredient("kr-advanced-tank", "gyro", 4)
  util.add_ingredient("kr-rocket-turret", "gyro", 1)
  util.add_ingredient("kr-nuclear-locomotive", "gyro", 1)

  --SE
  util.add_ingredient("se-spaceship-console", "gyro", 4)
  util.add_ingredient("se-space-mechanical-laboratory", "gyro", 14)
  util.add_ingredient("se-space-gravimetrics-laboratory", "gyro", 8)
  util.add_ingredient("se-delivery-cannon", "gyro", 2)
  util.add_ingredient("se-thruster-suit-2", "gyro", 2)
end

util.replace_ingredient("cryogenic-plant", "processing-unit", "optical-fiber", 50)
util.add_ingredient("quantum-processor", "optical-fiber", 2)

if data.raw.item["silicone"] then
  if mods["space-age"] then
    util.add_ingredient("spidertron", "silicone", 8)
    util.add_ingredient("stack-inserter", "silicone", 1)
    util.add_ingredient("mech-armor", "silicone", 50)
    util.add_ingredient("cryogenic-plant", "silicone", 20)
    util.add_ingredient("capture-bot-rocket", "silicone", 2)
    util.add_ingredient("biolab", "silicone", 1)
    util.add_prerequisite("biochamber", "razorgrass")
    util.add_ingredient("fusion-reactor-equipment", "silicone", 10)
    util.add_ingredient("fusion-power-cell", "silicone", 1)
    util.replace_some_ingredient("biolubricant", "jelly", 10, "silicone", 5)
  else
    util.add_to_product("lubricant", "lubricant", 10)
    util.add_ingredient("lubricant", "silicone", 1)
    util.replace_some_ingredient("engine-unit", "pipe", 1, "silicone", 1)
    util.add_prerequisite("engine", "silicon-processing")
    util.remove_prior_unlocks("advanced-circuit", "silicon-wafer")
    util.add_prerequisite("silicon-processing", "automation-2")
    util.add_ingredient("power-armor", "silicone", 20)
    util.add_ingredient("exoskeleton-equipment", "silicone", 10)
    util.add_ingredient("fission-reactor-equipment", "silicone", 80)
    util.add_ingredient("personal-roboport-mk2-equipment", "silicone", 50)
  end
end


if not mods["Krastorio2"] then
  util.remove_ingredient("concrete", "stone-brick");
  if mods["Bio_Industries"] or mods["omnimatter"] then
    util.add_ingredient("concrete", "stone-brick", 3);
    util.add_ingredient("concrete", "silica", 10);
  else 
    util.add_ingredient("concrete", "silica", 25);
  end
  util.add_prerequisite("concrete", "silica-processing")

  if util.me.more_intermediates() then 
    util.replace_some_ingredient("processing-unit", "electronic-circuit", 10, "silicon-wafer", 10)

    util.multiply_recipe("efficiency-module", 2)
    util.remove_ingredient("efficiency-module", "electronic-circuit")
    util.add_ingredient("efficiency-module", "silicon-wafer", 5)

    util.multiply_recipe("quality-module", 2)
    util.remove_ingredient("quality-module", "electronic-circuit")
    util.add_ingredient("quality-module", "silicon-wafer", 5)

    util.multiply_recipe("productivity-module", 2)
    util.remove_ingredient("productivity-module", "electronic-circuit")
    util.add_ingredient("productivity-module", "silicon-wafer", 5)

    util.multiply_recipe("speed-module", 2)
    util.remove_ingredient("speed-module", "electronic-circuit")
    util.add_ingredient("speed-module", "silicon-wafer", 5)

    if mods.IndustrialRevolution then
      util.add_ingredient("solar-panel", "solar-cell", 9)
      util.add_effect("ir2-solar-energy-1", {type = "unlock-recipe", recipe="solar-cell"})
    else
      util.replace_ingredient("solar-panel", "electronic-circuit", "solar-cell")
      util.add_effect("solar-energy", {type = "unlock-recipe", recipe="solar-cell"})
    end
    util.replace_ingredient("solar-panel-equipment", "solar-panel", "solar-cell")
    
    if not mods.modmashsplinterelectonics then
      util.multiply_recipe("advanced-circuit", 3)
      util.replace_some_ingredient("advanced-circuit", "electronic-circuit", 3, "silicon-wafer", 3)
    end
    util.add_prerequisite("advanced-circuit", util.me.silicon_processing)

  else
    util.replace_some_ingredient("solar-panel", "electronic-circuit", 10, "silicon", 10)

    util.replace_some_ingredient("processing-unit", "electronic-circuit", 10, "silicon", 6)

    util.remove_ingredient("effectivity-module", "electronic-circuit")
    util.add_ingredient("effectivity-module", "silicon", 3)
    util.remove_ingredient("productivity-module", "electronic-circuit")
    util.add_ingredient("productivity-module", "silicon", 3)
    util.remove_ingredient("speed-module", "electronic-circuit")
    util.add_ingredient("speed-module", "silicon", 3)

    if not mods.modmashsplinterelectonics then
      util.replace_some_ingredient("advanced-circuit", "electronic-circuit", 1, "silicon", 1)
    end
    util.add_prerequisite("advanced-circuit", util.me.silicon_processing)
  end

  util.add_prerequisite("solar-energy", "silicon-processing")
  util.add_prerequisite("modules", util.me.silicon_processing)
else
  util.add_ingredient("concrete", "silica", 15);
  if not mods["aai-industry"] then
    util.add_ingredient("concrete", "sand", 10);
  end
end

util.replace_ingredient("beacon", "copper-cable", "optical-fiber")
util.add_prerequisite("effect-transmission", "fiber-optics")

-- Circuit network changes
local useful_combinators = {"timer-combinator", "counting-combinator", "random-combinator",
  "power-combinator", "max-combinator", "min-combinator", "and-gate-combinator",
  "nand-gate-combinator", "nor-gate-combinator", "not-gate-combinator", "or-gate-combinator",
  "xnor-gate-combinator", "xor-gate-combinator", "converter-combinator", "detector-combinator",
  "sensor-combinator", "railway-combinator", "color-combinator", "daytime-combinator",
 "statistic-combinator", "pollution-combinator", "emitter-combinator", "receiver-combinator"}

util.replace_ingredient("green-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("green-wire", "electronic-circuit", "silicon")
util.replace_ingredient("red-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("red-wire", "electronic-circuit", "silicon")

if not mods["IndustrialRevolution"] then
  util.add_ingredient("arithmetic-combinator", si, 1)
  util.add_ingredient("constant-combinator", si, 1)
  util.add_ingredient("decider-combinator", si, 1)
  util.add_ingredient("programmable-speaker", si, 1)
  if mods["UsefulCombinators"] then
    for i, v in ipairs(useful_combinators) do
      util.add_ingredient(v, si, 1)
    end
  end
  if mods["crafting_combinator"] then
    util.add_ingredient("crafting_combinator:crafting-combinator", si, 1)
    util.add_ingredient("crafting_combinator:recipe-combinator", si, 1)
  end
  util.add_ingredient("clock-combinator", si, 1)
  util.add_ingredient("power-meter-combinator", si, 1)
  util.add_ingredient("ghost-scanner", si, 1)
  util.add_ingredient("item-sensor", si, 1)
  util.add_ingredient("bi-pollution-sensor", si, 1)
else
  util.add_prerequisite("circuit-network", "fiber-optics")
end

util.add_ingredient("arithmetic-combinator", "optical-fiber", 1)
util.add_ingredient("constant-combinator", "optical-fiber", 1)
util.add_ingredient("decider-combinator", "optical-fiber", 1)
util.add_ingredient("programmable-speaker", "optical-fiber", 1)
util.add_ingredient("display-panel", "optical-fiber", 1)
if mods["UsefulCombinators"] then
  for i, v in ipairs(useful_combinators) do
    util.add_ingredient(v, "optical-fiber", 1)
  end
end
if mods["crafting_combinator"] then
  util.add_ingredient("crafting_combinator:crafting-combinator", "optical-fiber", 1)
  util.add_ingredient("crafting_combinator:recipe-combinator", "optical-fiber", 1)
end
util.add_ingredient("clock-combinator", "optical-fiber", 1)
util.add_ingredient("power-meter-combinator", "optical-fiber", 1)
util.add_ingredient("ghost-scanner", "optical-fiber", 1)
util.add_ingredient("item-sensor", "optical-fiber", 1)
util.add_ingredient("bi-pollution-sensor", "optical-fiber", 1)

-- Transport Drones
util.add_ingredient("road-network-reader", "optical-fiber", 5)
util.replace_some_ingredient("road-network-reader", "electronic-circuit", 5, si, 5)
util.add_ingredient("transport-depot-reader", "optical-fiber", 5)
util.replace_some_ingredient("transport-depot-reader", "electronic-circuit", 5, si, 5)
util.add_ingredient("transport-depot-writer", "optical-fiber", 5)
util.replace_some_ingredient("transport-depot-writer", "electronic-circuit", 5, si, 5)


util.add_prerequisite("circuit-network", "fiber-optics")
util.add_prerequisite("circuit-network", util.me.silicon_processing)

if mods["Krastorio2"] then
  util.add_ingredient("biusart-lab", "optical-fiber", 10)
  util.add_ingredient("ai-core", "optical-fiber", 2)

  util.add_prerequisite(util.me.silicon_processing, "silica-processing")

  if util.me.more_intermediates() then 
    util.add_effect(util.me.silicon_processing, {type = "unlock-recipe", recipe="silicon-wafer"})
    util.remove_ingredient("electronic-components", "silicon")
    util.add_ingredient("electronic-components", "silicon-wafer", 1)
    util.multiply_recipe("electronic-components-lithium", 2)
    util.remove_ingredient("electronic-components-lithium", "silicon")
    util.add_ingredient("electronic-components-lithium", "silicon-wafer", 3)

    util.replace_ingredient("solar-panel", "electronic-circuit", "solar-cell")
    util.remove_ingredient("solar-panel", "silicon")
    util.replace_ingredient("solar-panel-equipment", "solar-panel", "solar-cell")
    util.add_effect("solar-energy", {type = "unlock-recipe", recipe="solar-cell"})
  end
end

if mods["aai-signal-transimission"] then
  util.add_ingredient("aai-signal-receiver", "optical-fiber", 2)
  util.add_ingredient("aai-signal-sender", "optical-fiber", 2)
end
if mods["aai-industry"] then
  util.add_ingredient("beacon", "optical-fiber", 10)
end

if mods["space-exploration"] then
  util.add_ingredient("se-space-astrometrics-laboratory", "optical-fiber", 10)
  util.add_ingredient("se-space-gravimetrics-laboratory", "optical-fiber", 10)
  util.add_ingredient("se-space-laser-laboratory", "optical-fiber", 10)
  util.add_ingredient("se-space-science-lab", "optical-fiber", 10)
  util.add_ingredient("se-space-supercomputer-1", "optical-fiber", 100)
  util.add_ingredient("se-space-supercomputer-2", "optical-fiber", 500)

  util.add_ingredient("se-polarisation-data", "optical-fiber", 1)

  util.add_ingredient("se-chemical-gel", "silica", 10)
  util.add_ingredient("se-material-testing-pack", "silica", 1)
end

if mods["zombiesextended-core"] then
  util.add_ingredient("complex-processing-unit", si, 2)
end


if mods["extended-research-system"] and mods["Bio_Industries"] then
  data:extend({{
      type = "recipe",
      name = "bi-stone-crusher-ers",
      category = "crafting",
      enabled = true,
      energy_required = 6,
      ingredients = {util.item("iron-plate", 100), util.item("iron-gear-wheel", 5)},
      results = util.item("bi-stone-crusher"),
    }})
  if data.raw.recipe["bi-crushed-stone-1"] then
    data.raw.recipe["bi-crushed-stone-1"].enabled = true
  end
end

-- Sand in crusher
if mods["space-age"] then
  if data.raw.item["sand"] and data.raw.recipe["sand"] and #data.raw.recipe["sand"].ingredients == 1 then
    data.raw.recipe["sand"].category = "basic-crushing"
    log(serpent.block(data.raw.recipe["sand"]))
  end
end

-- Maraxsis
util.replace_ingredient("maraxsis-glass-panes", "sand", "silica", 10)
util.add_unlock("maraxsis-glassworking", "silica-from-sand-maraxsis")
