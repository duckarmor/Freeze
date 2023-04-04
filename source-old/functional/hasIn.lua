local getIn = require(script.Parent.getIn)
local NOT_SET = require(script.Parent.NOT_SET)

return function(collection, keyPath)
	return getIn(collection, keyPath, NOT_SET) ~= NOT_SET
end
