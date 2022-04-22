local None = require(script.Parent.Parent.None)
local isImmutable = require(script.Parent.Parent.predicates.isImmutable)

return function(...)
	local new = {}

	for dictionaryIndex = 1, select("#", ...) do
		local dictionary = select(dictionaryIndex, ...)

		if dictionary ~= nil then
			assert(type(dictionary) == "table", "Expected table")
			dictionary = if isImmutable(dictionary) then dictionary.collection else dictionary

			for key, value in pairs(dictionary) do
				if value == None then
					new[key] = nil
				else
					new[key] = value
				end
			end
		end
	end

	return new
end
