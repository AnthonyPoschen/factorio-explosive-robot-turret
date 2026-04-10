local my_cat = "attack-drone"
for _, tech in pairs(data.raw.technology) do
	for _, eff in pairs(tech.effects or {}) do
		if eff.type == "ammo-damage" and eff.ammo_category == "rocket" then
			table.insert(tech.effects, { type = "ammo-damage", ammo_category = my_cat, modifier = eff.modifier })
		end
	end
end
