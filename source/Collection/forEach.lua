return function(_Collection, isCollection)
	return function(self, sideEffect)
		self = if isCollection(self) then self.collection else self

		local timesCalled = 0
		for k, v in pairs(self) do
			timesCalled += 1
			if not sideEffect(v, k) then
				continue
			end
		end

		return timesCalled
	end
end
