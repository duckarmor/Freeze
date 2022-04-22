local get = require(script.Parent.get)

return function(List, isCollection)
	return function(self, notSetValue: any): any?
		return get(List, isCollection)(self, 1, notSetValue)
	end
end
