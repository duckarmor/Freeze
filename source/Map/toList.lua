local List = require(script.Parent.Parent.List)

return function(_Map, isCollection)
	return function(self)
		self = if isCollection(self) then self.collection else self

		local new = {}

		for _, value in pairs(self) do
			table.insert(new, value)
		end

		return List.new(new)
	end
end
