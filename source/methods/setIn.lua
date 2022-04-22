local setIn = require(script.Parent.Parent.functional.setIn)

return function(self, keyPath, value)
	return setIn(self, keyPath, value)
end
