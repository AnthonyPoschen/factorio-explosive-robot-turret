data:extend({
	{
		type = "explosion",
		name = "zanven-drone-explosion",
		flags = { "not-on-map" },
		icon = "__base__/graphics/icons/explosion.png",
		icon_size = 32,
		alert_radius = 50, -- big radius enemy reaction
		animations = util.copy(data.raw.explosion["big-explosion"].animations),
		sound = {
			filename = "__zanven-drone-turret__/sounds/drone-explossion.ogg",
			volume = 0.85,
		},
	},
	{
		type = "projectile",
		name = "zanven-attack-drone",
		flags = { "not-on-map" },
		acceleration = 0.012, -- tune: higher = faster acceleration
		max_speed = 0.65, -- tune: hard cap on top speed
		turn_rate = 0.018, -- tune: homing strength (0 = straight)
		animation = util.copy(data.raw["construction-robot"]["construction-robot"].animation),
		shadow = util.copy(data.raw["construction-robot"]["construction-robot"].shadow),
		hit_collision_mask = { layers = { player = true } },
		working_sound = {
			sound = {
				filename = "__zanven-drone-turret__/sounds/drone-flying.ogg",
				volume = 0.7,
			},
			max_sounds_per_type = 3,
		},
		action = {
			type = "direct",
			action_delivery = {
				type = "instant",
				target_effects = {
					{
						type = "create-entity",
						entity_name = "zanven-drone-explosion",
						only_when_visible = true,
					},
					{
						type = "damage",
						damage = { amount = 700, type = "explosion" },
					},
					{
						type = "create-entity",
						entity_name = "medium-scorchmark-tintable",
						check_buildability = true,
					},
					{
						type = "invoke-tile-trigger",
						repeat_count = 1,
					},
					{
						type = "destroy-decoratives",
						from_render_layer = "decorative",
						to_render_layer = "object",
						include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
						radius = 3.5, -- large radius for demostrative purposes
					},
					{
						type = "nested-result",
						action = {
							type = "area",
							radius = 6.5,
							action_delivery = {
								type = "instant",
								target_effects = {
									{
										type = "damage",
										damage = { amount = 300, type = "explosion" },
									},
									{
										type = "create-entity",
										entity_name = "explosion",
										only_when_visible = true,
									},
								},
							},
						},
					},
				},
			},
		},
	},
})
