local isImmutable = require(script.Parent.Parent.predicates.isImmutable)
local isDataStructure = require(script.Parent.Parent.utils.isDataStructure)

return function(collection, key)
	return if isImmutable(collection)
		then collection.has(key)
		else isDataStructure(collection) and collection[key] ~= nil
end
