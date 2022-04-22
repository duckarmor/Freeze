return function(Map, isCollection)
	return function(self, mapper)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		local index = 0
		for key, value in pairs(self) do
			index += 1
			newCollection[key] = nil

			local newEntry = mapper({ key, value }, index)
			newCollection[newEntry[1]] = newEntry[2]
		end

		return if wasCollection then Map(newCollection) else newCollection
	end
end
