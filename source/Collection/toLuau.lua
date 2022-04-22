local isCollection = require(script.Parent.Parent.predicates.isCollection)

return function(self)
	return table.freeze(if isCollection(self) then self.collection else self)
end
