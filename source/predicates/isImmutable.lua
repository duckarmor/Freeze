local isCollection = require(script.Parent.isCollection)

return function(maybeImmutable)
	return isCollection(maybeImmutable)
end
