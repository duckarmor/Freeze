--[=[
	Returns true if `predicate` returns true for any entry in the map.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).some(function(value, key)
		return value % 2 == 0
	end)
	-- true
	```

	@within Dictionary
	@function some
	@param predicate (Value, Key) -> (boolean)
	@return boolean
]=]

return require(script.Parent.Parent.Collection.some)
