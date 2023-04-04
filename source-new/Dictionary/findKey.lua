--!strict
local findPair = require(script.Parent.Parent.utils.findPair)

--[=[
	Returns the first key for which the `predicate` returns true.

	```lua
	Dictionary.findKey({ a = 1, b = 2, c = 3 }, function(value, key)
		return value % 2 == 0
	end)
	-- "b"
	```

	@within Dictionary
	@function findKey
	@param predicate (Value, Key) -> (boolean)
	@return Key
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, predicate: (Value, Key) -> boolean, notSetValue: Key?)
	local key, _ = findPair(dictionary, predicate)
	return if key == nil then notSetValue else key
end
