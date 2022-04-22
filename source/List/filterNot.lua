local filter = require(script.Parent.filter)

return function(List, isCollection)
	return function(self, predicate)
		return filter(List, isCollection)(self, function(...)
			return not predicate(...)
		end)
	end
end
