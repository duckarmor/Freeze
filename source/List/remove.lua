return function(List, isCollection)
	return function(self, index: number)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local len = #self

		if index < 1 then
			index += len
		end

		assert(index > 0 and index <= len, string.format("index %d out of bounds of list of length %d", index, len))

		local new = {}
		local newIndex = 1

		for i, v in ipairs(self) do
			if i ~= index then
				new[newIndex] = v
				newIndex += 1
			end
		end

		return if wasCollection then List(new) else new
	end
end
