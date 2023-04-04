--[=[
	Returns the first [key, value] entry for which the `predicate` returns true.

	```lua
	Dictionary.new({ a = 1, b = 2 c = 3, d = 4 }).find(function(value, key)
		return value % 2 == 0
	end)
	-- { "b", 2 }
	```

	@within Dictionary
	@function findEntry
	@param predicate (Value, Key) -> (boolean)
	@return { Key, Value }
]=]

return require(script.Parent.Parent.Collection.findEntry)
