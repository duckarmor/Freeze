return function(List, isCollection)
	return function(self, predicate)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = table.create(#self)

		for i, v in ipairs(self) do
			if predicate(v, i) then
				table.insert(new, v)
			end
		end

		return if wasCollection then List(new) else new
	end
end
