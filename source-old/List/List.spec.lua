--!nocheck
local List = require(script.Parent.List)

return function()
	describe("List", function()
		it("determines assignment of unspecified value types", function()
			local t = List({}).toLuau()
			expect(#t).toBe(0)
		end)

		it("provides initial values", function()
			local v = List.of("a", "b", "c")
			expect(v.get(1)).toBe("a")
			expect(v.get(2)).toBe("b")
			expect(v.get(3)).toBe("c")
		end)

		it("accepts an array", function()
			local v = List.new({ "a", "b", "c" })

			expect(v.get(2)).toBe("b")
		end)

		it("can set and get a value", function()
			local v1 = List.new()
			expect(v1.get(1)).to.never.be.ok()

			local v2 = v1.set(1, "value")
			expect(v2.get(1)).toBe("value")
		end)

		it("can setIn and getIn a deep value", function()
			local t = {
				{
					aKey = { "bad", "good" },
				},
			}
			local v = List(t)
			expect(v.getIn({ 1, "aKey", 2 })).toBe("good")

			local v2 = v.setIn({ 1, "aKey", 2 }, "great")
			expect(v2.getIn({ 1, "aKey", 2 })).toBe("great")
		end)

		it("throw when calling setIn on a non data structure", function()
			local avengers = {
				"ironMan", -- index [1]
				{
					"captainAmerica", -- index[2][1]
					{
						"blackWidow", -- index[2][2][1]
						{ "theHulk" }, -- index [2][2][2][1]
					},
				},
			}
			local avengersList = List(avengers)

			-- change theHulk to scarletWitch
			local out1 = avengersList.setIn({ 2, 2, 2, 1 }, "scarletWitch")
			expect(out1.getIn({ 2, 2, 2, 1 })).toEqual("scarletWitch")

			local out2 = avengersList.setIn({ 2, 2, 2, 4 }, "scarletWitch")
			expect(out2.getIn({ 2, 2, 2, 4 })).toEqual("scarletWitch")

			expect(function()
				avengersList.setIn({ 1, 2 }, "scarletWitch")
			end).to.throw("Cannot update within non-data-structure value in path [1]: ironMan")
		end)

		it("can update a value", function()
			local l = List.of(5)
			expect(l.update(1, function(v)
				return v * v
			end).toLuau()).toEqual({ 25 })
		end)

		it("can updateIn a deep value", function()
			local l = List({
				{
					aKey = { "bad", "good" },
				},
			})
			local l2 = l.updateIn({ 1, "aKey", 2 }, function(v)
				return v .. " " .. v
			end)

			expect(l2.toLuau()).toEqual({
				{
					aKey = { "bad", "good good" },
				},
			})
		end)

		it("returns nil when getting a missing value", function()
			local v = List({ 1, 2, 3 })
			expect(v.get(nil)).to.never.be.ok()

			local o = List({
				{ a = 1 },
				{ b = 2 },
				{ c = 3 },
			})
			expect(o.get(nil)).to.never.be.ok()
		end)

		it("counts from the end of the list on negative index", function()
			local i = List.of(1, 2, 3, 4, 5, 6, 7)
			expect(i.get(-1)).toBe(7)
			expect(i.get(-5)).toBe(3)
			expect(i.get(-9)).toBe(nil)
			expect(i.get(-999, 1000)).toBe(1000)
		end)

		it("uses not set value for string index", function()
			local list = List()
			expect(list.get("stringKey", "NOT-SET")).toBe("NOT-SET")
		end)

		it("uses not set value for index {}", function()
			local list = List.of(1, 2, 3, 4, 5)
			expect(list.get({}, "NOT-SET")).toBe("NOT-SET")
		end)

		it("uses not set value for index 0", function()
			local list = List.of(1, 2, 3, 4, 5)
			expect(list.get(0, "NOT-SET")).toBe("NOT-SET")
		end)

		it("uses not set value for index nil", function()
			local list = List.of(1, 2, 3, 4, 5)
			expect(list.get(nil, "NOT-SET")).toBe("NOT-SET")
		end)

		it("does not contain elements at non-empty string keys", function()
			local list = List.of(1, 2, 3, 4, 5)
			expect(list.has("__index")).toBe(false)
		end)

		it("hasIn does not throw for bad keyPath", function()
			local list = List.of(1, 2, 3, 4, 5)
			expect(list.hasIn({ 1, 2, 3 })).toBe(false)

			local list2 = List({ {} })
			expect(list2.hasIn({ 1, "bad" })).toBe(false)
		end)

		it("setting creates a new instance", function()
			local v0 = List.of("a")
			local v1 = v0.set(1, "A")

			expect(v0.get(1)).toBe("a")
			expect(v1.get(1)).toBe("A")
		end)

		it("get helpers make for easier to read code", function()
			local v = List.of("a", "b", "c")
			expect(v.first()).toBe("a")
			expect(v.get(2)).toBe("b")
			expect(v.last()).toBe("c")
		end)

		it("slice helpers make for easier to read code", function()
			local v0 = List.of("a", "b", "c")
			local v1 = List.of("a", "b")
			local v2 = List.of("a")
			local v3 = List()

			expect(v0.rest().toArray()).toEqual({ "b", "c" })
			expect(v0.butLast().toArray()).toEqual({ "a", "b" })

			expect(v1.rest().toArray()).toEqual({ "b" })
			expect(v1.butLast().toArray()).toEqual({ "a" })

			expect(v2.rest().toArray()).toEqual({})
			expect(v2.butLast().toArray()).toEqual({})

			expect(v3.rest().toArray()).toEqual({})
			expect(v3.butLast().toArray()).toEqual({})
		end)

		it("can set at arbitrary indices", function()
			local v0 = List.of("a", "b", "c")
			local v1 = v0.set(2, "B") -- within existing tail
			local v2 = v1.set(4, "d") -- at last position
			local v3 = v2.set(32, "e") -- (testing internal guts)
			local v4 = v3.set(32, "E") -- set within existing tree

			local expectedArray = { "a", "B", "c", "d", "E" }
			expect(v4.toArray()).toEqual(expectedArray)
		end)

		it("tostring", function()
			local v0 = List.of(1, 2, 3)
			expect(tostring(v0)).toBe("List( 1, 2, 3 )")
		end)

		it("describes a dense list", function()
			local v = List.of("a", "b", "c").push("d", "e").set(5, "o").set(6, nil).remove(2)

			expect(v.toLuau()).toEqual({ "a", "c", "d", "o" })
		end)

		it("pushes inserts at highest index", function()
			local v0 = List.of("a", "b", "c")
			local v1 = v0.push("d", "e", "f")

			expect(v1.toArray()).toEqual({ "a", "b", "c", "d", "e", "f" })
		end)

		it("allows popping an empty list", function()
			local v = List.of("a").pop()
			expect(v.toArray()).toEqual({})

			v = v.pop().pop().pop().pop().pop()
			expect(v.toArray()).toEqual({})
		end)

		it("shifts values from the front", function()
			local v = List.of("a", "b", "c").shift()
			expect(v.first()).toBe("b")
			expect(#v.toLuau()).toBe(2)
		end)

		it("unshifts values to the front", function()
			local v = List.of("a", "b", "c").unshift("x", "y", "z")
			expect(v.first()).toBe("x")
			expect(#v.toLuau()).toBe(6)
			expect(v.toArray()).toEqual({ "x", "y", "z", "a", "b", "c" })
		end)

		it("finds values using indexOf", function()
			local v = List.of("a", "b", "c", "b", "a")
			expect(v.indexOf("b")).toBe(2)
			expect(v.indexOf("c")).toBe(3)
			expect(v.indexOf("d")).toBe(nil)
		end)

		--[[itSKIP("finds values using lastIndexOf", function()
			local v = List.of("a", "b", "c", "b", "a")
			expect(v.lastIndexOf("b")).toBe(4)
			expect(v.lastIndexOf("c")).toBe(3)
			expect(v.lastIndexOf("d")).toBe(nil)
		end)]]

		it("finds values using findIndex", function()
			local v = List.of("a", "b", "c", "B", "a")

			expect(v.findIndex(function(value)
				return string.upper(value) == value
			end)).toBe(4)

			expect(v.findIndex(function(value)
				return string.len(value) > 1
			end)).toBe(nil)
		end)

		it("maps values", function()
			local v = List.of("a", "b", "c")
			local r = v.map(function(value)
				return string.upper(value)
			end)
			expect(r.toArray()).toEqual({ "A", "B", "C" })
		end)

		it("filters values", function()
			local predicate = function(_value, index)
				return index % 2 == 0
			end

			local v = List.of("a", "b", "c", "d", "e", "f")
			local r = v.filter(predicate)
			expect(r.toArray()).toEqual({ "b", "d", "f" })

			local r2 = v.filterNot(predicate)
			expect(r2.toArray()).toEqual({ "a", "c", "e" })
		end)

		it("reduces values", function()
			local v = List.of(1, 10, 100)
			local r = v.reduce(function(reduction, value)
				return reduction + value
			end)
			expect(r).toEqual(111)

			local r2 = v.reduce(function(reduction, value)
				return reduction + value
			end, 1000)
			expect(r2).toEqual(1111)
		end)

		it("reduces from the right", function()
			local v = List.of("a", "b", "c")
			local r = v.reduceRight(function(reduction, value)
				return reduction .. value
			end)
			expect(r).toEqual("cba")

			local r2 = v.reduceRight(function(reduction, value)
				return reduction .. value
			end, "#")
			expect(r2).toEqual("#cba")
		end)

		it("takes all", function()
			local v = List.of("a", "b", "c")
			local r = v.take(10000)
			expect(r.toLuau()).toEqual({ "a", "b", "c" })
		end)

		it("take", function()
			local v = List.of("a", "b", "c")
			local r = v.take(2)
			expect(r.toLuau()).toEqual({ "a", "b" })
		end)

		it("takeLast", function()
			local v = List.of("a", "b", "c")
			local r = v.takeLast(2)
			expect(r.toLuau()).toEqual({ "b", "c" })
		end)

		it("skip", function()
			local v = List.of("a", "b", "c", "d", "e", "f")
			local r = v.skip(2)
			expect(r.toArray()).toEqual({ "c", "d", "e", "f" })

			local r1 = v.skip(0)
			expect(r1.toArray()).toEqual({ "a", "b", "c", "d", "e", "f" })

			local r2 = v.skip(1000)
			expect(r2.toArray()).toEqual({})
		end)

		it("takes and skips values", function()
			local v = List.of("a", "b", "c", "d", "e", "f")
			local r = v.skip(2).take(2)
			expect(r.toArray()).toEqual({ "c", "d" })
		end)

		it("efficiently chains array methods", function()
			local v = List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)

			local r = v.filter(function(x)
				return x % 2 == 0
			end).skip(2).map(function(x)
				return x * x
			end).take(3).reduce(function(a: number, b: number)
				return a + b
			end, 0)

			expect(r).toEqual(200)
		end)

		it("reverses", function()
			local v = List.of("a", "b", "c")
			expect(v.reverse().toArray()).toEqual({ "c", "b", "a" })
		end)

		it("count", function()
			local v = List.of("a", "b", "c")
			expect(v.count()).toBe(3)
		end)

		it("count with predicate", function()
			local v = List.of("a", "b", "c")
			expect(v.count(function(value)
				return value == "a"
			end)).toBe(1)
		end)

		it("works with insert", function()
			local v = List.of("a", "b", "c")

			local m = v.insert(1, "d")
			expect(m.toLuau()).toEqual({ "d", "a", "b", "c" })

			-- Works when index is greater than size of array.
			local n = v.insert(10, "e")
			expect(n.toLuau()).toEqual({ "a", "b", "c", "e" })

			-- Works when index is negative.
			local o = v.insert(-4, "f")
			expect(o.toLuau()).toEqual({ "f", "a", "b", "c" })
		end)

		it("forEach iterates in the correct order", function()
			local n = 0
			local a = {}
			local v = List.of("a", "b", "c", "d", "e")

			local timesCalled = v.forEach(function(x)
				table.insert(a, x)
				n += 1
			end)

			expect(timesCalled).toEqual(5)
			expect(n).toBe(5)
			expect(#a).toBe(5)
			expect(a).toEqual({ "a", "b", "c", "d", "e" })
		end)

		it("forEach iteration terminates when callback returns false", function()
			local a = {}
			local function count(x)
				if x > 2 then
					return false
				end

				table.insert(a, x)
				return nil
			end

			local v = List.of(0, 1, 2, 3, 4)
			v.forEach(count)
			expect(a).toEqual({ 0, 1, 2 })
		end)

		it("concat works as expected complex", function()
			local v1 = List({ 1, 2, 3 })
			local v2 = v1.concat(4, List({ 5, 6 }), { 7, 8 }, nil, 9)
			expect(v1.toArray()).toEqual({ 1, 2, 3 })
			expect(v2.toArray()).toEqual({ 1, 2, 3, 4, 5, 6, 7, 8, 9 })
		end)

		it("concat works as expected simple", function()
			local v1 = List({ 1, 2, 3 })
			local a = { 4 }

			local v2 = v1.concat(a)
			expect(v1.toArray()).toEqual({ 1, 2, 3 })
			expect(v2.toArray()).toEqual({ 1, 2, 3, 4 })
		end)

		it("concats a single value", function()
			local v1 = List({ 1, 2, 3 })
			expect(v1.concat(4)).toEqual(List({ 1, 2, 3, 4 }))
		end)

		it("concat does not spread in string characters", function()
			local v1 = List({ 1, 2, 3 })
			expect(v1.concat("abcdef")).toEqual(List({ 1, 2, 3, "abcdef" }))
		end)
	end)
end
