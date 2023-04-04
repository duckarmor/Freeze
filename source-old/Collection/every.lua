return function(_Collection, isCollection)
	return function(self, predicate)
		self = if isCollection(self) then self.collection else self

		for i, v in pairs(self) do
			if predicate(v, i) == false then
				return false
			end
		end

		return true
	end
end
