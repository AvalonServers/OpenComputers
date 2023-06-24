-- Configuration section
local server_addr = "2500.2600"
local server_port = 25

-- Do not edit below this point.
local GERTi = require('GERTiClient')
local socket = GERTi.openSocket(server_addr, server_port)

local component = require('component')
local computer = require("computer")
local event = require("event")
local filesystem = require("filesystem")
local os = require('os')
local serialize = require("serialization")
local crypto = require('crypto').getCryptoLib(false)

local directory = os.getenv("_")
directory = filesystem.path(directory)


local f = io.open(directory .. "public.key", "a")
f:write(addressP1.."."..addressP2.."\n")
f:write(rAddress.."\n")
f:close()

while true:
