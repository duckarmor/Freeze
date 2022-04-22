return function(_List, isCollection)
	return function(self, predicate)
		self = if isCollection(self) then self.collection else self

		local count = 0

		for index, value in ipairs(self) do
			if predicate == nil or predicate(value, index) then
				count += 1
			end
		end

		return count
	end
end
