--[=[
	Returns the final reduced result by iterating the list and calling the `reducer` for every entry
	and passing along the reduced value.

	If `initialReduction` is not provided, the first item in the list will be used.

	```lua
	List.new({ 10, 20, 30 }).reduce(function(reduction, value)
		return reduction + value
	end)
	-- 60
	```

	@within List
	@function reduce
	@param reducer (T, Value, Key) -> (T)
	@param initialReduction T?
	@return T
]=]

local reduce = require(script.Parent.Parent.Collection.reduce)

return function(List, isCollection)
	return function<Key, Value, T>(self, reducer: (T, Value, Key) -> (T), initialReduction: T?)
		return reduce(List, isCollection)(self, reducer, initialReduction, initialReduction == nil, false)
	end
end
