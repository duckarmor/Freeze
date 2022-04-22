return function(_Collection, isCollection)
	return function(self, value)
		self = if isCollection(self) then self.collection else self

		for _, v in pairs(self) do
			if v == value then
				return true
			end
		end

		return false
	end
end
