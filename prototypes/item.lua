local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
	{
		type = "item",
		name = "zanven-drone-turret",
		icon = "__zanven-drone-turret__/graphics/turret-icon.png",
		icon_size = 256,
		pictures = { { filename = "__zanven-drone-turret__/graphics/turret-icon.png", size = 256, scale = 0.20 } },
		subgroup = "turret",
		order = "b[turret]-c[bot-turret]-a[turret]",
		inventory_move_sound = item_sounds.turret_inventory_move,
		pick_sound = item_sounds.turret_inventory_pickup,
		drop_sound = item_sounds.turret_inventory_move,
		place_result = "zanven-drone-turret",
		stack_size = 10,
		weight = 100 * kg,
	},
	{
		type = "ammo-category",
		name = "attack-drone",
		icon = "__zanven-drone-turret__/graphics/drone-icon.png",
		icon_size = 256,
	},
	{
		type = "ammo",
		icon = "__zanven-drone-turret__/graphics/drone-icon.png",
		icon_size = 256,
		pictures = { { filename = "__zanven-drone-turret__/graphics/drone-icon.png", size = 256, scale = 0.20 } },
		name = "zanven-attack-drone",
		ammo_category = "attack-drone",
		-- icon_mipmaps = 1,
		subgroup = "ammo",
		order = "d[explosive]-z[drone]",
		stack_size = 1,
		weight = 80 * kg,
		ammo_type = {
			category = "attack-drone",
			action = {
				type = "direct",
				action_delivery = {
					type = "projectile",
					projectile = "zanven-attack-drone",
					starting_speed = 0.6,
				},
			},
		},
	},
})
