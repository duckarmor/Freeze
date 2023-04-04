local isImmutable = require(script.Parent.Parent.predicates.isImmutable)
local isDataStructure = require(script.Parent.Parent.utils.isDataStructure)

local slice = require(script.Parent.slice)
local get = require(script.Parent.get)
local remove = require(script.Parent:FindFirstChild("remove"))
local set = require(script.Parent.set)

local NOT_SET = require(script.Parent.NOT_SET)

local function toString(path)
	return table.concat(path, ", ")
end

local function updateInDeeply(inImmutable, existing, keyPath, i, updater, notSetValue)
	--! Hack to prevent recursive require...
	local Dictionary = require(script.Parent.Parent.Dictionary)
	local emptyMap = Dictionary.emptyMap

	local wasNotSet = existing == NOT_SET
	if i == #keyPath + 1 then
		local existingValue = if wasNotSet then notSetValue else existing
		local newValue = updater(existingValue)
		return if newValue == existingValue then existing else newValue
	end

	if not wasNotSet and not isDataStructure(existing) then
		error(
			"Cannot update within non-data-structure value in path ["
				.. toString(slice(keyPath, 1, i - 1))
				.. "]: "
				.. existing
		)
	end

	local key = keyPath[i]
	local nextExisting = if wasNotSet then NOT_SET else get(existing, key, NOT_SET)
	local nextUpdated = updateInDeeply(
		if nextExisting == NOT_SET then inImmutable else isImmutable(nextExisting),
		nextExisting,
		keyPath,
		i + 1,
		updater,
		notSetValue
	)

	return if nextUpdated == nextExisting
		then existing
		elseif nextUpdated == NOT_SET then remove(existing, key)
		else set(if wasNotSet then (if inImmutable then emptyMap() else {}) else existing, key, nextUpdated)
end

return function<Key, Value>(collection, keyPath: { Key }, updater: (Value) -> Value, notSetValue: Value)
	local updatedValue = updateInDeeply(isImmutable(collection), collection, keyPath, 1, updater, notSetValue)

	return if updatedValue == NOT_SET then notSetValue else updatedValue
end
