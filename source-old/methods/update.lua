local update = require(script.Parent.Parent.functional.update)

return function(self, key, updater, notSetValue)
	return update(self, key, updater, notSetValue)
end
