local filter = require(script.Parent.filter)

return function(Map, isCollection)
	return function(self, predicate)
		return filter(Map, isCollection)(self, function(...)
			return not predicate(...)
		end)
	end
end
