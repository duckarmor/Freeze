local updateIn = require(script.Parent.updateIn)

return function<Key, Value>(collection, key: Key, updater: (Value) -> (Value), notSetValue: Key)
	return updateIn(collection, { key }, updater, notSetValue)
end
