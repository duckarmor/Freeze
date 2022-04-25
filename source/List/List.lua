--[=[
	@class List

	Handles array-like operations.
]=]

local source = script.Parent.Parent

local toLuau = require(script.Parent.Parent.Collection.toLuau)
local toArray = require(script.Parent.Parent.Collection.toArray)

local of = require(script.Parent.of)
local get = require(script.Parent.get)
local first = require(script.Parent.first)
local last = require(script.Parent.last)
local has = require(script.Parent.has)
local indexOf = require(script.Parent.indexOf)
local findIndex = require(script.Parent.findIndex)
local set = require(script.Parent.set)
local remove = require(script.Parent:FindFirstChild("remove"))
local update = require(script.Parent.update)
local push = require(script.Parent.push)
local pop = require(script.Parent.pop)
local map = require(script.Parent.map)
local reverse = require(script.Parent.reverse)
local shift = require(script.Parent.shift)
local unshift = require(script.Parent.unshift)
local filter = require(script.Parent.filter)
local filterNot = require(script.Parent.filterNot)
local reduce = require(script.Parent.reduce)
local reduceRight = require(script.Parent.reduceRight)
local getIn = require(script.Parent.getIn)
local hasIn = require(script.Parent.hasIn)
local setIn = require(script.Parent.setIn)
local updateIn = require(script.Parent.updateIn)
local slice = require(script.Parent.slice)
local rest = require(script.Parent.rest)
local butLast = require(script.Parent.butLast)
local take = require(script.Parent.take)
local takeLast = require(script.Parent.takeLast)
local skip = require(script.Parent.skip)
local insert = require(script.Parent.insert)
local concat = require(script.Parent.concat)
local count = require(script.Parent.count)

local toString = require(script.Parent.Parent.Collection.toString)

local isCollection = require(source.predicates.isCollection)
local IS_COLLECTION_SYMBOL = require(source.predicates.CollectionSymbol)

local bindSelf = require(source.bindSelf)

local List = {}
List.__index = function(self, key)
	if List[key] and type(List[key]) == "function" then
		if key == "new" then
			return List[key]
		else
			return bindSelf(self, List[key])
		end
	end

	error(string.format("%q is not a member of List.", key), 2)
	return nil
end

List.__tostring = function(self)
	return toString(self, "List(", ")")
end

--[=[
	Constructs a new List object with the given table.

	Has a callable shorthand variant:

	```lua
	local myList1 = List.new({ 1, 2, 3 })
	local myList2 = List({ 1, 2, 3 })
	```

	@within List
	@param collection { any }?
	@return List
	@error "List: Expected table" -- Raised when given an invalid argument for collection. Make sure you only provide tables or nil.
]=]
function List.new(collection: { any }?)
	assert(collection == nil or type(collection) == "table", "List: Expected table")
	collection = collection or {}

	local self = {}
	self[IS_COLLECTION_SYMBOL] = true
	self.collection = table.clone(collection or {})

	return setmetatable(self, List)
end

List.of = of(List, isCollection)
List.toLuau = toLuau
List.toArray = toArray

-- getters
List.get = get(List, isCollection)
List.first = first(List, isCollection)
List.last = last(List, isCollection)
List.has = has(List, isCollection)

-- search
List.indexOf = indexOf(List, isCollection)
List.findIndex = findIndex(List, isCollection)

-- setters
List.set = set(List, isCollection)
List.remove = remove(List, isCollection)
List.removeIndex = List.remove
List.removeValue = require(script.Parent.removeValue)(List, isCollection)

List.update = update(List, isCollection)

List.push = push(List, isCollection)
List.append = List.push

List.pop = pop(List, isCollection)
List.map = map(List, isCollection)
List.reverse = reverse(List, isCollection)
List.shift = shift(List, isCollection)
List.unshift = unshift(List, isCollection)
List.filter = filter(List, isCollection)
List.filterNot = filterNot(List, isCollection)

-- reduce
List.reduce = reduce(List, isCollection)
List.reduceRight = reduceRight(List, isCollection)
List.joinAsString = require(script.Parent.joinAsString)(List, isCollection)

-- getters in
List.getIn = getIn(List, isCollection)
List.hasIn = hasIn(List, isCollection)

-- setters in
List.setIn = setIn(List, isCollection)
List.updateIn = updateIn(List, isCollection)

-- subsets
List.slice = slice(List, isCollection)
List.rest = rest(List, isCollection)
List.butLast = butLast(List, isCollection)
List.take = take(List, isCollection)
List.takeLast = takeLast(List, isCollection)
List.skip = skip(List, isCollection)

-- additions
List.insert = insert(List, isCollection)
List.concat = concat(List, isCollection)

-- other
List.count = count(List, isCollection)

List.merge = require(script.Parent.merge)(List, isCollection)
List.join = List.merge
List.mergeIn = require(script.Parent.mergeIn)(List, isCollection)
List.equals = require(script.Parent.equals)(List, isCollection)

List.toMap = require(script.Parent.toMap)(List, isCollection)
List.forEach = require(script.Parent.forEach)(List, isCollection)
List.includes = require(script.Parent.includes)(List, isCollection)
List.sort = require(script.Parent.sort)(List, isCollection)
List.zip = require(script.Parent.zip)(List, isCollection)
List.isEmpty = require(script.Parent.isEmpty)(List, isCollection)
List.every = require(script.Parent.every)(List, isCollection)
List.some = require(script.Parent.some)(List, isCollection)

List.find = require(script.Parent.find)(List, isCollection)
List.findEntry = require(script.Parent.findEntry)(List, isCollection)
List.findKey = require(script.Parent.findKey)(List, isCollection)

List.max = require(script.Parent.max)(List, isCollection)
List.min = require(script.Parent.min)(List, isCollection)

List.removeIn = require(script.Parent.removeIn)(List, isCollection)
List.flatten = require(script.Parent.flatten)(List, isCollection)

local mt = {}
mt.__call = function(_self, ...)
	return List.new(...)
end

return setmetatable(List, mt)
