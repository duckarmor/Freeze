local updateIn = require(script.Parent.updateIn)
local NOT_SET = require(script.Parent.NOT_SET)

return function(collection, keyPath, value)
	return updateIn(collection, keyPath, function()
		return value
	end, NOT_SET)
end
