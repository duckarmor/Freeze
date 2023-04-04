--[=[
	Returns true if `predicate` returns true for all entries in the Iterable.

	```lua
	List.new({ "a", "b", "c" }).every(function(value, key)
		return string.lower(value) == value
	end)
	-- true
	```

	@within List
	@function every
	@param predicate (Value, Key) -> (boolean)
	@return List
]=]
return require(script.Parent.Parent.Collection.every)
