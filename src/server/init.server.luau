local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local ChancesList = require(game:GetService("ServerStorage").Modules.ChancesList)
local SelectChance = require(game:GetService("ServerStorage").Modules.SelectChance)

Remotes:WaitForChild("RollFunction").OnServerInvoke = function(Player)
	local Table = {}
	print(Player.Name)

	for i = 1, 7 do
		print(i)
		table.insert(Table, SelectChance:GetRandomIndex(ChancesList.ChanceList))
	end
	return Table
end
