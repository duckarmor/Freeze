local defaultComparator = function(a, b)
	return a > b
end

return function(_Collection, isCollection)
	return function(self, comparator)
		comparator = comparator or defaultComparator
		self = if isCollection(self) then self.collection else self

		local highestValue = nil
		for _key, value in pairs(self) do
			if highestValue == nil or comparator(highestValue, value) == false then
				highestValue = value
			end
		end

		return highestValue
	end
end
