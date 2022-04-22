return function(collection, mapper)
	local newCollection = table.clone(collection)
	for key, value in pairs(collection) do
		newCollection[key] = mapper(value, key)
	end
	return newCollection
end
