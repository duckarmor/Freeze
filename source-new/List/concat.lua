--!strict

local None = require(script.Parent.Parent.None)

--[=[
	Returns a new List of the same type concatenated to given arguments.

	```lua
	List.concat({ "a", "b", "c" }, { "d", "e", "f" })
	-- { "a", "b", "c", "d", "e", "f" }
	```

	@within List
	@function concat
	@param valuesOrIterables ...{ Value }
	@return { Value }
]=]

return function<Value>(...: { Value }): { Value }
	local new = {}
	local index = 1

	for listIndex = 1, select("#", ...) do
		local list = select(listIndex, ...)

		if list ~= nil then
			if type(list) == "table" and #list > 0 then
				list = list
			else
				continue
			end

			for _, v in ipairs(list) do
				if v ~= None then
					new[index] = v
					index += 1
				end
			end
		end
	end

	return new
end
