--[=[
	Returns the first key for which the `predicate` returns true.

	##### Alias
	`findIndex`

	```lua
	List.new({ "a", "B", "c" }).find(function(value, key)
		return value == string.upper(v)
	end)
	-- 2
	```

	@within List
	@function findKey
	@param predicate (Value, Key) -> (boolean)
	@return Key
]=]

return require(script.Parent.Parent.Collection.findKey)
