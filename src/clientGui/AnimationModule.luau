local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local function AnimateText(Text1, Text2, RolledNumber, Weapon)
	Text1.Position = UDim2.fromScale(0.375, 0.35)
	Text1.TextColor3 = RolledNumber["Color"]
	Text1.Text = RolledNumber["Name"]
	Text2.Text = `1 in {RolledNumber["Chance"]} Chance`
	Weapon.Text = RolledNumber["Items"][math.random(1, #RolledNumber["Items"])]

	TweenService:Create(Text1, Info, { Position = UDim2.fromScale(0.375, 0.468) }):Play()
	task.wait(0.2)
end

return {
	RollAnimation = function(animationFolder: Folder, RolledNumber)
		local Background = animationFolder:WaitForChild("Background")
		local Title = animationFolder:WaitForChild("Title")
		local Rarity = Title:WaitForChild("Chance")
		local Weapon = Title:WaitForChild("Weapon")

		Background.Visible = true
		Title.Visible = true
		Rarity.Visible = true
		Weapon.Visible = true

		for _, Table in ipairs(RolledNumber) do
			AnimateText(Title, Rarity, Table, Weapon)
		end

		task.wait(1)

		local RolledWeapon = Weapon.Text

		ReplicatedStorage.Remotes.AddWeapon:FireServer(RolledWeapon)

		Background.Visible = false
		Title.Visible = false
		Rarity.Visible = false
		Weapon.Visible = true
	end,
}
