return function(List, isCollection)
	return function(self, index: number, value: any)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		newCollection[index] = value
		return if wasCollection then List.new(newCollection) else newCollection
	end
end
