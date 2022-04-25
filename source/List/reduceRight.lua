--[=[
	Returns the final reduced result by iterating the list in reverse (from the right side) and calling the `reducer` for every entry
	and passing along the reduced value.

	If `initialReduction` is not provided, the last item in the list will be used.

	```lua
	List.new({ "a", "b", "c" }).reduceRight(function(reduction, value)
		return reduction .. value
	end)
	-- "cba"
	```

	@within List
	@function reduceRight
	@param reducer (T, Value, Key) -> (T)
	@param initialReduction T?
	@return T
]=]

local reduce = require(script.Parent.Parent.Collection.reduce)

return function(List, isCollection)
	return function<Key, Value, T>(self, reducer: (T, Value, Key) -> (T), initialReduction: T?)
		return reduce(List, isCollection)(self, reducer, initialReduction, initialReduction == nil, true)
	end
end
