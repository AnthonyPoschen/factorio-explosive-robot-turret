data:extend({
	{
		type = "technology",
		name = "zanven-drone-turret",
		icon = "__zanven-drone-turret__/graphics/drone-icon.png",
		icon_size = 256,
		scale = 0.8,
		prerequisites = { "stronger-explosives-2", "land-mine", "robotics", "radar" },
		effects = {
			{ type = "unlock-recipe", recipe = "zanven-drone-turret" },
			{ type = "unlock-recipe", recipe = "zanven-attack-drone" },
		},
		unit = {
			count = 150,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "military-science-pack", 1 },
				{ "chemical-science-pack", 1 },
			},
			time = 30,
		},
	},
})
