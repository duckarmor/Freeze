--!strict
local equals = require(script.Parent.Parent.utils.equals)

--[=[
	Returns true if both dictionaries have _value_ equality.
	
	:::info
	
	If you only require reference equal, use the `==` operator.

	:::

	```lua
	local dictionary1 = { a = 1, b = 2, c = 3 }
	local dictionary2 = { a = 1, b = 2, c = 3 }

	Dictionary.equals(dictionary1, dictionary2)
	-- true
	```

	@within Dictionary
	@function equals
]=]

return function<Key, Value>(dictionaryA: { [Key]: Value }, dictionaryB: any): boolean
	return equals(dictionaryA, dictionaryB)
end
