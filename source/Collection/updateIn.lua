local updateIn = require(script.Parent.Parent.methods.updateIn)

return function(Collection, isCollection)
	return function(self, keyPath, updater, notSetValue)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self
		local new = updateIn(self, keyPath, updater, notSetValue)
		return if wasCollection then Collection(new) else new
	end
end
