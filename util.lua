local util = {}

util.silicon_processing = mods["Krastorio2"] and "kr-silicon-processing" or "silicon-processing"

function util.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

function util.more_intermediates()
  return mods["Bio_Industries"] or util.get_setting("bzsilicon-more-intermediates") == "yes"
end

function util.get_stack_size(default) 
  if mods["Krastorio2"] then
    size = tonumber(krastorio.general.getSafeSettingValue("kr-stack-size"))
    return size or default
  end
  return default
end

-- Remove an element of type t and name from data.raw
function util.remove_raw(t, name)
  for i, elem in pairs(data.raw[t]) do
    if elem.name == name then 
      data.raw[t][i] = nil
      break
    end
  end
end

-- Add a prerequisite to a given technology
function util.add_prerequisite(technology_name, prerequisite)
  technology = data.raw.technology[technology_name]
	table.insert(technology.prerequisites, prerequisite)
end

-- Add a given quantity of ingredient to a given recipe
function util.add_ingredient(recipe_name, ingredient, quantity)
  if data.raw.recipe[recipe_name] then
    add_ingredient(data.raw.recipe[recipe_name], ingredient, quantity)
    add_ingredient(data.raw.recipe[recipe_name].normal, ingredient, quantity)
    add_ingredient(data.raw.recipe[recipe_name].expensive, ingredient, quantity)
  end
end

function add_ingredient(recipe, ingredient, quantity)
  if recipe ~= nil and recipe.ingredients ~= nil then
    for _, existing in ipairs(recipe.ingredients) do 
      if ingredient == existing.name or ingredient == existing[1] then
        return
      end
    end
    table.insert(recipe.ingredients, {ingredient, quantity})
  end
end

-- Replace one ingredien with another in a recipe
function util.replace_ingredient(recipe_name, old, new)
  if data.raw.recipe[recipe_name] then
   replace_ingredient(data.raw.recipe[recipe_name], old, new)
   replace_ingredient(data.raw.recipe[recipe_name].normal, old, new)
   replace_ingredient(data.raw.recipe[recipe_name].expensive, old, new)
  end
end

function replace_ingredient(recipe, old, new)
	if recipe ~= nil and recipe.ingredients ~= nil then
		for i, ingredient in pairs(recipe.ingredients) do 
			-- For final fixes
			if ingredient.name == old then ingredient.name = new end
			-- For updates
			if ingredient[1] == old then ingredient[1] = new end
		end
	end
end

-- Remove an ingredient from a recipe
function util.remove_ingredient(recipe_name, old)
  if data.raw.recipe[recipe_name] then
    remove_ingredient(data.raw.recipe[recipe_name], old)
    remove_ingredient(data.raw.recipe[recipe_name].normal, old)
    remove_ingredient(data.raw.recipe[recipe_name].expensive, old)
  end
end

function remove_ingredient(recipe, old)
  index = -1
	if recipe ~= nil and recipe.ingredients ~= nil then
		for i, ingredient in pairs(recipe.ingredients) do 
      if ingredient.name == old or ingredient[1] == old then
        index = i
        break
      end
    end
    if index > -1 then
      table.remove(recipe.ingredients, index)
    end
  end
end


-- Replace an amount of an ingredient in a recipe. Keep at least 1 of old.
function util.replace_some_ingredient(recipe_name, old, old_amount, new, new_amount)
  replace_some_ingredient(data.raw.recipe[recipe_name], old, old_amount, new, new_amount)
  replace_some_ingredient(data.raw.recipe[recipe_name].normal, old, old_amount, new, new_amount)
  replace_some_ingredient(data.raw.recipe[recipe_name].expensive, old, old_amount, new, new_amount)
end

function replace_some_ingredient(recipe, old, old_amount, new, new_amount)
	if recipe ~= nil and recipe.ingredients ~= nil then
		for i, ingredient in pairs(recipe.ingredients) do 
			if ingredient.name == old then
        ingredient.amount = math.max(1, ingredient.amount - old_amount)
      end
			if ingredient[1] == old then
        ingredient[2] = math.max(1, ingredient[2] - old_amount)
      end
		end
    add_ingredient(recipe, new, new_amount)
	end
end

-- Add an effect to a given technology
function util.add_effect(technology_name, effect)
  technology = data.raw.technology[technology_name]
  if technology then
    table.insert(technology.effects, effect)
  end
end

return util
