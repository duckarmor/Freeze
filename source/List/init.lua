--!strict

--[=[
	@class List
	Handles list-like operations.

	[`Lists`](../api/List) are ordered tables with numeric indices.
]=]

return {
	butLast = require(script.butLast),
	concat = require(script.concat),
	count = require(script.count),
	equals = require(script.equals),
	every = require(script.every),
	filter = require(script.filter),
	filterNot = require(script.filterNot),
	find = require(script.find),
	findIndex = require(script.findIndex),
	findPair = require(script.findPair),
	first = require(script.first),
	flatten = require(script.flatten),
	forEach = require(script.forEach),
	get = require(script.get),
	has = require(script.has),
	includes = require(script.includes),
	indexOf = require(script.indexOf),
	insert = require(script.insert),
	joinAsString = require(script.joinAsString),
	last = require(script.last),
	map = require(script.map),
	max = require(script.max),
	merge = require(script.merge),
	min = require(script.min),
	pop = require(script.pop),
	push = require(script.push),
	reduce = require(script.reduce),
	reduceRight = require(script.reduceRight),
	remove = require(script:FindFirstChild("remove")),
	removeValue = require(script.removeValue),
	rest = require(script.rest),
	reverse = require(script.reverse),
	set = require(script.set),
	shift = require(script.shift),
	skip = require(script.skip),
	slice = require(script.slice),
	some = require(script.some),
	sort = require(script.sort),
	take = require(script.take),
	takeLast = require(script.takeLast),
	unshift = require(script.unshift),
	update = require(script.update),
	zip = require(script.zip),
}