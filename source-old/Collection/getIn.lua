local getIn = require(script.Parent.Parent.methods.getIn)

return function(_Collection, isCollection)
	return function(self, keyPath, notSetValue)
		self = if isCollection(self) then self.collection else self
		return getIn(self, keyPath, notSetValue)
	end
end
