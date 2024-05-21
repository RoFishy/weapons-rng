local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local ChancesList = require(game:GetService("ServerStorage").Modules.ChancesList)
local SelectChance = require(game:GetService("ServerStorage").Modules.SelectChance)

Remotes:WaitForChild("RollFunction").OnServerInvoke = function(player)
	local Table = {}

	for i = 1, 7 do
		table.insert(Table, SelectChance:GetRandomIndex(ChancesList.ChanceList))
	end
	return Table
end
