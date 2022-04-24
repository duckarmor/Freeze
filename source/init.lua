--!strict
local List = require(script.List)
local Map = require(script.Map)
local None = require(script.None)

type Freeze = {
	List: List.type,
	Map: Map.type,
	Dictionary: Map.type,
	None: None.type,
}

local Freeze: Freeze = {
	List = List,
	Map = Map,
	Dictionary = Map,
	None = None,
}

return Freeze
