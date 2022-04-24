return function(List, isCollection)
	return function(self, index, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self

		if index < 1 then
			index = len + index
		end

		index = math.clamp(index, 1, len + 1)

		assert(index > 0 and index <= len + 1, string.format("index %d out of bounds of list of length %d", index, len))

		local new = {}
		local resultIndex = 1

		for i = 1, len + 1 do
			if i == index then
				for j = 1, select("#", ...) do
					new[resultIndex] = select(j, ...)
					resultIndex = resultIndex + 1
				end
			end

			new[resultIndex] = self[i]
			resultIndex = resultIndex + 1
		end

		return if wasCollection then List(new) else new
	end
end
