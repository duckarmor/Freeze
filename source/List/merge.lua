local merge = require(script.Parent.Parent.functional.merge)

return function(List, isCollection)
	return function(...)
		local new = merge(...)

		return if isCollection(select(1, ...)) then List(new) else new
	end
end
