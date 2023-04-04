local findKey = require(script.Parent.findKey)
local is = require(script.Parent.Parent.is)

return function(List, isCollection)
	return function(self, searchValue)
		return findKey(List, isCollection)(self, function(value)
			return is(value, searchValue)
		end)
	end
end
