return function(_Collection, isCollection)
	return function<Key, Value>(self, sideEffect: (Value, Key) -> (boolean)): number
		self = if isCollection(self) then self.collection else self

		local timesCalled = 0
		for k, v in pairs(self) do
			timesCalled += 1
			if sideEffect(v, k) == false then
				continue
			end
		end

		return timesCalled
	end
end
