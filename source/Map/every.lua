--[=[
	Returns true if `predicate` returns true for all entries in the Iterable.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).every(function(value, key)
		return value < 10
	end)
	-- true
	```

	@within Map
	@function every
	@param predicate (Value, Key) -> (boolean)
	@return Map
]=]

return require(script.Parent.Parent.Collection.every)
