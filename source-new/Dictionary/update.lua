--!strict
local update = require(script.Parent.Parent.utils.update)
--[=[
	Returns a dictionary with the entry at `key` updated to the result of `updater`.

	If the entry does not exist, `updater` will be given `notSetValue` or nil.

	```lua
	Dictionary.update({ a = 10, b = 20, c = 30 }, "a", function(value)
		return value * 100
	end)
	-- { a = 10000, b = 20, c = 30 }

	Dictionary.update({ a = 10, b = 20, c = 30 }, "d", function(value)
		return value * 100
	end, 1)
	-- { a = 10000, b = 20, c = 30, d = 100 }
	```

	@within Dictionary
	@function update
	@param key Key
	@param updater (Value?, Key?) -> (Value)
	@param notSetValue Value?
	@return { [Key]: Value }
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, key: Key, updater, notSetValue: Value?)
	return table.freeze(update(dictionary, key, updater, notSetValue))
end
