local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self, amount: number)
		return slice(List, isCollection)(self, 1, math.max(1, amount))
	end
end
