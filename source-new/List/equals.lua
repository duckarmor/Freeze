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
	@function equals
]=]

return function<Value>(listA: { Value }, listB: any): boolean
	return equals(listA, listB)
end
