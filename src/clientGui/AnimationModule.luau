local TweenService = game:GetService("TweenService")

local Info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local function AnimateText(Text1, Text2, RolledNumber)
	Text1.Position = UDim2.fromScale(0.5, 0.35)
	print(RolledNumber)
	Text1.TextColor3 = RolledNumber["Color"]
	Text1.Text = RolledNumber["Name"]
	Text2.Text = `1 in {RolledNumber["Chance"]} Chance`

	TweenService:Create(Text1, Info, { Position = UDim2.fromScale(0.5, 0.5) }):Play()
	task.wait(0.2)
end

return {
	RollAnimation = function(animationFolder: Folder, RolledNumber)
		local Background = animationFolder:WaitForChild("Background")
		local Title = animationFolder:WaitForChild("Title")
		local Rarity = Title:WaitForChild("Chance")

		Background.Visible = true
		Title.Visible = true
		Rarity.Visible = true

		for _, Table in ipairs(RolledNumber) do
			AnimateText(Title, Rarity, Table)
		end

		task.wait(1)

		Background.Visible = false
		Title.Visible = false
		Rarity.Visible = false
	end,
}
