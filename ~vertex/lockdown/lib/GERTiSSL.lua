local GERTiSSL = {}
local GERTi = require('GERTiClient')
local component = require('component')

local function getCryptoLib(forceSw)
    if forceSw then return software end

    if (component.isAvailable("data")) then 
        return component.data
    else
        return software
    end
end

local cryptoLib = getCryptoLib(false)

function GERTiSSL.openSocket(gAddress, doEvent, outID)
    return GERTi.openSocket(gAddress, doEvent, outID)
end

function GERTiSSL.broadcast(data)
    return GERTi.broadcast(data)
end

return GERTiSSL