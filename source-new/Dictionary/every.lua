--!strict
local every = require(script.Parent.Parent.utils.every)
--[=[
	Returns true if `predicate` returns true for all entries in the Iterable.

	```lua
	Dictionary.every({ a = 1, b = 2, c = 3 }, function(value, key)
		return value < 10
	end)
	-- true
	```

	@within Dictionary
	@function every
	@param predicate (Value, Key) -> (boolean)
	@return { [Key]: Value }
]=]

return function<Key, Value>(list: { [Key]: Value }, predicate: (Value, Key) -> boolean): boolean
	return every(list, predicate)
end
