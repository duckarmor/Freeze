--!nonstrict
--[=[
	Returns a flattened dictionary by combining keys of the lowest depth. 

    If provided `depth`, the flattening will early-out.

	```lua
	Dictionary.flatten({
		foo = 1,
		foobar = {
			bar = 2,
			baz = {
				etc = 3,
			},
		},
	})
	-- { foo = 1, bar = 2, etc = 3 }
	```

	@within Dictionary
	@function flatten
	@param depth number?
	@return { [any]: any }
]=]

local function flatten(dictionary: { [any]: any }, depth: number?)
	local new = {}

	for key, value in dictionary do
		if type(value) == "table" and (not depth or depth > 0) then
			local subDictionary = flatten(value, depth and depth - 1)

			for newKey, newValue in pairs(new) do
				subDictionary[newKey] = newValue
			end

			new = subDictionary
		else
			new[key] = value
		end
	end

	return new
end

return function(dictionary: { [any]: any }, depth: number?)
	return table.freeze(flatten(dictionary, depth))
end
