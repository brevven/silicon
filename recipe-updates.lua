local util = require("__bzsilicon__.util");

util.remove_ingredient("concrete", "stone-brick");
util.add_ingredient("concrete", "silica", 25);
util.add_prerequisite("concrete", "silica-processing")

util.replace_some_ingredient("processing-unit", "electronic-circuit", "silicon", 10)
util.add_prerequisite("advanced-electronics-2", "silicon-processing")

util.replace_some_ingredient("solar-panel", "electronic-circuit", "silicon", 10)
util.add_prerequisite("solar-energy", "silicon-processing")

util.replace_ingredient("effectivity-module", "electronic-circuit", "silicon")
util.replace_ingredient("productivity-module", "electronic-circuit", "silicon")
util.replace_ingredient("speed-module", "electronic-circuit", "silicon")
util.add_prerequisite("modules", "silicon-processing")

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
util.add_prerequisite("circuit-network", "silicon-processing")
