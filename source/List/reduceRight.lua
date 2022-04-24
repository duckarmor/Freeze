local reduce = require(script.Parent.Parent.Collection.reduce)

return function(List, isCollection)
	local function reduceRight<Key, Value, T>(self, reducer: (T, Value, Key) -> (T), initialReduction: T?)
		return reduce(List, isCollection)(self, reducer, initialReduction, initialReduction == nil, true)
	end

	return reduceRight
end
