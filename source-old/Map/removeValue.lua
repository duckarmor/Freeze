--[=[
	Returns a new map having removed the first entry with the given `value`.

	```lua
	Dictionary.new({ a = 10, b = 20, c = 30 }).removeValue(10)
	-- Dictionary( b = 20, c = 30 )
	```

	@within Dictionary
	@function removeValue
	@param value Value
	@return Dictionary
]=]

return function(Dictionary, isCollection)
	return function<Key, Value>(self, value: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for k, v in pairs(self) do
			if v ~= value then
				new[k] = v
			end
		end

		return if wasCollection then Dictionary(new) else new
	end
end
