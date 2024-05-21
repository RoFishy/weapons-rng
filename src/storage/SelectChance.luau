local module = {}

function module:GetRandomIndex(chances)
	for _, v in pairs(chances) do
		local randomNum = math.random(1, v["Chance"])
		if randomNum == 1 and v["Chance"] > chances["Common"]["Chance"] then
			return v
		end
	end
	return chances["Common"]
end

return module
