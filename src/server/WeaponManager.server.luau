local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ToolsFolder = ReplicatedStorage:WaitForChild("Weapons")

local function GiveToolByName(toolName, backpack)
	local WeaponTool = ToolsFolder:FindFirstChild(toolName)
	if WeaponTool == nil then
		return
	end

	local clonedTool = WeaponTool:Clone()
	clonedTool.Parent = backpack
end

Players.PlayerAdded:Connect(function(Player)
	local connection = nil
	Player.CharacterAdded:Connect(function(_)
		local Weapons = Player:WaitForChild("Weapons")
		local Backpack = Player.Backpack

		for _, object in Weapons:GetChildren() do
			GiveToolByName(object.Value, Backpack)
		end

		if connection then
			connection:Disconnect()
		end

		connection = Weapons.ChildAdded:Connect(function(Child)
			GiveToolByName(Child.Value, Backpack)
		end)
	end)
end)
