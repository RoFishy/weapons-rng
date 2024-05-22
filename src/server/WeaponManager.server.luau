local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ToolsFolder = ReplicatedStorage:WaitForChild("Weapons")

Players.PlayerAdded:Connect(function(Player)
	local Weapons = Player:WaitForChild("Weapons")

	local connection = nil
	Player.CharacterAdded:Connect(function(_)
		connection = Weapons.ChildAdded:Connect(function(Child)
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

	Player.CharacterRemoving:Connect(function()
		connection:Disconnect()
	end)
end)
