--[=[
	Returns the first key for which the `predicate` returns true.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).find(function(value, key)
		return value % 2 == 0
	end)
	-- "b"
	```

	@within Map
	@function findKey
	@param predicate (Value, Key) -> (boolean)
	@return Key
]=]

return require(script.Parent.Parent.Collection.findKey)
