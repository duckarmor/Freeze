--[=[
	Returns true if `predicate` returns true for any entry in the list.

	```lua
	List.new({ 1, 2, 3, 4, 5, 6 }).some(function(value, key)
		return value % 2 == 0
	end)
	-- true
	```

	@within List
	@function some
	@param predicate (Value, Key) -> (boolean)
	@return boolean
]=]

return require(script.Parent.Parent.Collection.some)
