--!strict
local reduce = require(script.Parent.Parent.utils.reduce)

--[=[
	Returns the final reduced result by iterating the list and calling the `reducer` for every entry
	and passing along the reduced value.

	If `initialReduction` is not provided, the first item in the list will be used.

	```lua
	List.reduce({ 10, 20, 30 }, function(reduction, value)
		return reduction + value
	end, 0)
	-- 60
	```

	@within List
	@function reduce
	@param reducer (T, Value, Key) -> (T)
	@param initialReduction T
	@return T
]=]

return function<Value, T>(list: { Value }, reducer: (T, Value, number) -> T, initialReduction: T): T
	return reduce(list, reducer, initialReduction, false)
end
