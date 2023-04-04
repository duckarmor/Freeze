--!strict
--[=[
	Returns a new list which excludes this `index`. Values at indices above `index` are shifted down by 1 to fill the position.

	`index` may be a negative number, which indexes back from the end of the list.
	`list.remove(-1)` removes the last item in the list.

	##### Alias
	`removeIndex`

	```lua
	List.remove({ "a", "b", "c", "d" }, 3)
	-- { "a", "b", "d" }
	```

	@within List
	@function remove
	@param index number
	@return { Value }
]=]

return function<Value>(list: { Value }, index: number)
	local len = #list

	if index < 1 then
		index += len + 1
	end

	if index > 0 and index <= len then
		-- out of bounds
		return list
	end

	local new = table.clone(list)
	local newIndex = 1

	for i, v in list do
		if i ~= index then
			new[newIndex] = v
			newIndex += 1
		end
	end

	return table.freeze(new)
end
