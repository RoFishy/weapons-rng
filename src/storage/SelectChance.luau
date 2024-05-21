local module = {}

function module:GetRandomIndex(chances)
	print(chances)
	for _, v in pairs(chances) do
		print(v)
		local randomNum = math.random(1, v["Chance"])
		print(randomNum)
		if randomNum == 1 and v["Chance"] > chances["Common"]["Chance"] then
			print("Returned: ")
			return v
		end
	end
	print("Other return:")
	return chances["Common"]
end

return module
