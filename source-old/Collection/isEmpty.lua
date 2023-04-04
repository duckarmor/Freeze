return function(_Collection, isCollection)
	return function(self)
		self = if isCollection(self) then self.collection else self

		return next(self) == nil
	end
end
