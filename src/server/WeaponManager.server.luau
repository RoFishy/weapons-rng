--[[
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ToolsFolder = ReplicatedStorage:WaitForChild("Weapons")

Players.PlayerAdded:Connect(function(Player)
	local Weapons = Player:WaitForChild("Weapons")
	local Backpack = Player:WaitForChild("Backpack")

	Player.CharacterAdded:Connect(function(Character)
		Weapons.ChildAdded:Connect(function(Child)
			local WeaponName = Child.Value

			for _, v in pairs(Backpack:GetChildren()) do
				if v.Name == WeaponName then
					print("Destroying...")
					Child:Destroy()
					break
				end
			end

			local WeaponTool = ToolsFolder:WaitForChild(WeaponName):Clone()
			WeaponTool.Parent = Character
		end)
	end)
end)
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ToolsFolder = ReplicatedStorage:WaitForChild("Weapons")

Players.PlayerAdded:Connect(function(Player)
	local Weapons = Player:WaitForChild("Weapons")

	Player.CharacterAdded:Connect(function(_)
		Weapons.ChildAdded:Connect(function(Child)
			print("Child added!")
			local Backpack = Player.Backpack
			local WeaponName = Child.Value

			for _, v in pairs(Backpack:GetChildren()) do
				if v.Name == WeaponName then
					print("Destroying...")
					Child:Destroy()
					break
				end
			end

			local WeaponTool = ToolsFolder:WaitForChild(WeaponName):Clone()
			print(WeaponTool.Name)
			WeaponTool.Parent = Backpack
			print("Gave them the tool!")
		end)
	end)
end)
