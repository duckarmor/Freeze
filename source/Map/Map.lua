--[=[
	@class Map

	Handles dictionary-like operations.
]=]

local isCollection = require(script.Parent.Parent.predicates.isCollection)
local IS_COLLECTION_SYMBOL = require(script.Parent.Parent.predicates.CollectionSymbol)
local toString = require(script.Parent.Parent.Collection.toString)

local bindSelf = require(script.Parent.Parent.bindSelf)

local Map = {}
Map.__index = function(self, key)
	if Map[key] and type(Map[key]) == "function" then
		if key == "new" then
			return Map[key]
		else
			return bindSelf(self, Map[key])
		end
	end

	error(string.format("%q is not a member of Map.", key), 2)
	return nil
end

Map.__tostring = function(self)
	return toString(self, "Map(", ")")
end

--[=[
	Constructs a new Map object with the given table.

	Has a callable shorthand variant:

	```lua
	local myMap1 = Map.new({ a = 1, b = 2, c = 3 })
	local myMap2 = Map({ a = 1, b = 2, c = 3 })
	```

	@within Map
	@param collection { any }?
	@return Map
	@error "Map: Expected table" -- Raised when given an invalid argument for collection. Make sure you only provide tables or nil.
]=]
function Map.new(collection: { [any]: any }?)
	assert(collection == nil or type(collection) == "table", "Map: Expected table")
	collection = collection or {}

	local self = {}
	self[IS_COLLECTION_SYMBOL] = true
	self.collection = table.clone(collection)

	return setmetatable(self, Map)
end

Map.of = require(script.Parent.of)(Map, isCollection)
Map.emptyMap = require(script.Parent.emptyMap)(Map, isCollection)
--[=[
	Returns a show Luau table representation of the List.

	```lua
	Map({ a = 1, b = 2, c = 3 }).toLuau()
	-- { 1, 2, 3 }
	```

	@within Map
	@function toLuau
	@return { Key: Value }
]=]
Map.toLuau = require(script.Parent.Parent.Collection.toLuau)
--[=[
	Returns a shallow Luau table representation of the Map, coercing it to an array.

	```lua
	Map({ a = 1, b = 2, c= 3 }).toArray()
	-- { }
	```

	@within Map
	@function toArray
	@return { Value }
]=]
Map.toArray = require(script.Parent.Parent.Collection.toArray)

-- persistent changes
Map.set = require(script.Parent.set)(Map, isCollection)
Map.remove = require(script.Parent:FindFirstChild("remove"))(Map, isCollection)
Map.removeKey = Map.remove
Map.removeValue = require(script.Parent.removeValue)(Map, isCollection)

Map.merge = require(script.Parent.merge)(Map, isCollection)
Map.concat = Map.merge
Map.join = Map.merge

Map.map = require(script.Parent.mapFn)(Map, isCollection)
Map.mapKeys = require(script.Parent.mapKeys)(Map, isCollection)

Map.get = require(script.Parent.get)(Map, isCollection)

Map.count = require(script.Parent.count)(Map, isCollection)

Map.has = require(script.Parent.has)(Map, isCollection)

Map.filter = require(script.Parent.filter)(Map, isCollection)
Map.filterNot = require(script.Parent.filterNot)(Map, isCollection)

Map.flip = require(script.Parent.flip)(Map, isCollection)

Map.keys = require(script.Parent.keys)(Map, isCollection)

Map.toList = require(script.Parent.toList)(Map, isCollection)

Map.joinAsString = require(script.Parent.joinAsString)(Map, isCollection)

Map.deleteAll = require(script.Parent.deleteAll)(Map, isCollection)
Map.removeAll = Map.deleteAll
Map.removeKeys = Map.deleteAll

Map.mergeIn = require(script.Parent.mergeIn)(Map, isCollection)
Map.equals = require(script.Parent.equals)(Map, isCollection)
Map.forEach = require(script.Parent.forEach)(Map, isCollection)
Map.includes = require(script.Parent.includes)(Map, isCollection)
Map.isEmpty = require(script.Parent.isEmpty)(Map, isCollection)
Map.every = require(script.Parent.every)(Map, isCollection)
Map.some = require(script.Parent.some)(Map, isCollection)

Map.find = require(script.Parent.find)(Map, isCollection)
Map.findEntry = require(script.Parent.findEntry)(Map, isCollection)
Map.findKey = require(script.Parent.findKey)(Map, isCollection)

Map.max = require(script.Parent.max)(Map, isCollection)
Map.min = require(script.Parent.min)(Map, isCollection)

Map.update = require(script.Parent.update)(Map, isCollection)
Map.setIn = require(script.Parent.setIn)(Map, isCollection)
Map.updateIn = require(script.Parent.updateIn)(Map, isCollection)
Map.removeIn = require(script.Parent.removeIn)(Map, isCollection)
Map.getIn = require(script.Parent.getIn)(Map, isCollection)
Map.hasIn = require(script.Parent.hasIn)(Map, isCollection)
Map.values = require(script.Parent.values)(Map, isCollection)
Map.entries = require(script.Parent.entries)(Map, isCollection)
Map.mapEntries = require(script.Parent.mapEntries)(Map, isCollection)
Map.flatten = require(script.Parent.flatten)(Map, isCollection)

local mt = {}
mt.__call = function(_self, ...)
	return Map.new(...)
end

return setmetatable(Map, mt)
