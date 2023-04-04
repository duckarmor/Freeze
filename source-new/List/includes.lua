--!strict
local includes = require(script.Parent.Parent.utils.includes)
--[=[
	Returns true if the value is found within the List.

	```lua
	List.includes({ "a", "b", "c" }, "b")
	-- true
	```

	@within List
	@function includes
	@param query Value
	@return boolean
]=]

return function<Value>(list: { Value }, query: Value)
	return includes(list, query)
end
