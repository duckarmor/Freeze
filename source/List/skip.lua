local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self, amount: number)
		return slice(List, isCollection)(self, math.max(1, amount + 1))
	end
end
