local m = {}

m.ChanceList = {
	["Common"] = {
		Color = Color3.fromRGB(38, 236, 94),
		Chance = 3,
		Name = "Common",
		Items = {
			"Pistol",
			"Shotgun",
		},
	},

	["Rare"] = {
		Color = Color3.fromRGB(43, 146, 236),
		Chance = 7,
		Name = "Rare",
		Items = {
			"Assault Rifle",
			"SMG",
		},
	},

	["Epic"] = {
		Color = Color3.fromRGB(210, 98, 255),
		Chance = 15,
		Name = "Epic",
		Items = {
			"Sniper",
			"Crossbow",
		},
	},

	["Legendary"] = {
		Color = Color3.fromRGB(255, 169, 10),
		Chance = 25,
		Name = "Legendary",
		Items = {
			"Grenade Launcher",
			"Railgun",
			"Rocket Launcher",
		},
	},
}

return m
