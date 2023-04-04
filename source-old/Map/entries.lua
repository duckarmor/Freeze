-- TODO: Refactor as iterator
return function(Dictionary, isCollection)
	return function(self)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for key, value in pairs(self) do
			table.insert(new, { key, value })
		end

		return if wasCollection then Dictionary(new) else new
	end
end
