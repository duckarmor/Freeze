--!strict
--[=[
	Returns the value at the given index, otherwise returns `notSetValue` if the given value is not found.

	If `index` is negative, the index will start from the last value.

	```lua
	List.get({ "a", "b", "c" }, 3)
	-- "c"

	List.get({ "a", "b", "c" }, -1)
	-- "c"

	List.get({ "a", "b", "c" }, 100, "default")
	-- "default"
	```

	@within List
	@param list { Value }
	@param index number
	@param notSetValue Value
	@return Value?
]=]

return function<Value>(list: { Value }, index: number, notSetValue: Value?)
	if type(index) == "number" and index < 0 then
		index = #list + (index + 1)
	end

	local value = list[index]
	return if value then value else notSetValue
end
