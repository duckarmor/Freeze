--!strict
local Freeze = require(script.Parent)

return function()
	--[[local list = { "a", "b" }
	local result = Freeze.List.get(list, 2)
	if result then
		local x = string.find(result, "b")
	end

	local newList = Freeze.List.set(list, 2, "c")
	print("newList:", newList)]]
end
