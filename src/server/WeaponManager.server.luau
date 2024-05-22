local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ToolsFolder = ReplicatedStorage:WaitForChild("Weapons")

local function GiveToolWithoutDuplicates(toolName, backpack)
	if backpack:FindFirstChild(toolName) == nil then
		local WeaponTool = ToolsFolder:FindFirstChild(toolName)
		if WeaponTool == nil then
			return
		end

		local clonedTool = WeaponTool:Clone()
		clonedTool.Parent = backpack
	end
end

Players.PlayerAdded:Connect(function(Player)
	local connection = nil
	Player.CharacterAdded:Connect(function(character)
		local Weapons = Player:WaitForChild("Weapons")
		local Backpack = Player.Backpack

		for _, object in Weapons:GetChildren() do
			GiveToolWithoutDuplicates(object.Value, Backpack)
		end

		if connection then
			connection:Disconnect()
		end

		connection = Weapons.ChildAdded:Connect(function(Child)
			GiveToolWithoutDuplicates(Child.Value, Backpack)
		end)
	end)
end)
