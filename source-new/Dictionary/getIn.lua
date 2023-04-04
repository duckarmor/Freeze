--!strict
local getIn = require(script.Parent.Parent.utils.getIn)
--[=[
	Returns the value if found by following a path of keys, otherwise returns `notSetValue` if the given value is nil.

	```lua
    local dictionary = { a = { b = "c" } }
	Dictionary.getIn(dictionary), { "a", "b" })
	-- "c"
	```

	@within Dictionary
	@function getIn
	@param keyPath { any }
	@param notSetValue Value
	@return Value?
]=]

return function<Value>(dictionary, keyPath: { any }, notSetValue: Value?): Value?
	return getIn(dictionary, keyPath, notSetValue)
end
