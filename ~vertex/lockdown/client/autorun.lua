-- Configuration section
local proxy_addr = 0.3

-- Do not edit below this point.
local GERTi = require('GERTiClient')
local Lockdown = require('LockdownAPI')

-- disable crypto for now as WIP
--local crypto = require('crypto').getCryptoLib(false)

Lockdown.connect(proxy_addr, '')
