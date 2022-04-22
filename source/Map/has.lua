return function(_Map, isCollection)
	return function(self, key)
		self = if isCollection(self) then self.collection else self
		return self[key] ~= nil
	end
end
