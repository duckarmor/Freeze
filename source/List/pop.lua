return function(List, isCollection)
	return function(self, numPops: number)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self
		numPops = numPops or 1

		local list = self
		local len = #list

		local new = {}

		for i = 1, len - numPops do
			new[i] = list[i]
		end

		return if wasCollection then List(new) else new
	end
end
