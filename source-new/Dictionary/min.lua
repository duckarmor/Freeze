--!strict
local min = require(script.Parent.Parent.utils.min)
--[=[
	Returns the minium value and key in this dictionary.
	If any values are comparatively equivalent, the first one found will be returned. (Order is undefined.)

	The `comparator` is used in the same way as `table.sort`. If it is not provided, the default comparator is `>`.

	```lua
	Dictionary.min({ a = 10, b = 200, c = 30 })
	-- (10, "a")

	Dictionary.min({ alice = child, bertram = teen, charlie = adult }, function(personA, personB)
		return personA.age > personB.age
	end)
	-- (child, "alice")
	```

	@within Map
	@function min
	@param comparator ((Value, Value) -> (boolean))?
	@return (Value?, Key?)
]=]

return function<Key, Value>(dictionary: { [Key]: Value }, comparator: ((Value, Value) -> boolean)?): (Value, Key?)
	return min(dictionary, comparator)
end
