--!strict
local forEach = require(script.Parent.Parent.utils.forEach)
--[=[
	While the List is iterated, the `sideEffect` is executed for every entry.
	If any call of the `sideEffect` returns `false`, the iteration will stop.
	Returns the number of entries iterated (including the last iteration which returned false).

	```lua
	List.forEach({ 1, 10, -20, 30 }, function(value, index)
		return value > 0
	end)
	-- 3
	```

	@within List
	@function forEach
	@param sideEffect (Value, number) -> (boolean)
	@return number
]=]

return function<Value>(list: { Value }, sideEffect: (Value, number) -> boolean)
	return forEach(list, sideEffect)
end
