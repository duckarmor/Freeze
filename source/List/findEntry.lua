--[=[
	Returns the first [key, value] entry for which the `predicate` returns true.

	```lua
	List.new({ "a", "B", "c" }).find(function(value, key)
		return value == string.upper(v)
	end)
	-- { 2, "B" }
	```

	@within List
	@function findEntry
	@param predicate (Value, Key) -> (boolean)
	@return { Key, Value }
]=]

return require(script.Parent.Parent.Collection.findEntry)
