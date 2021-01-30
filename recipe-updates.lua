local util = require("__bzsilicon__.util");

if not mods["Krastorio2"] then
  util.remove_ingredient("concrete", "stone-brick");
  util.add_ingredient("concrete", "silica", 25);
  util.add_prerequisite("concrete", "silica-processing")

  util.replace_some_ingredient("processing-unit", "electronic-circuit", "silicon", 10)
  util.add_prerequisite("advanced-electronics-2", util.silicon_processing)

  util.replace_some_ingredient("solar-panel", "electronic-circuit", "silicon", 10)
  util.add_prerequisite("solar-energy", "silicon-processing")

  util.replace_ingredient("effectivity-module", "electronic-circuit", "silicon")
  util.replace_ingredient("productivity-module", "electronic-circuit", "silicon")
  util.replace_ingredient("speed-module", "electronic-circuit", "silicon")
  util.add_prerequisite("modules", util.silicon_processing)
else
  util.remove_ingredient("concrete", "stone-brick");
  if not mods["space-exploration"] then
    util.add_ingredient("concrete", "sand", 25);
  end
end

util.replace_ingredient("beacon", "copper-cable", "optical-fiber")
util.add_prerequisite("effect-transmission", "fiber-optics")


-- Circuit network changes
util.replace_ingredient("green-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("green-wire", "electronic-circuit", "silicon")
util.replace_ingredient("red-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("red-wire", "electronic-circuit", "silicon")

util.add_ingredient("arithmetic-combinator", "silicon", 1);
util.add_ingredient("arithmetic-combinator", "optical-fiber", 1);
util.add_ingredient("constant-combinator", "silicon", 1);
util.add_ingredient("constant-combinator", "optical-fiber", 1);
util.add_ingredient("decider-combinator", "silicon", 1);
util.add_ingredient("decider-combinator", "optical-fiber", 1);
util.add_ingredient("programmable-speaker", "optical-fiber", 1);

util.add_prerequisite("circuit-network", "fiber-optics")
util.add_prerequisite("circuit-network", util.silicon_processing)

if mods["Krastorio2"] then
  util.add_prerequisite("kr-silicon-processing", "silica-processing")
  util.add_ingredient("biusart-lab", "optical-fiber", 10)
  util.add_ingredient("ai-core", "optical-fiber", 2)
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
