--!strict
local reduce = require(script.Parent.Parent.utils.reduce)

--[=[
	Returns the final reduced result by iterating the list in reverse (from the right side) and calling the `reducer` for every entry
	and passing along the reduced value.

	If `initialReduction` is not provided, the last item in the list will be used.

	```lua
	List.reduceRight({ "a", "b", "c" }, function(reduction, value)
		return reduction .. value
	end, "")
	-- "cba"
	```

	@within List
	@function reduceRight
	@param reducer (T, Value, Key) -> (T)
	@param initialReduction T
	@return T
]=]

return function<Value, T>(list: { Value }, reducer: (T, Value, number) -> T, initialReduction: T): T
	return reduce(list, reducer, initialReduction, true)
end
