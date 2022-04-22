return function(Map, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for key, value in pairs(self) do
			new[value] = key
		end

		return if wasCollection then Map(new) else new
	end
end
