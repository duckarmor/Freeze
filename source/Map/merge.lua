local merge = require(script.Parent.Parent.functional.merge)

return function(Map, isCollection)
	return function(...)
		local new = merge(...)

		return if isCollection(select(1, ...)) then Map(new) else new
	end
end
