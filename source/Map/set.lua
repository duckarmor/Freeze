return function(Map, isCollection)
	return function(self, key, value)
		if key == nil then
			return self
		end

		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		newCollection[key] = value

		return if wasCollection then Map(newCollection) else newCollection
	end
end
