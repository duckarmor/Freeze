local hasIn = require(script.Parent.Parent.methods.hasIn)

return function(_Collection, isCollection)
	return function(self, keyPath)
		self = if isCollection(self) then self.collection else self
		return hasIn(self, keyPath)
	end
end
