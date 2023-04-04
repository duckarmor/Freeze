--!strict
local remove = require(script.Parent:FindFirstChild("remove"))

return function()
	local list = { 10, 20, 30 }
	it("remove", function()
		local result = remove(list, 2)
		expect(result).toEqual({ 10, 30 })
	end)

	it("remove from end", function()
		local result = remove(list, -1)
		expect(result).toEqual({ 10, 20 })
	end)

	it("remove from end 2", function()
		local result = remove(list, -3)
		expect(result).toEqual({ 20, 30 })
	end)

	it("remove out of bounds", function()
		expect(function()
			remove(list, 4)
		end).to.throw("index 4 out of bounds")
	end)
end
