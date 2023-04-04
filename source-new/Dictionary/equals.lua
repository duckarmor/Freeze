--!strict
local equals = require(script.Parent.Parent.utils.equals)

--[=[
	Returns true if both collections have value equality.

	```lua
	local map1 = List.new({ a = 1, b = 2, c = 3 })
	local map2 = List.new({ a = 1, b = 2, c = 3 })

	Dictionary.equals(map1, map2)
	-- true
	```

	@within Map
	@function equals
	@param other any
	@return Map
]=]

return function<Key, Value>(dictionaryA: { [Key]: Value }, dictionaryB: any)
	return equals(dictionaryA, dictionaryB)
end
