return function(_Map, isCollection)
	return function(self, key, notSetValue)
		self = if isCollection(self) then self.collection else self

		local value = self[key]
		return if value then value else notSetValue
	end
end
