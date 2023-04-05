---
sidebar_position: 5
---

# Examples And Usecases

<div align="center">
🏗️ <b>Under construction</b>
</div>

----

## Rendering a list of React components
```lua
local Freeze = require(Packages.Freeze)
local List = Freeze.List

local people = {
    alice,
    bob,
    candice
}

return React.createElement("Frame", {
    AutomaticSize = Enum.AutomaticSize.XY,
}, List.map(people, function(person)
    return React.createElement(ContactItem, {
        key = person.id,
        name = person.name,
        phone = person.phone,
    })
end))
```

## Updating a shallow Rodux state value
```lua
local Freeze = require(Packages.Freeze)
local Dictionary = Freeze.Dictionary

local DEFAULT_STATE = {
    isLoaded = false,
    isFoo = false,
}

return Rodux.createReducer(DEFAULT_STATE, {
    appLoaded = function(state, _action)
        return Dictionary.set(state, "isLoaded", true)
    end,
})
```

## Updating a deep Rodux state value
```lua
local Freeze = require(Packages.Freeze)
local Dictionary = Freeze.Dictionary

local DEFAULT_STATE = {
    sessionId = 0,
    slots = {
        slot1 = {
            inventory = {}
        }
    }
}

return Rodux.createReducer(DEFAULT_STATE, {
    itemPurchased = function(state, action)
        local itemGuid = action.itemGuid
        local itemModel = action.itemModel

        return Dictionary.setIn(state, {"slots", "slot1", "inventory", itemGuid}, itemModel)
    end,
})
```

## Determining if we assisted in a KO


```lua
local Freeze = require(Packages.Freeze)
local List = Freeze.List

type koEvent = {
    assistors: { entityId }
    -- ...
}
local koEvents: { koEvent } = props.koEvents

local didSelfAssist = List.some(koEvent.assistors, function(assistorId)
    return assistorId == selfId
end)
```
