local update = require(script.Parent.Parent.functional.update)

return function(Collection, isCollection)
	return function(self, key, updater, notSetValue)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = update(self, key, updater, notSetValue)

		return if wasCollection then Collection(new) else new
	end
end
