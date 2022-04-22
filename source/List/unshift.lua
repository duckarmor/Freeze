return function(List, isCollection)
	return function(self, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local argCount = select("#", ...)

		local new = table.clone(self)

		for i = argCount, 1, -1 do
			local v = select(i, ...)
			table.insert(new, 1, v)
		end

		return if wasCollection then List(new) else new
	end
end
