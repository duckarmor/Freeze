return function(List, isCollection)
	return function(self, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local newCollection = table.clone(self)
		for _, value in ipairs({ ... }) do
			table.insert(newCollection, value)
		end

		return if wasCollection then List(newCollection) else newCollection
	end
end
