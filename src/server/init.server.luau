print("Hello world, from server!")

game.Workspace.Baseplate.BrickColor = BrickColor.new("Earth green")
game.Workspace.Baseplate.Transparency = 0.7

local module = require(game:GetService("ServerStorage").Modules.moduleOne)

module:Print()
