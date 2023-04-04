local IS_COLLECTION_SYMBOL = require(script.Parent.CollectionSymbol)

return function(maybeCollection)
	return if maybeCollection
			and type(maybeCollection) == "table"
			and maybeCollection[IS_COLLECTION_SYMBOL]
		then true
		else false
end
