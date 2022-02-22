data:extend( {
  {
		type = "string-setting",
		name = "bzsilicon-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
	},
  {
		type = "string-setting",
		name = "bzsilicon-more-intermediates",
		setting_type = "startup",
		default_value = "no",
    allowed_values = {"more", "yes", "no"},
	},
  {
		type = "bool-setting",
		name = "bzsilicon-bio-crushed-stone",
		setting_type = "startup",
		default_value = true,
	},
})
