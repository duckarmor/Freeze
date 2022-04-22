return function(Map, isCollection)
	return function(self, value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for k, v in pairs(self) do
			if v ~= value then
				new[k] = v
			end
		end

		return if wasCollection then Map(new) else new
	end
end
