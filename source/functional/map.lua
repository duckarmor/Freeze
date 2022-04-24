return function(collection, mapper)
	local newCollection = table.clone(collection)
	for key, value in pairs(collection) do
		local newValue, newKey = mapper(value, key)
		newKey = newKey or key

		newCollection[key] = nil
		newCollection[newKey] = newValue
	end
	return newCollection
end
