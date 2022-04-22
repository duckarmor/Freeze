local updateIn = require(script.Parent.updateIn)
local merge = require(script.Parent.merge)

return function(self, keyPath, ...)
	local args = { ... }
	return updateIn(self, keyPath, function(m)
		return merge(m, table.unpack(args))
	end, {})
end
