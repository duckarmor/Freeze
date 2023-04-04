--!strict
--[=[
	Returns a new map where keys and values are flipped.

	```lua
	Dictionary.flip({ a = "x", b = "y", c = "z" )
	-- { x = "a", y = "b", z = "c" }
	```

	@within Map
	@function flip
	@return { [Value]: Key }
]=]

return function<Key, Value>(dictionary: { [Key]: Value })
	local new = {}

	for key, value in dictionary do
		new[value] = key
	end

	return new
end
