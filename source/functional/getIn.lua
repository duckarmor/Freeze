local NOT_SET = require(script.Parent.NOT_SET)
local get = require(script.Parent.get)

return function(collection, keyPath, notSetValue)
	local i = 0
	while i ~= #keyPath do
		i += 1
		collection = get(collection, keyPath[i], NOT_SET)
		if collection == NOT_SET then
			return notSetValue
		end
	end

	return collection
end
