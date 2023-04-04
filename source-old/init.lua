--!strict
local List = require(script.List)
local Dictionary = require(script.Dictionary)
local None = require(script.None)

type Freeze = {
	List: List.type,
	Dictionary: Dictionary.type,
	Dictionary: Dictionary.type,
	None: None.type,
}

--[=[
	@class Freeze

	An immutable data structure library for Roblox Luau.
]=]

local Freeze: Freeze = {
	List = List,
	Dictionary = Dictionary,
	Dictionary = Dictionary,
	None = None,
}

return Freeze
