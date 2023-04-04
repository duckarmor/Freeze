--!strict
local some = require(script.Parent.Parent.utils.some)
--[=[
	Returns true if `predicate` returns true for any entry in the list.

	```lua
	List.some({ 1, 2, 3 }, function(value, index)
		return value % 2 == 0
	end)
	-- true
	```

	@within List
	@function some
	@param predicate (Value, number) -> (boolean)
	@return boolean
]=]

return function<Value>(list: { Value }, predicate)
	return some(list, predicate)
end
