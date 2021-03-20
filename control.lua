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

