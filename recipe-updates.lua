local util = require("__bzsilicon__.util");

if not mods["Krastorio2"] then
  util.remove_ingredient("concrete", "stone-brick");
  if mods["Bio_Industries"] then
    util.add_ingredient("concrete", "stone-brick", 3);
    util.add_ingredient("concrete", "silica", 10);
  else 
    util.add_ingredient("concrete", "silica", 25);
  end
  util.add_prerequisite("concrete", "silica-processing")

  if util.more_intermediates() then 
    util.replace_some_ingredient("processing-unit", "electronic-circuit", 10, "silicon-wafer", 5)
    util.replace_ingredient("effectivity-module", "electronic-circuit", "silicon-wafer")
    util.replace_ingredient("productivity-module", "electronic-circuit", "silicon-wafer")
    util.replace_ingredient("speed-module", "electronic-circuit", "silicon-wafer")

    util.replace_ingredient("solar-panel", "electronic-circuit", "solar-cell")
    util.replace_ingredient("solar-panel-equipment", "solar-panel", "solar-cell")
    util.add_effect("solar-energy", {type = "unlock-recipe", recipe="solar-cell"})
  else
    util.replace_some_ingredient("solar-panel", "electronic-circuit", 10, "silicon", 10)

    util.replace_some_ingredient("processing-unit", "electronic-circuit", 10, "silicon", 10)
    util.replace_ingredient("effectivity-module", "electronic-circuit", "silicon")
    util.replace_ingredient("productivity-module", "electronic-circuit", "silicon")
    util.replace_ingredient("speed-module", "electronic-circuit", "silicon")
  end

  util.add_prerequisite("solar-energy", "silicon-processing")
  util.add_prerequisite("advanced-electronics-2", util.silicon_processing)
  util.add_prerequisite("modules", util.silicon_processing)
else
  util.add_ingredient("concrete", "silica", 15);
  if not mods["aai-industry"] then
    util.add_ingredient("concrete", "sand", 10);
  end
end

util.replace_ingredient("beacon", "copper-cable", "optical-fiber")
util.add_prerequisite("effect-transmission", "fiber-optics")

-- Circuit network changes
util.replace_ingredient("green-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("green-wire", "electronic-circuit", "silicon")
util.replace_ingredient("red-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("red-wire", "electronic-circuit", "silicon")

if not mods["IndustrialRevolution"] then
  util.add_ingredient("arithmetic-combinator", "silicon", 1)
  util.add_ingredient("constant-combinator", "silicon", 1)
  util.add_ingredient("decider-combinator", "silicon", 1)
else
  util.add_prerequisite("circuit-network", "fiber-optics")
end

util.add_ingredient("arithmetic-combinator", "optical-fiber", 1)
util.add_ingredient("constant-combinator", "optical-fiber", 1)
util.add_ingredient("decider-combinator", "optical-fiber", 1)
util.add_ingredient("programmable-speaker", "optical-fiber", 1)

util.add_prerequisite("circuit-network", "fiber-optics")
util.add_prerequisite("circuit-network", util.silicon_processing)

if mods["Krastorio2"] then
  util.add_ingredient("biusart-lab", "optical-fiber", 10)
  util.add_ingredient("ai-core", "optical-fiber", 2)

  util.add_prerequisite(util.silicon_processing, "silica-processing")

  if util.more_intermediates() then 
    util.add_effect(util.silicon_processing, {type = "unlock-recipe", recipe="silicon-wafer"})
    util.remove_ingredient("electronic-components", "silicon")
    util.add_ingredient("electronic-components", "silicon-wafer", 1)

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
end
