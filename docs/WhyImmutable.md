---
sidebar_position: 2
---
# How does immutability help?

<div align="center">
🏗️ <b>Under construction</b>
</div>

----

Immutable data structures cannot be changed once they have been created. This allows these data structures to forever hold their current state forever, __frozen in time__, as long as you have a reference to them.

That sounds cool, but what does that actually mean for programmers?

## Value Equality vs Reference Equality
First you'll want to have a simple understanding of the difference between __value equality__ and __reference equality__.

Let's take these two lists.
```lua
local list1 = { "a", "b", "c" }
local list2 = { "a", "b", "c" }
```
They look the same right? Are they equal?
```lua
print(list1 == list2)
-- false
```
Luau would seem to think not.

That is because the `==` operator compares two values by __reference equality__. `list1` and `list2` are represented by two different addresses in memory.

Try it out! Use `print` on `list1` and `list2` and you'll see they print two different ~~credit card numbers~~ memory addresses.

```lua
print(tostring(list1))
-- table: 0x1111111111111111
print(tostring(list2))
-- table: 0x2222222222222222
```

If we wanted to compare the value equality between the two lists, that could become expensive depending on the size of the lists. It would require traversing each list (and sub data structures!!) and comparing the values and keys with each.

If we treated `list1` as an **immutable** list, we can solve this class of problems:

```lua
local list1 = { "a", "b", "c" }
local list2 = Freeze.List.set(list1, 4, "d")
```

Now we have two lists that we can compare against by __reference equality__ and if they differ we can assume they also differ via __value equality__.

----

Let's look at this example from another perspective and focus on `list1`.

```lua
local list1 = { "a", "b", "c" }
list[4] = "d"
```
`list1` has changed its __value equality__ but its reference is still the same. Wouldn't it be nice if we could have tracked the history of `list1`? Maybe we need to perform some action once `index 4` has been assigned.

## Ok, but what about practical applications?

In short, use of these data structures lead to simpler development time. In practical terms, React and Rodux rely on immutable data structures to detect if they should re-render or raise a changed event.

Take the following example from Rodux:

```lua
store.changed:connect(function(newState, oldState)
    -- newState and oldState are immutable "snapshots" of state
    if newState.todos ~= oldState.todos then
        print("something changed within our todos field!")
    end
end)
```
Since newState and oldState are two unique snapshots of state, they can be referenced now or at a later date to determine what has changed.

We didn't have to run an expensive value equality comparison function. Simply the basis of the reference equality (`==`) is all we need.

If newState and oldState were not immutable, we would have a much harder time determining something had changed.

For more practical examples, check out our [Examples and Usecases](/docs/ExamplesAndUsecases) page.

## Immutability and performance
There are some readers who may be concerned that creating new tables instead of reusing old ones for operations may not be performant enough for their use cases.

Rest assured that Luau is a _very_ performant language and immutability may be worth the benefits as it can reduce code complexity and open up new solutions that were not feasible without these structures (examples: state time travel, state debugging, creating an undo/redo stack).

Consider immutable data structures as a tool like any other high level concepts you've learned. If you are using immutable data structures in one part of your project, it does not mean you **must** use them in all other systems where the benefits and tradeoffs don't make sense.


## TLDR
In summary, the following are core key points that immutable data structures can help with.
1. Without immutable data structures, state mutations can turn into spaghetti really quickly. Immutability helps employ robust practices and encourage mindfulness when designing all the ways state can change.
2. When detecting state changes, immutability helps by using a cheap `==` operation for reference equality instead of an expensive equality checking function by leaning on an inherit property of immutability in Luau; a new table will be produced every time its contents are changed.
3. It's difficult to robustly keep track of how state changes over time. Immutability helps by inherently leaving a breadcrumb trail of previous states to easily store for debugging.

## I can't stop reading about immutability!

If we haven't yet satiated your desires for literature about immutability, take a look at what these other authors have to say:
- [Immutable.js](https://immutable-js.com/#introduction)
- [Llama](https://freddylist.github.io/llama/)
