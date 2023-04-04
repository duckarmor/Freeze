--!strict
local findPair = require(script.Parent.Parent.utils.findPair)

--[=[
	Returns the first (key, value) pair for which the `predicate` returns true.

	```lua
	Dictionary.findPair({ a = 1, b = 2 c = 3, d = 4 }, function(value, key)
		return value % 2 == 0
	end)
	-- ( "b", 2 )
	```

	@within Dictionary
	@function findPair
]=]

return function<Key, Value>(list: { [Key]: Value }, predicate: ((Value, Key) -> boolean)): (Key?, Value?)
	return findPair(list, predicate)
end
