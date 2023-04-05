--!strict
local removeValue = require(script.Parent.removeValue)

return function()
	local list = { 10, 20, 30 }
	it("removeValue", function()
		local result = removeValue(list, 20)
		expect(result).toEqual({ 10, 30 })
	end)

	it("removeValue not found, keeps identity", function()
		local result = removeValue(list, 100)
		expect(result).toBe(list)
	end)
end
