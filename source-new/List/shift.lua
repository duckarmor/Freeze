--!strict
--[=[
	Returns a new list excluding the first index in this `list`, shifting all other values to a lower index.
    
    If `amount` is not provided, it will default to 1.
    Passing an `amount` greater than the length of the given `list` will result in an empty collection.

	```lua
	List.shift({ "a", "b", "c" })
	-- { "b", "c" }
	```

	@within List
	@function shift
	@return { Value }
]=]

return function<Value>(list: { Value }, amount: number?)
	local len = #list

	local numPlaces = math.min(len, amount or 1)

	local new = table.create(len - numPlaces)

	for i = 1 + numPlaces, len do
		new[i - numPlaces] = list[i]
	end

	return new
end
