--[=[
	Constructs a new Dictionary object with the given entries.

	```lua
	local myMap = Dictionary.of({ "a", 10 }, { "b", 20 }, { "c", 30 })
	-- Dictionary ( a = 10, b = 20, c = 30 )
	```

	@within Dictionary
	@function of
	@param values ...{ Key: Value}
	@return Dictionary
]=]
return function(Dictionary, _isCollection)
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

		return Dictionary.new(new)
	end
end
