return function(_Collection, isCollection)
	return function(self, reducer, reduction, useFirst, reverse)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local back = #self + 1

		for i, v in ipairs(self) do
			v = if reverse then self[back - i] else v

			if useFirst then
				useFirst = false
				reduction = v
			else
				reduction = reducer(reduction, v, i)
			end
		end

		return reduction
	end
end
