--!strict
--[=[
	Returns a flattened list in the same index-order as each Value would appear.

	```lua
	List.flatten({
		"foo",
		{
			"bar",
			"baz",
		},
		{
			"bar",
			"baz",
		},
		"quz",
	})
	-- { "foo", "bar", "baz", "bar", "baz", "quz" }
	```

	@within List
	@function flatten
	@param depth number?
	@return List
]=]

type Values<Value> = Value | { Values<Value> }
local function flatten<Value>(list: { Values<Value> }, depth: number?): { Values<Value> }
	local new = {}
	local index = 1

	for _, v in list do
		if type(v) == "table" and (not depth or depth > 0) then
			local subList = flatten(v, depth and depth - 1)

			for j = 1, #subList do
				new[index] = subList[j]
				index = index + 1
			end
		else
			new[index] = v
			index = index + 1
		end
	end

	return new
end

return flatten
