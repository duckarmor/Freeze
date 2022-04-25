--[=[
	Returns a new Map which excludes the provided keys.

	##### Alias
	`removeAll`

	```lua
	Map.new({ a = 1, b = 2, c = 3 }).removeAll({ "a", "c" })
	-- Map( "b" = 2 )
	```

	@within Map
	@function deleteAll
	@param keys ...{ Key }
	@return Map
]=]

local remove = require(script.Parent:FindFirstChild("remove"))

return function(Map, isCollection)
	local removeFn = remove(Map, isCollection)
	return function<Key, Value>(self, keys: { Key })
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local final = self
		for _, key in ipairs(keys) do
			final = removeFn(final, key)
		end

		return if wasCollection then Map(final) else final
	end
end
