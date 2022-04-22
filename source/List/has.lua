return function(_List, isCollection)
	return function(self, index: number): boolean
		self = if isCollection(self) then self.collection else self

		return self[index] ~= nil
	end
end
