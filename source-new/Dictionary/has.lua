--!strict
--[=[
	Returns true if the key exists within the Map.

	```lua
	Map.has({ a = 1, b = 2, c = 3 }, "b")
	-- true
	```

	@within Map
	@function has
	@param key Key
	@return boolean
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, key: Key): boolean
	return dictionary[key] ~= nil
end
