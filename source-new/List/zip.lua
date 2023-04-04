--!strict
--[=[
	Returns a new list with all lists given "zipped" together.
	The length of the new list is the length of the shortest provided list.

	```lua
	List.zip({ "a", "b", "c" }, { "x", "y", "z" })
	-- { { "a", "x" }, { "b", "y" }, { "c", "z" } }

	List.zip({ alice, bertram, charlie }, { alexander, betty, candice, dennis })
	-- { { alice, alexander }, { bertram, betty }, { charlie, candice } }
    -- Note: dennis is omitted and not paired.
	```

	@within List
	@function zip
	@param lists ...{ Value }
	@return { { Value } }
]=]

return function<Value>(...: { Value }): { { Value } }
	local firstList = select(1, ...)

	local new = {}
	local argCount = select("#", ...)

	if argCount <= 0 then
		return new
	end

	local minLen = #firstList

	for i = 2, argCount do
		local list = select(i, ...)

		local len = #list

		if len < minLen then
			minLen = len
		end
	end

	for i = 1, minLen do
		new[i] = {}

		for j = 1, argCount do
			local list = select(j, ...)

			new[i][j] = list[i]
		end
	end

	return new
end
