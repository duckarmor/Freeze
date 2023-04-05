--!strict

return function<K, V, V2>(collection: { [K]: V }, mapper: (V, K) -> (V2, K?))
	local new: { [K]: V2 } = {}

	for key, value in collection do
		local mappedValue, mappedKey = mapper(value, key)
		local newKey = if mappedKey == nil then key else mappedKey

		if mappedValue then
			new[newKey] = mappedValue
		end
	end

	return new
end
