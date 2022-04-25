--[=[
	Returns a new List of only entries for which the `predicate` function returns false.

	```lua
	List.new({ 1, 2, 3, 4 }).filterNot(function(value, key)
		return value % 2 == 0
	end)
	-- List( 1, 3 )
	```

	@within List
	@function filterNot
	@param predicate (Value, Key) -> (boolean)
	@return List
]=]

local filter = require(script.Parent.filter)

return function(List, isCollection)
	local function filterNot<Key, Value>(self, predicate: (Value, Key) -> (boolean))
		return filter(List, isCollection)(self, function(value, key)
			return not predicate(value, key)
		end)
	end

	return filterNot
end
