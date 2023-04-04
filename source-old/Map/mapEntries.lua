--[=[
	Returns a new Dictionary with entries ({key, value}) passed through a `mapper` function.

	If `mapper` returns nil, then the entry will be filtered.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).mapEntries(function(entry)
		return { string.upper(entry[1]), entry[2] * 2 }
	end)
	-- Dictionary( A = 2, B = 4, C = 6 )
	```

	@within Dictionary
	@function mapEntries
	@param mapper ({ Value, Key }) -> ({ Value, Key }?)
	@return Dictionary
]=]

return function(Dictionary, isCollection)
	return function(self, mapper)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		local index = 0
		for key, value in pairs(self) do
			index += 1
			newCollection[key] = nil

			local newEntry = mapper({ key, value }, index)
			if newEntry then
				newCollection[newEntry[1]] = newEntry[2]
			end
		end

		return if wasCollection then Dictionary(newCollection) else newCollection
	end
end
