--!strict
local set = require(script.Parent.Parent.utils.set)
--[=[
	Returns a new dictionary which excludes the given `key`s.

	```lua
	Dictionary.remove({ a = 10, b = 20, c = 30 }).remove("c")
	-- { a = 10, b = 20 }

    Dictionary.remove({ a = 10, b = 20, c = 30 }).remove("b", "c")
	-- { a = 10 }
	```

	@within Dictionary
	@function remove
	@param key Key
	@return { [Key]: Value }
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, ...: Key)
	local new = dictionary
	for _, key in { ... } do
		new = set(new, key, nil)
	end
	return new
end
