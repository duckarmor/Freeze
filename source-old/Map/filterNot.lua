--[=[
	Returns a new Map of only entries for which the `predicate` function returns false.

	```lua
	Map.new({ a = 1, b = 2, c = 3, d = 4 }).filterNot(function(value, key)
		return value % 2 == 0
	end)
	-- Map( a = 1, c = 3 )
	```

	@within Map
	@function filterNot
	@param predicate (Value, Key) -> (boolean)
	@return Map
]=]

local filter = require(script.Parent.filter)

return function(Map, isCollection)
	return function(self, predicate)
		return filter(Map, isCollection)(self, function(...)
			return not predicate(...)
		end)
	end
end
