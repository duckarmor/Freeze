local mergeIn = require(script.Parent.Parent.functional.mergeIn)

return function(Map, isCollection)
	return function(self, keyPath, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = mergeIn(self, keyPath, ...)

		return if wasCollection then Map(new) else new
	end
end
