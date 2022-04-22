return function(Map, isCollection)
	return function(self, mapper)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		for key, value in pairs(self) do
			newCollection[key] = nil
			newCollection[mapper(value, key)] = value
		end

		return if wasCollection then Map(newCollection) else newCollection
	end
end
