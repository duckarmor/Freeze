local keyOf = require(script.Parent.Parent.Collection.keyOf)

return function(List, isCollection)
	return function(self, searchValue)
		local key = keyOf(List, isCollection)(self, searchValue)
		return if key == nil then nil else key
	end
end
