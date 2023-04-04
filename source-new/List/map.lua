--!strict
local map = require(script.Parent.Parent.utils.map)

--[=[
	Returns a new List with values passed through a `mapper` function.

	Returning a second value in the mapper function will reassign the index.

	If `mapper` returns nil, the entry will be filtered.

	```lua
	List.map({ 1, 2, 3 }, function(value, index)
		return value * 10
	end).map()
	-- { 10, 20, 30 }
	```

	@within List
	@function map
	@param mapper (Value, number) -> (Value?, Key?)
	@return { }
]=]

return function<Value, NewValue>(list: { Value }, mapper)
	return map(list, mapper)
end
