--[=[
	Returns a new Dictionary which excludes the provided keys.

	##### Alias
	`removeAll`

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).removeAll({ "a", "c" })
	-- Dictionary( "b" = 2 )
	```

	@within Dictionary
	@function deleteAll
	@param keys ...{ Key }
	@return Dictionary
]=]

local remove = require(script.Parent:FindFirstChild("remove"))

return function(Dictionary, isCollection)
	local removeFn = remove(Dictionary, isCollection)
	return function<Key, Value>(self, keys: { Key })
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local final = self
		for _, key in ipairs(keys) do
			final = removeFn(final, key)
		end

		return if wasCollection then Dictionary(final) else final
	end
end
