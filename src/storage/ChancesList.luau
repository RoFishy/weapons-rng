local m = {}

m.ChanceList = {
	["Common"] = {
		Color = Color3.fromRGB(38, 236, 94),
		Chance = 3,
		Name = "Common",
		Items = {
			"Pistol",
		},
	},

	["Rare"] = {
		Color = Color3.fromRGB(43, 146, 236),
		Chance = 7,
		Name = "Rare",
		Items = {
			"Assault Rifle",
		},
	},

	["Legendary"] = {
		Color = Color3.fromRGB(255, 169, 10),
		Chance = 13,
		Name = "Legendary",
		Items = {
			"Rocket Launcher",
		},
	},
}

return m
