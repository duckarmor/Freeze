local hasIn = require(script.Parent.Parent.functional.hasIn)

return function(self, keyPath)
	return hasIn(self, keyPath)
end
