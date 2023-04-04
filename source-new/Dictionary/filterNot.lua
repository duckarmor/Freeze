--!strict
local filter = require(script.Parent.filter)

--[=[
	Returns a new Dictionary of only entries for which the `predicate` function returns false.

	```lua
	Dictionary.filterNot({ a = 1, b = 2, c = 3, d = 4 }, function(value, key)
		return value % 2 == 0
	end)
	-- { a = 1, c = 3 }
	```

	@within Dictionary
	@function filterNot
	@param predicate (Value, Key) -> (boolean)
	@return { [Key]: Value }
]=]

local function filterNot<Key, Value>(dictionary: { [Key]: Value }, predicate: (Value, Key) -> boolean)
	return filter(dictionary, function(value, key)
		return not predicate(value, key)
	end)
end

return filterNot
