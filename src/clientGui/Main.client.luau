local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local AnimationModule = require(script.Parent:WaitForChild("AnimationModule"))

local ScreenUI = script.Parent:WaitForChild("UI"):WaitForChild("ScreenGui")
local Button = ScreenUI:WaitForChild("TextButton")

local Debounce = false

Button.MouseButton1Click:Connect(function()
	if Debounce == false then
		Debounce = true
		local RolledNumber = Remotes.RollFunction:InvokeServer()
		AnimationModule.RollAnimation(ScreenUI.Animations, RolledNumber)

		wait(1)
		Debounce = false
	end
end)

UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	if GameProcessed then
		return
	end

	if Input.KeyCode == Enum.KeyCode.E then
		if Debounce == false then
			Debounce = true
			local RolledNumber = Remotes.RollFunction:InvokeServer()
			AnimationModule.RollAnimation(ScreenUI.Animations, RolledNumber)

			wait(1)
			Debounce = false
		end
	end
end)
