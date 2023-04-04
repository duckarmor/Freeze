--[=[
	Returns a new Dictionary of only entries for which the `predicate` function returns false.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3, d = 4 }).filterNot(function(value, key)
		return value % 2 == 0
	end)
	-- Dictionary( a = 1, c = 3 )
	```

	@within Dictionary
	@function filterNot
	@param predicate (Value, Key) -> (boolean)
	@return Dictionary
]=]

local filter = require(script.Parent.filter)

return function(Dictionary, isCollection)
	return function(self, predicate)
		return filter(Dictionary, isCollection)(self, function(...)
			return not predicate(...)
		end)
	end
end
