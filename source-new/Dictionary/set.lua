--!strict
local set = require(script.Parent.Parent.utils.set)
--[=[
	Returns a dictionary which includes `value` at `key`.
	If `key` already exists, it will be replaced.

	```lua
	Dictionary.set({ a = 10, b = 20, c = 30 }, "a", 100)
	-- Dictionary{ a = 100, b = 20, c = 30 }
	```

	@within Dictionary
	@function set
	@param key Key
	@param value Value
	@return { [Key]: Value }
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, key: Key, value: Value)
	if key == nil then
		return dictionary
	end

	return table.freeze(set(dictionary, key, value))
end
