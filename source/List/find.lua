--[=[
	Returns the first value for which the `predicate` returns true.

	```lua
	List.new({ "a", "B", "c" }).find(function(value, key)
		return value == string.upper(v)
	end)
	-- "B"
	```

	@within List
	@function find
	@param predicate (Value, Key) -> (boolean)
	@return Value
]=]

return require(script.Parent.Parent.Collection.find)
