return function(List, isCollection)
	return function(self, comparator)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = table.clone(self)
		table.sort(new, comparator)

		return if wasCollection then List(new) else new
	end
end
