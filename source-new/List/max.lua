--!strict
local max = require(script.Parent.Parent.utils.max)

--[=[
	Returns the maximum value in this list.
	If any values are comparatively equivalent, the first one found will be returned.

	The `comparator` is used in the same way as `table.sort`. If it is not provided, the default comparator is `>`.

	```lua
	List.max({ 10, 200, 30 })
	-- 200

	List.max({ child, teen, adult }, function(personA, personB)
		return personA.age > personB.age
	end)
	-- adult
	```

	@within List
	@function max
	@param comparator ((Value, Value) -> (boolean))?
	@return (Value, number?)
]=]

return function<Value>(list: { Value }, comparator: ((Value, Value) -> boolean)?): (Value, number?)
	return max(list, comparator)
end
