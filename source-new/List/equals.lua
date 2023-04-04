--!strict
local equals = require(script.Parent.Parent.utils.equals)

--[=[
	Returns true if both collections have value equality.

	```lua
	local list1 = { "a", "b", "c" }
	local list2 = { "a", "b", "c" }

	List.equals(list1, list2)
	-- true
	```

	@within List
    @param listA { Value }
	@param listB any
	@return boolean
]=]

return function<Value>(listA: { Value }, listB: any)
	return equals(listA, listB)
end
