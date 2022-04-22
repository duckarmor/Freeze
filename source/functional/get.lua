local isImmutable = require(script.Parent.Parent.predicates.isImmutable)
local has = require(script.Parent.has)

return function(collection, key, notSetValue)
	return if isImmutable(collection)
		then collection.get(key, notSetValue)
		elseif not has(collection, key) then notSetValue
		elseif typeof(collection.get) == "function" then collection.get(key)
		else collection[key]
end
