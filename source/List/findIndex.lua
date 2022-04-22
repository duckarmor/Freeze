local findEntry = require(script.Parent.Parent.Collection.findEntry)

return function(List, isCollection)
	return function(self, predicate)
		local entry = findEntry(List, isCollection)(self, predicate)
		return if entry then entry[1] else nil
	end
end
