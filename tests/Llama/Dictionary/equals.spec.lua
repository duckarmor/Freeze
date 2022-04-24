return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local Packages = ReplicatedStorage.Packages
	local Llama = require(Packages.Llama)

	local Dictionary = Llama.Dictionary
	local equals = Dictionary.equals

	it("should return a boolean", function()
		local a = {}

		expect(equals(a, a)).to.be.a("boolean")
		expect(equals(a, {})).to.be.a("boolean")
		expect(equals({}, { 1 })).to.be.a("boolean")
	end)

	-- Freeze: Deviation -- equals will perform value equality
	itSKIP("should return whether provided objects have reference equality", function()
		local a = {
			foo = 1,
			bar = 2,
			baz = 3,
			qux = {},
		}
		local b = {
			foo = 1,
			bar = 2,
			baz = 3,
			qux = a.qux,
		}
		local c = {
			foo = 1,
			bar = 2,
			baz = 3,
			qux = {},
		}

		expect(equals(a, b)).to.equal(true)
		expect(equals(a, c)).to.equal(false)
	end)

	-- Freeze: Deviation -- only accepts two objects
	itSKIP("should work with an arbitrary number of objects", function()
		local a = {
			foo = 1,
			bar = 2,
			baz = 3,
		}
		local b = a
		local c = {
			foo = 1,
			bar = 2,
			baz = 3,
		}
		local d = {
			oof = 4,
			rab = 5,
			zab = 6,
		}
		local e = d
		local f = {
			oof = 4,
			rab = 5,
			zab = 6,
		}

		expect(equals(a, b, c)).to.equal(true)
		expect(equals(a, b, c, d, e, f)).to.equal(false)
	end)

	-- Freeze: Deviation -- will treat nil and void as values
	itSKIP("should work with one object", function()
		local a = {}

		expect(equals(a)).to.equal(true)
	end)

	it("should work with zero objects", function()
		expect(equals()).to.equal(true)
	end)

	it("should work for any type of objects", function()
		expect(equals(1, 1)).to.equal(true)
		expect(equals(1, "a")).to.equal(false)
	end)
end
