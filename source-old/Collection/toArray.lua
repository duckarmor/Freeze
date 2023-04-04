local isCollection = require(script.Parent.Parent.predicates.isCollection)

return function(self)
	self = if isCollection(self) then self.collection else self

	local array = table.create(#self)
	local i = 1
	for _, v in pairs(self) do
		array[i] = v
		i += 1
	end
	return table.freeze(array)
end
