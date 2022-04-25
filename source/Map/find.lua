--[=[
	Returns the first value for which the `predicate` returns true.

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).find(function(value, key)
		return value % 2 == 0
	end)
	-- 2
	```

	@within Map
	@function find
	@param predicate (Value, Key) -> (boolean)
	@return Value
]=]

return require(script.Parent.Parent.Collection.find)
