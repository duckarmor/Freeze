--[=[
	Returns the maximum value in this map.
	If any values are comparatively equivalent, the first one found will be returned.

	The `comparator` is used in the same way as `table.sort`. If it is not provided, the default comparator is `>`.

	```lua
	Map.new({ a = 10, b = 200, c = 30 }).max()
	-- 200

	Map.new({ alice = child, bertram = teen, charlie = adult }).max(function(personA, personB)
		return personA.age > personB.age
	end)
	-- adult
	```

	@within Map
	@function max
	@param comparator ((Value, Value) -> (boolean))?
	@return Value
]=]

return require(script.Parent.Parent.Collection.max)
