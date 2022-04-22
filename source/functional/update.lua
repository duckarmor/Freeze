local updateIn = require(script.Parent.updateIn)

return function(collection, key, updater, notSetValue)
	return updateIn(collection, { key }, updater, notSetValue)
end
