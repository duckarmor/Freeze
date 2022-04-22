local reduce = require(script.Parent.Parent.Collection.reduce)

return function(List, isCollection)
	return function(self, reducer, initialReduction: any?)
		return reduce(List, isCollection)(self, reducer, initialReduction, initialReduction == nil, true)
	end
end
