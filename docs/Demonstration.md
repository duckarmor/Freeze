---
sidebar_position: 3
---

# Demonstration

Handling immutable data structures can be done either functionally or as a class.

## Functional

Other popular Lua implementations[^1] of immutable data structures typically offer this functional approach:

```lua
local oldList = { "a", "b", "c" }
local newList = Freeze.List.set(oldList, 1, "value")
```

This comes with a few benefits, such as knowing we will always get a Luau `table` type as a result.


## Class

Freeze also offers a class-based approach to writing immutable data structures.[^2]


```lua
local oldList = Freeze.List({ "a", "b", "c" })
local newList = oldList.set(1, "value").toLuau()
```

This makes it easy to chain together operations to create a new data structure.

```lua
local oldList = Freeze.List({ "a", "b", "c", "d" })
local newList = oldList.map(string.upper).reverse().remove(1)
-- List( "C", "B", "A" )
```

This does come with a caveat. Most Luau code written may expect a Luau table data type without any class decorations. If your code is expecting a Luau table data type, be sure to convert your result via `toLuau`.

```lua
local luauTable: { string } = newList.toLuau()
```

## API Reference
Check out the [API Reference](../api) to see what else Freeze is capable of!


[^1]: Such as [Llama](https://github.com/freddylist/llama).
[^2]:  [Immutable.js](https://immutable-js.com/) was a heavy inspiration.