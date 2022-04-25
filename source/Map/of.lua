--[=[
	Constructs a new Map object with the given entries.

	```lua
	local myMap = Map.of({ "a", 10 }, { "b", 20 }, { "c", 30 })
	-- Map ( a = 10, b = 20, c = 30 )
	```

	@within Map
	@function of
	@param values ...{ Key: Value}
	@return Map
]=]
return function(Map, _isCollection)
	return function<Key, Value>(...: { Key: Value })
		local keyValues = { ... }
		local new = {}

		for i = 1, #keyValues, 2 do
			if i + 1 > #keyValues then
				error("Missing value for key: " .. tostring(keyValues[i]))
			end

			local key = keyValues[i]
			local value = keyValues[i + 1]
			new[key] = value
		end

		return Map.new(new)
	end
end
