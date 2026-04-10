data:extend({
	{
		type = "technology",
		name = "zanven-drone-turret-tech",
		icon = "__base__/graphics/icons/construction-robot.png",
		icon_size = 64,
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
