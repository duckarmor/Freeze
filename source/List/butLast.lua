local slice = require(script.Parent.slice)

return function(List, isCollection)
	return function(self)
		return slice(List, isCollection)(self, 1, -1)
	end
end
