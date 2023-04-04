-- # selene: allow(global_usage)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages

local TestEZ = require(Packages.Dev.TestEZ)

TestEZ.TestBootstrap:run({ Packages.Freeze }, TestEZ.Reporters.TextReporterQuiet, { testNamePattern = nil })
