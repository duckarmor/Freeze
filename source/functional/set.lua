local isImmutable = require(script.Parent.Parent.predicates.isImmutable)
local isDataStructure = require(script.Parent.Parent.utils.isDataStructure)
local shallowCopy = require(script.Parent.Parent.utils.shallowCopy)

return function(collection, key, value)
	if not isDataStructure(collection) then
		error("Cannot update non-data-structure value: " .. tostring(collection))
	end

	if isImmutable(collection) then
		if not collection.set then
			error("Cannot update immutable value without .set() method: " .. tostring(collection))
		end

		return collection.set(key, value)
	end

	if collection[key] == value then
		return collection
	end

	local collectionCopy = shallowCopy(collection)
	collectionCopy[key] = value
	return collectionCopy
end
