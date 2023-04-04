--!strict
--[=[
	Returns true if the key exists within the Dictionary.

	```lua
	Dictionary.has({ a = 1, b = 2, c = 3 }, "b")
	-- true
	```

	@within Dictionary
	@function has
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, key: Key): boolean
	return dictionary[key] ~= nil
end
