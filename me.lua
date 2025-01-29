local me = {} 
me.name = "bzsilicon"
me.resources = {{"razorgrass-plant", "gleba"}}
me.silicon_processing = (mods and mods["Krastorio2"] and "kr-silicon-processing") or "silicon-processing"
me.recipes = {"silica", "silicon", "optical-fiber", "silicon-wafer", "solar-cell", "gyro", "silicon-smelting-vulcanite"}

function me.use_gyros()
  return me.more_intermediates()
end

function me.more_intermediates()
  if me.get_setting("bz-all-intermediates") then return true end
  return mods["Bio_Industries"] or me.get_setting("bzsilicon-more-intermediates") == "yes"
end

function me.use_bio_crushed_stone()
  return mods["Bio_Industries"] and me.get_setting("bzsilicon-bio-crushed-stone") == true
end

function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end

return me
