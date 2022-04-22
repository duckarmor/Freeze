return function(List, isCollection)
	return function(self, value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for _, v in ipairs(self) do
			if v ~= value then
				table.insert(new, v)
			end
		end

		return if wasCollection then List(new) else new
	end
end
