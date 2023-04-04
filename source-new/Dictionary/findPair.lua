--!strict
local findPair = require(script.Parent.Parent.utils.findPair)

--[=[
	Returns the first [key, value] entry for which the `predicate` returns true.

	```lua
	Dictionary.findPair({ a = 1, b = 2 c = 3, d = 4 }, function(value, key)
		return value % 2 == 0
	end)
	-- ( "b", 2 )
	```

	@within Dictionary
	@function findPair
	@param predicate (Value, Key) -> (boolean)
	@return ( Key, Value )
]=]

return function<Key, Value>(list: { [Key]: Value }, predicate)
	return findPair(list, predicate)
end
