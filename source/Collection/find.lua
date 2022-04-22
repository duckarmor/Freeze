return function(_Collection, isCollection)
	return function(self, predicate, notSetValue)
		self = if isCollection(self) then self.collection else self

		for k, v in pairs(self) do
			if predicate(v, k) == true then
				return v
			end
		end

		return notSetValue
	end
end
