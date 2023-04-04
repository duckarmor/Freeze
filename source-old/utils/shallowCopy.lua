local isImmutable = require(script.Parent.Parent.predicates.isImmutable)

return function(from)
	if isImmutable(from) then
		return from.clone()
	else
		return table.clone(from)
	end
end
