--!strict
local maybeFreeze = require(script.Parent.Parent.utils.maybeFreeze)
--[=[
	Returns a List which excludes this `index`. Values at indices above `index` are shifted down by 1 to fill the position.

	`index` may be a negative number, which indexes back from the end of the list.
	`list.remove(-1)` removes the last item in the list.

	If the given `given` results in an index that is out of bounds, it will return the original list with no changes.

	```lua
	List.remove({ "a", "b", "c", "d" }, 3)
	-- { "a", "b", "d" }
	```

	@within List
]=]

local function remove<Value>(list: { Value }, index: number): { Value }
	local len = #list

	if index < 1 then
		index += len + 1
	end

	if index <= 0 or index > len then
		-- out of bounds
		return list
	end

	local new = table.create(len - 1)
	local newIndex = 1

	for i, v in list do
		if i ~= index then
			new[newIndex] = v
			newIndex += 1
		end
	end

	return maybeFreeze(new)
end

return remove
