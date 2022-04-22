return function(Map, _isCollection)
	return function(...)
		local keyValues = { ... }
		local new = {}

		for i = 1, #keyValues, 2 do
			if i + 1 > #keyValues then
				error("Missing value for key: " .. keyValues[i])
			end

			local key = keyValues[i]
			local value = keyValues[i + 1]
			new[key] = value
		end

		return Map.new(new)
	end
end
