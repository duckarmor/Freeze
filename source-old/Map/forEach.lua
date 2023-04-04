--[=[
	While the Map is iterated, the `sideEffect` is executed for every entry.
	If any call of the `sideEffect` returns `false`, the iteration will stop.
	Returns the number of entries iterated (including the last iteration which returned false).

	```lua
	Map.new({ a = 10, b = 20, c = -10, d = 30 }).forEach(function(value, _key)
		return value > 0
	end)
	-- 3
	```

	@within Map
	@function forEach
	@param sideEffect (Value, Key) -> (boolean)
	@return number
]=]

return require(script.Parent.Parent.Collection.forEach)
