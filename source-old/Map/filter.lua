--[=[
	Returns a new Map of only entries for which the `predicate` function returns true.

	```lua
	Map.new({ a = 1, b = 2, c = 3, d = 4 }).filter(function(value, key)
		return value % 2 == 0
	end)
	-- Map( b = 2, d = 4 )
	```

	@within Map
	@function filter
	@param predicate (Value, Key) -> (boolean)
	@return Map
]=]
return function(Map, isCollection)
	return function(self, predicate)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for k, v in pairs(self) do
			if predicate(v, k) then
				new[k] = v
			end
		end

		return if wasCollection then Map(new) else new
	end
end
