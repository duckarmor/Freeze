-- # selene: allow(global_usage)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:FindFirstChild("Packages", true)

local TestEZ = require(Packages.Dev.TestEZ)

TestEZ.TestBootstrap:run(
	{ Packages.Freeze, Packages.tests },
	TestEZ.Reporters.TextReporterQuiet,
	{ testNamePattern = nil }
)
