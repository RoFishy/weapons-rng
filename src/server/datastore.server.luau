local Players = game:GetService("Players")
--local DatastoreService = game:GetService("DataStoreService")
--local WeaponsStore = DatastoreService:GetDataStore("WeaponsStore")

--[[
function SaveData(Player)
	local WeaponsTable = {}
	for _, v in pairs(Player.Weapons:GetChildren()) do
		table.insert(WeaponsTable, v.Value)
	end

	local Success, Error = pcall(function()
		WeaponsStore:SetAsync(Player.UserId, WeaponsTable)
	end)

	if not Success then
		warn(Error)
	end
end
--]]

Players.PlayerAdded:Connect(function(Player)
	local Weapons = Instance.new("Folder")
	Weapons.Name = "Weapons"
	Weapons.Parent = Player

	--[[
	local Data
	local _, _ = pcall(function()
		Data = WeaponsStore:GetAsync(Player.UserId)
	end)

	if Data then
		for _, v in pairs(Data) do
			local WeaponValue = Instance.new("StringValue")
			WeaponValue.Name = "Weapon"
			WeaponValue.Value = v
			WeaponValue.Parent = Weapons
		end
	end
    --]]
end)

--[[
Players.PlayerRemoving:Connect(function(Player)
	SaveData(Player)
end)
--]]
