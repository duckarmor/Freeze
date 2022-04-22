local map = require(script.Parent.Parent.functional.map)

return function(Collection, isCollection)
	return function(self, ...)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = map(self, ...)

		return if wasCollection then Collection(new) else new
	end
end
