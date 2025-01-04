local util = require("control-util")

util.add_regenerate_command_handler()

script.on_configuration_changed(plant_fix)
function plant_fix()
  if not script.active_mods["space-age"] then return end
  local surface_name = "gleba"
  for _, resource in pairs(me.resources) do
    local map_gen_settings = game.surfaces[surface_name].map_gen_settings
    if map_gen_settings.autoplace_controls[resource] == nil then
      map_gen_settings.autoplace_controls[resource] = {}
    end
    if map_gen_settings.autoplace_settings.entity.settings[resource] == nil then
      map_gen_settings.autoplace_settings.entity.settings[resource] = {}
    end
    game.surfaces[surface_name].map_gen_settings = map_gen_settings
  end
end

script.on_event( defines.events.on_console_chat, function(event)
  -- refresh recipes, in case of settings change
  if event.message and event.message == "SiliconRecipes" and (not event.player_index or not game.players[event.player_index] or game.players[event.player_index].admin) then
      if game.players[event.player_index].force.recipes["silicon-wafer"] then
        game.players[event.player_index].force.recipes["silicon-wafer"].enabled=true      
      end
      if game.players[event.player_index].force.recipes["solar-cell"] then
        game.players[event.player_index].force.recipes["solar-cell"].enabled=true      
      end
      if game.players[event.player_index].force.recipes["hydrogen-chloride"] then
        game.players[event.player_index].force.recipes["hydrogen-chloride"].enabled=true      
      end
  end
end)

