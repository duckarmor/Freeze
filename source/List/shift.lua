return function(List, isCollection)
	return function(self, numPlaces)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self

		numPlaces = numPlaces or 1

		assert(
			numPlaces > 0 and numPlaces <= len + 1,
			string.format("index %d out of bounds of list of length %d", numPlaces, len)
		)

		local new = {}

		for i = 1 + numPlaces, len do
			new[i - numPlaces] = self[i]
		end

		return if wasCollection then List(new) else new
	end
end
