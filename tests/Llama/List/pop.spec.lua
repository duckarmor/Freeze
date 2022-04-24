return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local Packages = ReplicatedStorage.Packages
	local Llama = require(Packages.Llama)

	local List = Llama.List
	local pop = List.pop

	itFIXME("should validate types", function()
		local args = {
			{ 0 },
			{ {}, 1.5 },
		}

		for i = 1, #args do
			local _, err = pcall(function()
				pop(unpack(args[i]))
			end)

			expect(string.find(err, "expected, got")).to.be.ok()
		end
	end)

	it("should return a new table", function()
		local a = { 1, 2, 3 }

		expect(pop(a)).never.to.equal(a)
	end)

	it("should not mutate passed in tables", function()
		local a = { "foo", "bar" }
		local mutations = 0

		setmetatable(a, {
			__newindex = function()
				mutations = mutations + 1
			end,
		})

		pop(a)

		expect(mutations).to.equal(0)
	end)

	it("should remove the last value of the list", function()
		local a = { 1, 2, 3 }
		local result = pop(a)

		expect(result[1]).to.equal(1)
		expect(result[2]).to.equal(2)
		expect(result[3]).never.to.be.ok()
	end)

	it("should remove the last values of the list, if a number is provided", function()
		local a = { 1, 2, 3 }
		local result = pop(a, 2)

		expect(#result).to.equal(1)
		expect(result[1]).to.equal(1)
	end)
end
