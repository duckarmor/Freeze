--!strict
local every = require(script.Parent.Parent.utils.every)
--[=[
	Returns true if `predicate` returns true for all entries in the list.

	```lua
	List.every({ "a", "b", "c" }, function(value, key)
		return string.lower(value) == value
	end)
	-- true
	```

	@within List
	@function every
	@param predicate (Value, Key) -> (boolean)
	@return boolean
]=]
return function<Value>(list: { Value }, predicate: (Value, number) -> boolean): boolean
	return every(list, predicate)
end
