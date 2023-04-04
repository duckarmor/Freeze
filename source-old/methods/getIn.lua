local getIn = require(script.Parent.Parent.functional.getIn)

return function(self, keyPath, notSetValue)
	return getIn(self, keyPath, notSetValue)
end
