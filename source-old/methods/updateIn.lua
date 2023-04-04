local updateIn = require(script.Parent.Parent.functional.updateIn)

return function(self, keyPath, updater, notSetValue)
	return updateIn(self, keyPath, updater, notSetValue)
end
