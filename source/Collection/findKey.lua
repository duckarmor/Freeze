local findEntry = require(script.Parent.findEntry)

return function(Collection, isCollection)
	return function(self, predicate)
		local entry = findEntry(Collection, isCollection)(self, predicate)
		return entry and entry[1]
	end
end
