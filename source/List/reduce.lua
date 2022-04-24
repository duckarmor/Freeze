local reduce = require(script.Parent.Parent.Collection.reduce)

return function(List, isCollection)
	local function reduceFn<Key, Value, T>(self, reducer: (T, Value, Key) -> (T), initialReduction: T?)
		return reduce(List, isCollection)(self, reducer, initialReduction, initialReduction == nil, false)
	end

	return reduceFn
end
