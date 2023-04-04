--[=[
	Returns true if the key exists within the Dictionary.

	```lua
	Dictionary.new({ a = 1, b = 2, c = 3 }).has("b")
	-- true
	```

	@within Dictionary
	@function has
	@param key Key
	@return boolean
]=]

return function(_Map, isCollection)
	return function(self, key)
		self = if isCollection(self) then self.collection else self
		return self[key] ~= nil
	end
end
