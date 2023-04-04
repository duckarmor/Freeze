--!nocheck
local Dictionary = require(script.Parent.Dictionary)
local is = require(script.Parent.Parent.is)

return function()
	describe("Dictionary", function()
		it("converts from object", function()
			local m = Dictionary({ a = "A", b = "B", c = "C" })
			expect(m.get("a")).toBe("A")
			expect(m.get("b")).toBe("B")
			expect(m.get("c")).toBe("C")
		end)

		it("tostring", function()
			local m = Dictionary({ a = "A" })
			expect(tostring(m)).toBe([[Dictionary( a=A )]])
		end)

		it("does not accept a scalar", function()
			expect(function()
				Dictionary(3)
			end).to.throw("Expected table")
		end)

		it("does not accept strings ", function()
			expect(function()
				Dictionary("abc")
			end).to.throw("Expected table")
		end)

		it("accepts flattened pairs via of()", function()
			local m = Dictionary.of("1", "a", "2", "b", "3", "c")
			expect(m.get("1")).toBe("a")
			expect(m.get("2")).toBe("b")
			expect(m.get("3")).toBe("c")
		end)

		it("does not accept mismatched flattened pairs via of()", function()
			expect(function()
				Dictionary.of(1, 2, 3)
			end).to.throw("Missing value for key: 3")
		end)

		it("converts back to Luau", function()
			local m = Dictionary({ a = "A", b = "B", c = "C" })
			expect(m.toLuau()).toEqual({ a = "A", b = "B", c = "C" })
		end)

		it("iterates values", function()
			local m = Dictionary({ [1] = "A", [2] = "B", [3] = "C" })

			local spy = {}
			local iterator = function(...)
				table.insert(spy, { ... })
			end

			m.forEach(iterator)
			expect(spy).toEqual({
				{ "A", 1 },
				{ "B", 2 },
				{ "C", 3 },
			})
		end)

		it("merges two maps", function()
			local m1 = Dictionary({ a = "A", b = "B", c = "C" })
			local m2 = Dictionary({ wow = "OO", d = "DD", b = "BB" })
			expect(m2.toLuau()).toEqual({ wow = "OO", d = "DD", b = "BB" })

			local m3 = m1.merge(m2)
			expect(m3.toLuau()).toEqual({
				a = "A",
				b = "BB",
				c = "C",
				wow = "OO",
				d = "DD",
			})
		end)

		it("concatenates two maps (alias for merge)", function()
			local m1 = Dictionary({ a = "A", b = "B", c = "C" })
			local m2 = Dictionary({ wow = "OO", d = "DD", b = "BB" })
			expect(m2.toLuau()).toEqual({ wow = "OO", d = "DD", b = "BB" })

			local m3 = m1.concat(m2)
			expect(m3.toLuau()).toEqual({
				a = "A",
				b = "BB",
				c = "C",
				wow = "OO",
				d = "DD",
			})
		end)

		it("accepts nil as a key", function()
			local m1 = Dictionary()
			local m2 = m1.set(nil, "nil")
			expect(m2.get(nil)).toBe(nil)

			local m3 = m2.remove(nil)
			expect(m3.toLuau()).toEqual({})
		end)

		it("is persistent to sets", function()
			local m1 = Dictionary()
			local m2 = m1.set("a", "Aardvark")
			local m3 = m2.set("b", "Baboon")
			local m4 = m3.set("c", "Canary")
			local m5 = m4.set("b", "Bonobo")
			expect(m1.count()).toBe(0)
			expect(m2.count()).toBe(1)
			expect(m3.count()).toBe(2)
			expect(m4.count()).toBe(3)
			expect(m5.count()).toBe(3)

			expect(m3.get("b")).toBe("Baboon")
			expect(m5.get("b")).toBe("Bonobo")
		end)

		it("is persistent to deletes", function()
			local m1 = Dictionary()
			local m2 = m1.set("a", "Aardvark")
			local m3 = m2.set("b", "Baboon")
			local m4 = m3.set("c", "Canary")
			local m5 = m4.remove("b")

			expect(m1.count()).toBe(0)
			expect(m2.count()).toBe(1)
			expect(m3.count()).toBe(2)
			expect(m4.count()).toBe(3)
			expect(m5.count()).toBe(2)

			expect(m3.has("b")).toBe(true)
			expect(m3.get("b")).toBe("Baboon")
			expect(m5.has("b")).toBe(false)
			expect(m5.get("b")).toBe(nil)
			expect(m5.get("c")).toBe("Canary")
		end)

		it("can use weird keys", function()
			local symbol = {}
			local m = Dictionary().set(math.huge, 2).set(symbol, "A").set(-math.huge, 3)

			expect(m.get(symbol)).toBe("A")
			expect(m.get(math.huge)).toBe(2)
			expect(m.get(-math.huge)).toBe(3)
		end)

		it("maps values", function()
			local m = Dictionary({ a = "a", b = "b", c = "c" })
			local r = m.map(function(value)
				return string.upper(value)
			end)
			expect(r.toLuau()).toEqual({ a = "A", b = "B", c = "C" })
		end)

		it("maps keys", function()
			local m = Dictionary({ a = "a", b = "b", c = "c" })
			local r = m.mapKeys(function(key)
				return string.upper(key)
			end)
			expect(r.toLuau()).toEqual({ A = "a", B = "b", C = "c" })
		end)

		it("filters values", function()
			local m = Dictionary({ a = 1, b = 2, c = 3, d = 4, e = 5, f = 6 })
			local r = m.filter(function(value)
				return value % 2 == 1
			end)
			expect(r.toLuau()).toEqual({ a = 1, c = 3, e = 5 })
		end)

		it("filterNots values", function()
			local m = Dictionary({ a = 1, b = 2, c = 3, d = 4, e = 5, f = 6 })
			local r = m.filterNot(function(value)
				return value % 2 == 1
			end)
			expect(r.toLuau()).toEqual({ b = 2, d = 4, f = 6 })
		end)

		it("flips keys and values", function()
			local v = Dictionary({ a = 1, b = 2, c = 3, d = 4, e = 5, f = 6 })
			expect(v.flip().toLuau()).toEqual({
				[1] = "a",
				[2] = "b",
				[3] = "c",
				[4] = "d",
				[5] = "e",
				[6] = "f",
			})
		end)

		it("can convert to a list", function()
			local m = Dictionary({ a = 1, b = 2, c = 3 })
			local v = m.toList()

			-- Note: Dictionary has undefined ordering, this List may not be the same
			-- order as the order you set into the Dictionary.

			expect(v.count()).toBe(3)
			expect(v.get(1)).toBe(1)

			local k = m.keys().toList()
			expect(k.count()).toBe(3)
			expect(k.get(1)).toBe("a")
		end)

		it("expresses value equality with unordered sequences", function()
			local m1 = Dictionary({ A = 1, B = 2, C = 3 })
			local m2 = Dictionary({ C = 3, B = 2, A = 1 })
			expect(is(m1, m2)).toBe(true)
		end)

		it("deletes all the provided keys", function()
			local m1 = Dictionary({ A = 1, B = 2, C = 3 })
			local m2 = m1.deleteAll({ "A", "B" })

			expect(m2.get("A")).toBe(nil)
			expect(m2.get("B")).toBe(nil)
			expect(m2.get("C")).toBe(3)
			expect(m2.count()).toBe(1)
		end)
	end)
end
