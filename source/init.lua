--!strict
local List = require(script.List)
local Map = require(script.Map)
local None = require(script.None)

type Freeze = {
	List: List.type,
	Map: Map.type,
	None: None.type,
}

local Freeze: Freeze = {
	List = List,
	Map = Map,
	None = None,
}

return Freeze
