return function(List, isCollection)
	return function(self, from: number?, to: number?)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self
		from = if from and from < 0 then len + (from + 1) else from or 1
		to = if to and to < 0 then len + to else to or len

		local new = {}
		local index = 1
		for i = from, to do
			new[index] = self[i]
			index = index + 1
		end

		return if wasCollection then List(new) else new
	end
end
