local setIn = require(script.Parent.Parent.methods.setIn)

return function(Collection, isCollection)
	return function<Key, Value>(self, keyPath: { any }, value: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self
		local new = setIn(self, keyPath, value)
		return if wasCollection then Collection(new) else new
	end
end
