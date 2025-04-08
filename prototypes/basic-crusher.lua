local futil = require("util")
local util = require("data-util");
local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

if mods["space-age"] and not data.raw.furnace["basic-crusher"] then
-- note that crusher is a space age asset and as such can only be used with space age

local graphics = require("__space-age__.prototypes.entity.crusher-pictures")
graphics.integration_patch.north.scale = graphics.integration_patch.north.scale * 0.5
graphics.integration_patch.east.scale = graphics.integration_patch.east.scale * 0.5
graphics.integration_patch.south.scale = graphics.integration_patch.south.scale * 0.5
graphics.integration_patch.west.scale = graphics.integration_patch.west.scale * 0.5
graphics.animation.north.layers[1].scale = graphics.animation.north.layers[1].scale * 0.5
graphics.animation.north.layers[2].scale = graphics.animation.north.layers[2].scale * 0.5
graphics.animation.south.layers[1].scale = graphics.animation.south.layers[1].scale * 0.5
graphics.animation.south.layers[2].scale = graphics.animation.south.layers[2].scale * 0.5
graphics.animation.east.layers[1].scale = graphics.animation.east.layers[1].scale * 0.5
graphics.animation.east.layers[2].scale = graphics.animation.east.layers[2].scale * 0.5
graphics.animation.west.layers[1].scale = graphics.animation.west.layers[1].scale * 0.5
graphics.animation.west.layers[2].scale = graphics.animation.west.layers[2].scale * 0.5
graphics.working_visualisations[1].north_animation.scale = graphics.working_visualisations[1].north_animation.scale * 0.5
graphics.working_visualisations[1].east_animation.scale = graphics.working_visualisations[1].east_animation.scale * 0.5
graphics.working_visualisations[1].south_animation.scale = graphics.working_visualisations[1].south_animation.scale * 0.5
graphics.working_visualisations[1].west_animation.scale = graphics.working_visualisations[1].west_animation.scale * 0.5

graphics.integration_patch.north.shift[1] = graphics.integration_patch.north.shift[1] * 0.5
graphics.integration_patch.north.shift[2] = graphics.integration_patch.north.shift[2] * 0.5
graphics.integration_patch.south.shift[1] = graphics.integration_patch.south.shift[1] * 0.5
graphics.integration_patch.south.shift[2] = graphics.integration_patch.south.shift[2] * 0.5
graphics.integration_patch.east.shift[1] = graphics.integration_patch.east.shift[1] * 0.5
graphics.integration_patch.east.shift[2] = graphics.integration_patch.east.shift[2] * 0.5
graphics.integration_patch.west.shift[1] = graphics.integration_patch.west.shift[1] * 0.5
graphics.integration_patch.west.shift[2] = graphics.integration_patch.west.shift[2] * 0.5
graphics.animation.north.layers[1].shift[1] = graphics.animation.north.layers[1].shift[1] * 0.5
graphics.animation.north.layers[1].shift[2] = graphics.animation.north.layers[1].shift[2] * 0.5
graphics.animation.north.layers[2].shift[1] = graphics.animation.north.layers[2].shift[1] * 0.5
graphics.animation.north.layers[2].shift[2] = graphics.animation.north.layers[2].shift[2] * 0.5
graphics.animation.south.layers[1].shift[1] = graphics.animation.south.layers[1].shift[1] * 0.5
graphics.animation.south.layers[1].shift[2] = graphics.animation.south.layers[1].shift[2] * 0.5
graphics.animation.south.layers[2].shift[1] = graphics.animation.south.layers[2].shift[1] * 0.5
graphics.animation.south.layers[2].shift[2] = graphics.animation.south.layers[2].shift[2] * 0.5
graphics.animation.east.layers[1].shift[1] = graphics.animation.east.layers[1].shift[1] * 0.5
graphics.animation.east.layers[1].shift[2] = graphics.animation.east.layers[1].shift[2] * 0.5
graphics.animation.east.layers[2].shift[1] = graphics.animation.east.layers[2].shift[1] * 0.5
graphics.animation.east.layers[2].shift[2] = graphics.animation.east.layers[2].shift[2] * 0.5
graphics.animation.west.layers[1].shift[1] = graphics.animation.west.layers[1].shift[1] * 0.5
graphics.animation.west.layers[1].shift[2] = graphics.animation.west.layers[1].shift[2] * 0.5
graphics.animation.west.layers[2].shift[1] = graphics.animation.west.layers[2].shift[1] * 0.5
graphics.animation.west.layers[2].shift[2] = graphics.animation.west.layers[2].shift[2] * 0.5
graphics.working_visualisations[1].north_animation.shift[1] = graphics.working_visualisations[1].north_animation.shift[1] * 0.5
graphics.working_visualisations[1].north_animation.shift[2] = graphics.working_visualisations[1].north_animation.shift[2] * 0.5
graphics.working_visualisations[1].south_animation.shift[1] = graphics.working_visualisations[1].south_animation.shift[1] * 0.5
graphics.working_visualisations[1].south_animation.shift[2] = graphics.working_visualisations[1].south_animation.shift[2] * 0.5
graphics.working_visualisations[1].east_animation.shift[1] = graphics.working_visualisations[1].east_animation.shift[1] * 0.5
graphics.working_visualisations[1].east_animation.shift[2] = graphics.working_visualisations[1].east_animation.shift[2] * 0.5
graphics.working_visualisations[1].west_animation.shift[1] = graphics.working_visualisations[1].west_animation.shift[1] * 0.5
graphics.working_visualisations[1].west_animation.shift[2] = graphics.working_visualisations[1].west_animation.shift[2] * 0.5

util.add_new_crafting_category("basic-crushing", true)

data:extend({
  {
    type = "item",
    name = "basic-crusher",
    icons = {{icon = "__space-age__/graphics/icons/crusher.png", icon_size=64, scale=0.8, tint={.7,.7,.7}}},
    subgroup = "production-machine",
    order = "s[crusher]",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "basic-crusher",
    stack_size = 10,
    weight = 50*kg
  },
  {
    type = "furnace",
    name = "basic-crusher",
    icons = {{icon = "__space-age__/graphics/icons/crusher.png", icon_size=64, scale=0.8, tint={.7,.7,.7}}},
    source_inventory_size = 1,
    result_inventory_size = 1,
    icon = "__space-age__/graphics/icons/crusher.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "basic-crusher"},
    -- fast_replaceable_group = "",
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    circuit_wire_max_distance = 9,
    circuit_connector = circuit_connector_definitions["crusher"],
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.4, -0.8}, {0.4, 0.8}},
    -- collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
        -- max = 
      }
    },
    selection_box = {{-.5, -1}, {.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 0,
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.3}}
    },
    icon_draw_specification = { scale=0.5},
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"basic-crushing"},
    crafting_speed = 2,
    energy_usage = "100kW",
    heating_energy = "200kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/crusher/crusher-loop.ogg",
        volume = 0.8
      },
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      max_sounds_per_type = 3
    },
    graphics_set = graphics,
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/crusher/crusher-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = futil.by_pixel(5, 40-32),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "recipe",
    name = "basic-crusher",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "iron-plate", amount = 10},
      {type = "item", name = "iron-gear-wheel", amount = 10},

    },
    energy_required = 2.5,
    results = {{type="item", name="basic-crusher", amount=1}}
  },
})
if mods["aai-industry"] then
  util.add_unlock("sand-processing", "basic-crusher")
  util.add_prerequisite("sand-processing", "steel-processing")
else
  util.add_unlock("automation-2", "basic-crusher")
end
util.add_prerequisite("silica-processing", "automation-2")
end
-- For graphite we can't have steel as an ingredient.
util.remove_ingredient("basic-crusher", "steel-plate")
util.add_to_ingredient("basic-crusher", "iron-plate", 20)
