# Installation

## With Wally

```toml
[dependencies]
Freeze = "duckarmor/freeze@0.0.4"
```
<!--moonwave-hide-before-this-line-->
# Freeze

Freeze is an immutable data structure library for Roblox Luau.

Immutable data structures are imperative for use with popular libraries such as React and Rodux. To learn more about why immutability is important, check out our [Why Immutable?](/docs/WhyImmutable.md) page.

Freeze is typed and currently used in several duckarmor projects.

Use Freeze to create immutable data structures like so:

```lua
local map1 = { a = 1, b = 2, c = 3 }
local map2 = Freeze.Dictionary.set(map1, "b", 50)

print(map1.b, "vs", map2.b)
-- 2 vs 50
```

Freeze will optimize return calls in such that it will return the original list or dictionary if no changes were made:
```lua
local map1 = { a = 1 }
local map2 = Freeze.Dictionary.set(map1, "a", 1)

print(map1 == map2)
-- true; because no changes were made
```
True to it's name, Freeze will return calls of new values wrapped in `table.frozen`. Return values that are not changed will not be `table.frozen`'d to preserve the caller's frozen status.

## Freeze's General Philosophy

Freeze aims to
- Be type safe. Types are represented in such that there are no false negative type errors.
- Be runtime safe. Errors will not propagate unless you are passing invalid values that the Luau type checker would have caught.
- Enforce immutability via `table.frozen`
- Optimize return values if no changes were made within the operation by returning the original value.


## Prior art

Freeze takes inspiration from:
- [Llama by freddylist](https://github.com/freddylist/llama)
- [Immutable.js](https://immutable-js.com/)




## Demos
See [demonstrations](https://benbrimeyer.github.io/Freeze/docs/Demonstration) within our docs!
