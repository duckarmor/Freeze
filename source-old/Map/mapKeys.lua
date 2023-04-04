--[=[
	Returns a new Dictionary with keys and values passed through a `mapper` function.

	Returning a second value in the mapper function will reassign the index.

	If `mapper` returns nil, the entry will be filtered.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).map(function(key)
		return string.upper(key)
	end)
	-- Dictionary( A = 1, B = 2, C = 3 )
	```

	@within Dictionary
	@function mapKeys
	@param mapper (Key, Value) -> (Key?)
	@return Dictionary
]=]

return function(Dictionary, isCollection)
	return function(self, mapper)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		for key, value in pairs(self) do
			newCollection[key] = nil
			newCollection[mapper(key, value)] = value
		end

		return if wasCollection then Dictionary(newCollection) else newCollection
	end
end
