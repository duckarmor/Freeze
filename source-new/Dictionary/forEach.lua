--!strict
local forEach = require(script.Parent.Parent.utils.forEach)
--[=[
	While the Dictionary is iterated, the `sideEffect` is executed for every entry.
	If any call of the `sideEffect` returns `false`, the iteration will stop.
	Returns the number of entries iterated (including the last iteration which returned false).

	```lua
	Dictionary.forEach({ a = 10, b = 20, c = -10, d = 30 }, function(value, _key)
		return value > 0
	end)
	-- 3
	```

	@within Dictionary
	@function forEach
	@param sideEffect (Value, Key) -> (boolean)
	@return number
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, sideEffect: (Value, Key) -> boolean)
	return forEach(dictionary, sideEffect)
end
