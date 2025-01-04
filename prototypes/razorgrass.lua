local futil = require("util")
local util = require("data-util")


if mods["space-age"] then
data.raw.planet.gleba.map_gen_settings.autoplace_settings.entity.settings["razorgrass"] = {}
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local function razorgrass_variations()
  local variation_count = 8 --variation_count or 5
  local per_row = 4 -- per_row or 5
  local scale_multiplier = .5
  local width = 600
  local height = 800
  local variations = {}
  local shift = futil.by_pixel(0,-60) -- shift or futil.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__bzsilicon__/graphics/entity/razorgrass.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__bzsilicon__/graphics/entity/razorgrass-leaves.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__bzsilicon__/graphics/entity/razorgrass-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          "__bzsilicon__/graphics/entity/razorgrass-shadow.png",
          "__bzsilicon__/graphics/entity/razorgrass-shadow2.png",
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      -- underwater       = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].underwater or nil,
      -- water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    table.insert(variations, variation)
  end
  return variations
end
local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end
data:extend({
  {
    type = "plant",
    name = "razorgrass", --silica
    icon = "__bzsilicon__/graphics/technology/razorgrass.png",
    icon_size = 256,
    growth_ticks = 5 * 60 * 60,
    agricultural_tower_tint = {primary = {.2, .7, .7}, secondary = {.4, .9, .9}},
    harvest_emissions = {spores = 3},
    flags = plant_flags,
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "razorgrass", amount = 50}
      },
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-sunnycomb", 5, 0.7),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-sunnycomb", 5, 0.6),
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.4, -0.8}, {0.4, 0.2}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[gleba]-b[normal]-r[razorgrass]",
    impact_category = "tree",
    factoriopedia_simulation = {
      planet = "gleba",
      hide_factoriopedia_gradient = true,
      init =
      [[
        game.simulation.camera_zoom = 1.4
        game.simulation.camera_position = {-0.5, 0}
        for x = -10, 9, 1 do
          for y = -4, 4 do
            game.surfaces[1].set_tiles{{position = {x, y}, name = "midland-cracked-lichen"}}
          end
        end

        game.surfaces[1].create_entity{name = "razorgrass", position = {x=-2.54, y=-0.76}, tick_grown = 100}
        game.surfaces[1].create_entity{name = "razorgrass", position = {x=2.87, y=-0.37}, tick_grown = 8000}
        game.surfaces[1].create_entity{name = "razorgrass", position = {x=-4.68, y=1.83}, tick_grown = 1000}
        game.surfaces[1].create_entity{name = "razorgrass", position = {x=-0.10, y=0.67}, tick_grown = 10000}
        game.surfaces[1].create_entity{name = "razorgrass", position = {x=4.80, y=1.69}, tick_grown = 100}
      ]]
    },
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-c",
      probability_expression = "max(main_probability, invasion_tall_probability)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {
        "midland-cracked-lichen",
        "midland-cracked-lichen-dull",
        "midland-yellow-crust",
        "midland-yellow-crust-2",
        "midland-yellow-crust-3",
        "highland-dark-rock",
        "highland-dark-rock-2",
        "highland-yellow-rock",
      },
      local_expressions = {
        main_box = "gleba_select(gleba_moisture, 0, 0.25, 0.01, -10, 1) - 1",
        main_probability = "min(0.08, 0.15 * (main_box + gleba_plants_noise_b - 0.45) * control:gleba_plants:size)", -- bigger patches, denser
        invasion_tall_box = "gleba_select(gleba_moisture, 0, 0.35, 0.01, -10, 1) - 1",
        invasion_tall_probability = "min(0.05, 0.15 * (invasion_tall_box + gleba_plants_noise_b - 0.4) * control:gleba_plants:size)", -- smaller patches, sparser
      }
    },
    variations = razorgrass_variations(), -- gleba_tree_variations("sunnycomb", 10, 5, nil, 3200/5, 1120/2),
    colors = minor_tints(),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/sunnycomb", 8, 0.7),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.3,
      average_pause_seconds = 10
    },
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "create-decorative",
            decorative = "brambles",
            spawn_min = 1,
            spawn_max = 5,
            spawn_min_radius = 0,
            spawn_max_radius = 3
          },
        }
      }
    }
  },
})

data:extend({
  {
    type = "technology",
    name = "razorgrass",
    icon_size = 256,
    icon = "__bzsilicon__/graphics/technology/razorgrass.png",
    effects = util.me.more_intermediates() and {
      { type = "unlock-recipe", recipe = "silicone", },
      { type = "unlock-recipe", recipe = "razorgrass-dried", },
      { type = "unlock-recipe", recipe = "razorgrass-ash-washing", },
    } or {
      { type = "unlock-recipe", recipe = "razorgrass-dried", },
      { type = "unlock-recipe", recipe = "razorgrass-ash-washing", },
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "razorgrass",
    },
    prerequisites = {"agriculture", "heating-tower"},
    order = "b-b",
  },
  {
    type = "item",
    name = "razorgrass",
    icon = "__bzsilicon__/graphics/icons/razorgrass.png",
    icon_size = 128,
    pictures = {
      {filename="__bzsilicon__/graphics/icons/razorgrass.png", size=128, scale=.3},
      {filename="__bzsilicon__/graphics/icons/razorgrass-1.png", size=128, scale=.3},
      {filename="__bzsilicon__/graphics/icons/razorgrass-2.png", size=128, scale=.3},
      {filename="__bzsilicon__/graphics/icons/razorgrass-3.png", size=128, scale=.3},
    },
    subgroup = "agriculture-processes",
    group = "intermediate-products",
    stack_size = 50,
    order = "b[agriculture]-r[razorgrass]",
    burnt_result = "razorgrass-ash",
    fuel_category = "chemical",
    fuel_value = "1MJ",
    spoil_ticks = 1*60*60*60,
    spoil_result = "razorgrass-dried",
    weight = 1*kg,
  },
  {
    type = "item",
    name = "razorgrass-dried",
    icon = "__bzsilicon__/graphics/icons/razorgrass-dried.png",
    icon_size = 128,
    pictures = {
      {filename="__bzsilicon__/graphics/icons/razorgrass-dried.png", size=128, scale=.3},
      {filename="__bzsilicon__/graphics/icons/razorgrass-dried-1.png", size=128, scale=.3},
      {filename="__bzsilicon__/graphics/icons/razorgrass-dried-2.png", size=128, scale=.3},
      {filename="__bzsilicon__/graphics/icons/razorgrass-dried-3.png", size=128, scale=.3},
    },
    subgroup = "agriculture-processes",
    group = "intermediate-products",
    stack_size = 100,
    order = "b[agriculture]-r[razorgrass-dried]",
    burnt_result = "razorgrass-ash",
    fuel_category = "chemical",
    fuel_value = "1MJ",
    weight = 1*kg,
  },
  {
    type = "item",
    name = "razorgrass-ash",
    icon = "__bzsilicon__/graphics/icons/ash.png",
    icon_size = 64,
    subgroup = "agriculture-processes",
    group = "intermediate-products",
    stack_size = 100,
    order = "b[agriculture]-r[razorgrass-ash]",
  },
  {
    type = "recipe",
    name = "razorgrass-dried",
    main_product = "razorgrass-dried",
    subgroup = "agriculture-processes",
    category = "smelting",
    enabled = false,
    energy_required = 10,
    allow_productivity = true,
    ingredients = {
      util.item("razorgrass", 1),
    },
    results = {
      util.item("razorgrass-dried", 1),
      util.item("razorgrass-seed", 1, .03),
    }
  },
  {
    type = "recipe",
    name = "razorgrass-ash-washing",
    icons = {
      { icon = "__bzsilicon__/graphics/icons/ash.png", icon_size = 64, scale=0.5, shift = {-4,-4}},
      { icon = "__bzsilicon__/graphics/icons/silica.png", icon_size = 64, scale=0.25, shift={8, 8}},
    },
    subgroup = "agriculture-processes",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    allow_productivity = true,
    ingredients = {
      util.item("razorgrass-ash", 1),
      util.fluid("water", 10),
      util.fluid("sulfuric-acid", 1),
    },
    results = {
      util.item("silica", 10)
    }
  },
  {
    type = "item",
    name = "razorgrass-seed",
    icon = "__bzsilicon__/graphics/icons/razorgrass-seed.png",
    icon_size = 128,
    pictures = {
      {filename="__bzsilicon__/graphics/icons/razorgrass-seed.png", size=128, scale=.25},
      {filename="__bzsilicon__/graphics/icons/razorgrass-seed-1.png", size=128, scale=.25},
      {filename="__bzsilicon__/graphics/icons/razorgrass-seed-2.png", size=128, scale=.25},
      {filename="__bzsilicon__/graphics/icons/razorgrass-seed-3.png", size=128, scale=.25},
    },
    subgroup = "agriculture-processes",
    order = "a[seeds]-r[razorgrass-seed]",
    plant_result = "razorgrass",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "gleba",
    weight = 10 * kg,
    fuel_category = "chemical",
    fuel_value = "1MJ"
  },
})
end

