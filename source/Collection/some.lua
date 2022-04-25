return function(_Collection, isCollection)
	return function<Key, Value>(self, predicate: (Value, Key) -> (boolean))
		self = if isCollection(self) then self.collection else self

		for i, v in pairs(self) do
			if predicate(v, i) == true then
				return true
			end
		end

		return false
	end
end
