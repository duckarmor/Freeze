--[=[
	Returns a new list having removed the first entry with the given `value`.

	```lua
	List.new({ "a", "b", "c" }).removeValue("a")
	-- List( "b", "c" )
	```

	@within List
	@function removeValue
	@param value Value
	@return List
]=]

return function(List, isCollection)
	return function<Key, Value>(self, value: Value)
		local wasCollection = isCollection(self)
		self = if wasCollection then self.collection else self

		local new = {}

		for _, v in ipairs(self) do
			if v ~= value then
				table.insert(new, v)
			end
		end

		return if wasCollection then List(new) else new
	end
end
