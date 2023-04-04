--!strict
local map = require(script.Parent.map)

return function()
	local dictionary: { [string]: number } = { a = 1, b = 2, c = 3 }
	it("map", function()
		local result = map(dictionary, function(value)
			return value * 10
		end)
		expect(result).toEqual({ a = 10, b = 20, c = 30 })
	end)

	it("change type", function()
		local result = map(dictionary, function(value)
			return tostring(value)
		end)
		expect(result).toEqual({ a = "1", b = "2", c = "3" })
	end)

	it("filters with nil", function()
		local result = map(dictionary, function(value)
			return if value == 2 then nil else value
		end)
		expect(result).toEqual({ a = 1, c = 3 })
	end)
end
