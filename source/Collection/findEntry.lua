return function(_List, isCollection)
	return function(self, predicate, notSetValue)
		self = if isCollection(self) then self.collection else self

		local found = notSetValue

		for k, v in pairs(self) do
			if predicate(v, k) then
				found = { k, v }
				break
			end
		end

		return found
	end
end
