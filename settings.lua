data:extend( {
  {
		type = "string-setting",
		name = "bzsilicon-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
    order = "a-b",
	},
  {
		type = "string-setting",
		name = "bzsilicon-more-intermediates",
		setting_type = "startup",
		default_value = "no",
    allowed_values = {"yes", "no"},
    order = "a-a",
	},
})
if mods.Bio_Industries then
data:extend( {
  {
		type = "bool-setting",
		name = "bzsilicon-bio-crushed-stone",
		setting_type = "startup",
		default_value = true,
    order = "z-a"
	},
})
end
