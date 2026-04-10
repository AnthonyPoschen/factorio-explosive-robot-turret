data:extend({
	{
		type = "explosion",
		name = "zanven-drone-explosion",
		flags = { "not-on-map" },
		icon = "__base__/graphics/icons/explosion.png",
		icon_size = 32,
		alert_radius = 50,

		animations = util.copy(data.raw.explosion["big-explosion"].animations),

		sound = {
			filename = "__zanven-drone-turret__/sounds/drone-explossion.ogg",
			volume = 1.0,
		},
	},

	{
		type = "projectile",
		name = "zanven-attack-drone",
		flags = { "not-on-map" },
		acceleration = 0.012,
		max_speed = 0.3,
		turn_rate = 0.018,

		animation = {
			filename = "__zanven-drone-turret__/graphics/drone.png",
			frame_count = 1,
			line_length = 8,
			width = 128,
			height = 128,
			shift = { 0, -0.5 },
			scale = 0.5,
			priority = "high",
		},
		rotatable = true,
		-- animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({ 1, 0.8, 0.3 }),
		-- shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
		-- smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,

		hit_collision_mask = { layers = { player = true } },

		working_sound = {
			sound = {
				filename = "__zanven-drone-turret__/sounds/drone-flying.ogg",
				volume = 1.3,
			},
			max_sounds_per_type = 3,
		},

		action = {
			type = "direct",
			action_delivery = {
				type = "instant",
				target_effects = {
					{
						type = "damage",
						damage = { amount = 700, type = "explosion" },
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
								},
							},
						},
					},
					{
						type = "create-entity",
						entity_name = "zanven-drone-explosion",
						only_when_visible = true,
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
						include_soft_decoratives = true,
						include_decals = false,
						invoke_decorative_trigger = true,
						decoratives_with_trigger_only = false,
						radius = 3.5,
					},
				},
			},
		},
	},
})
