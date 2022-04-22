local remove = require(script.Parent:FindFirstChild("remove"))

return function(Map, isCollection)
	local removeFn = remove(Map, isCollection)
	return function(self, keys)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local final = self
		for _, key in ipairs(keys) do
			final = removeFn(final, key)
		end

		return if wasCollection then Map(final) else final
	end
end
