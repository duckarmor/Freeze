return function(List, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		local back = #self + 1

		for i, _ in ipairs(self) do
			new[i] = self[back - i]
		end

		return if wasCollection then List(new) else new
	end
end
