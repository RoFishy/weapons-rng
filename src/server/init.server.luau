local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Weapons = ReplicatedStorage:WaitForChild("Weapons")

local ChancesList = require(game:GetService("ServerStorage").Modules.ChancesList)
local SelectChance = require(game:GetService("ServerStorage").Modules.SelectChance)

Remotes:WaitForChild("RollFunction").OnServerInvoke = function(Player)
	local Table = {}
	print(Player.Name)

	for _ = 1, 7 do
		table.insert(Table, SelectChance:GetRandomIndex(ChancesList.ChanceList))
	end
	return Table
end

Remotes:WaitForChild("AddWeapon").OnServerEvent:Connect(function(Player, WeaponRolled)
	local WeaponTool = Weapons:FindFirstChild(WeaponRolled)
	if not WeaponTool then
		warn(`Weapon {WeaponRolled} not found!`)
	else
		for _, value in pairs(Player.Weapons:GetChildren()) do
			if value.Value == WeaponRolled then
				return
			end
		end
		local WeaponValue = Instance.new("StringValue")
		WeaponValue.Name = "Weapon"
		WeaponValue.Value = WeaponRolled
		WeaponValue.Parent = Player.Weapons
	end
end)
