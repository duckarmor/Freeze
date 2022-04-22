local setIn = require(script.Parent.Parent.methods.setIn)

return function(Collection, isCollection)
	return function(self, keyPath)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self
		local new = setIn(self, keyPath, nil)
		return if wasCollection then Collection(new) else new
	end
end
