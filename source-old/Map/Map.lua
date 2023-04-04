--[=[
	@class Dictionary

	Handles dictionary-like operations.
]=]

local isCollection = require(script.Parent.Parent.predicates.isCollection)
local IS_COLLECTION_SYMBOL = require(script.Parent.Parent.predicates.CollectionSymbol)
local toString = require(script.Parent.Parent.Collection.toString)

local bindSelf = require(script.Parent.Parent.bindSelf)

local Dictionary = {}
Dictionary.__index = function(self, key)
	if Dictionary[key] and type(Dictionary[key]) == "function" then
		if key == "new" then
			return Dictionary[key]
		else
			return bindSelf(self, Dictionary[key])
		end
	end

	error(string.format("%q is not a member of Dictionary.", key), 2)
	return nil
end

Dictionary.__tostring = function(self)
	return toString(self, "Dictionary(", ")")
end

--[=[
	Constructs a new Dictionary object with the given table.

	Has a callable shorthand variant:

	```lua
	local myMap1 = Dictionary.new({ a = 1, b = 2, c = 3 })
	local myMap2 = Dictionary({ a = 1, b = 2, c = 3 })
	```

	@within Dictionary
	@param collection { any }?
	@return Dictionary
	@error "Dictionary: Expected table" -- Raised when given an invalid argument for collection. Make sure you only provide tables or nil.
]=]
function Dictionary.new(collection: { [any]: any }?)
	assert(collection == nil or type(collection) == "table", "Dictionary: Expected table")
	collection = collection or {}

	local self = {}
	self[IS_COLLECTION_SYMBOL] = true
	self.collection = table.clone(collection)

	return setmetatable(self, Dictionary)
end

Dictionary.of = require(script.Parent.of)(Dictionary, isCollection)
Dictionary.emptyMap = require(script.Parent.emptyMap)(Dictionary, isCollection)
--[=[
	Returns a show Luau table representation of the List.

	```lua
	Dictionary({ a = 1, b = 2, c = 3 }).toLuau()
	-- { 1, 2, 3 }
	```

	@within Dictionary
	@function toLuau
	@return { Key: Value }
]=]
Dictionary.toLuau = require(script.Parent.Parent.Collection.toLuau)
--[=[
	Returns a shallow Luau table representation of the Dictionary, coercing it to an array.

	```lua
	Dictionary({ a = 1, b = 2, c= 3 }).toArray()
	-- { }
	```

	@within Dictionary
	@function toArray
	@return { Value }
]=]
Dictionary.toArray = require(script.Parent.Parent.Collection.toArray)

-- persistent changes
Dictionary.set = require(script.Parent.set)(Dictionary, isCollection)
Dictionary.remove = require(script.Parent:FindFirstChild("remove"))(Dictionary, isCollection)
Dictionary.removeKey = Dictionary.remove
Dictionary.removeValue = require(script.Parent.removeValue)(Dictionary, isCollection)

Dictionary.merge = require(script.Parent.merge)(Dictionary, isCollection)
Dictionary.concat = Dictionary.merge
Dictionary.join = Dictionary.merge

Dictionary.map = require(script.Parent.mapFn)(Dictionary, isCollection)
Dictionary.mapKeys = require(script.Parent.mapKeys)(Dictionary, isCollection)

Dictionary.get = require(script.Parent.get)(Dictionary, isCollection)

Dictionary.count = require(script.Parent.count)(Dictionary, isCollection)

Dictionary.has = require(script.Parent.has)(Dictionary, isCollection)

Dictionary.filter = require(script.Parent.filter)(Dictionary, isCollection)
Dictionary.filterNot = require(script.Parent.filterNot)(Dictionary, isCollection)

Dictionary.flip = require(script.Parent.flip)(Dictionary, isCollection)

Dictionary.keys = require(script.Parent.keys)(Dictionary, isCollection)

Dictionary.toList = require(script.Parent.toList)(Dictionary, isCollection)

Dictionary.joinAsString = require(script.Parent.joinAsString)(Dictionary, isCollection)

Dictionary.deleteAll = require(script.Parent.deleteAll)(Dictionary, isCollection)
Dictionary.removeAll = Dictionary.deleteAll
Dictionary.removeKeys = Dictionary.deleteAll

Dictionary.mergeIn = require(script.Parent.mergeIn)(Dictionary, isCollection)
Dictionary.equals = require(script.Parent.equals)(Dictionary, isCollection)
Dictionary.forEach = require(script.Parent.forEach)(Dictionary, isCollection)
Dictionary.includes = require(script.Parent.includes)(Dictionary, isCollection)
Dictionary.isEmpty = require(script.Parent.isEmpty)(Dictionary, isCollection)
Dictionary.every = require(script.Parent.every)(Dictionary, isCollection)
Dictionary.some = require(script.Parent.some)(Dictionary, isCollection)

Dictionary.find = require(script.Parent.find)(Dictionary, isCollection)
Dictionary.findEntry = require(script.Parent.findEntry)(Dictionary, isCollection)
Dictionary.findKey = require(script.Parent.findKey)(Dictionary, isCollection)

Dictionary.max = require(script.Parent.max)(Dictionary, isCollection)
Dictionary.min = require(script.Parent.min)(Dictionary, isCollection)

Dictionary.update = require(script.Parent.update)(Dictionary, isCollection)
Dictionary.setIn = require(script.Parent.setIn)(Dictionary, isCollection)
Dictionary.updateIn = require(script.Parent.updateIn)(Dictionary, isCollection)
Dictionary.removeIn = require(script.Parent.removeIn)(Dictionary, isCollection)
Dictionary.getIn = require(script.Parent.getIn)(Dictionary, isCollection)
Dictionary.hasIn = require(script.Parent.hasIn)(Dictionary, isCollection)
Dictionary.values = require(script.Parent.values)(Dictionary, isCollection)
Dictionary.entries = require(script.Parent.entries)(Dictionary, isCollection)
Dictionary.mapEntries = require(script.Parent.mapEntries)(Dictionary, isCollection)
Dictionary.flatten = require(script.Parent.flatten)(Dictionary, isCollection)

local mt = {}
mt.__call = function(_self, ...)
	return Dictionary.new(...)
end

return setmetatable(Dictionary, mt)
