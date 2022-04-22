local set = require(script.Parent.set)

return function(Map, isCollection)
	return function(self, key)
		return set(Map, isCollection)(self, key, nil)
	end
end
