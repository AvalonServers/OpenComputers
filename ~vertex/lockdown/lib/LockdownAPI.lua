local GERTi = require('GERTiClient')
local port = 25

-- constants
LD_PACKET_PING = 0
LD_PACKET_PONG = 1
LD_KEY_ENROLL = 2

local Lockdown = {}

-- connection class
local function sendPacket(self, packet, data)
    -- attempt connection
    self.socket:write({packet = packet, data = data})
    local result = event.pull(3, "GERTConnectionID")

    if result == nil then
        io.stderr:write("Timed out while waiting for a response from the proxy.")
        return nil
    end

    return self.socket:read()
end

local function sendPing(self)
    if self.sendPacket(LD_PACKET_PING, nil) == nil then
        return false
    else
        return true
    end
end

local function sendEnroll(self, totp)
end

function Lockdown.connect(address, clientKey, enroll)
    -- open GERT socket
    local socket = GERTi.openSocket(address, port)
    if socket == nil then return nil end

    local conn = {
        address = address,
        clientKey = clientKey,
        socket = socket,

        sendPacket = sendPacket,
        sendPing = sendPing
    }

    -- attempt to enroll if required
    socket:write({packet = LD_KEY_ENROLL})
    local result = event.pull(3, "GERTConnectionID")

    if result == nil then
        io.stderr:write("Timed out while attempting to enroll the key.")
        return nil
    end
    
    return conn
end

return Lockdown