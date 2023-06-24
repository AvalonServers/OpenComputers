local component = require('component')
local colors = require('colors')
local sides = require('sides')

local cbus = require('./../lib/ControlBusAPI.lua')

local controller_ids = {
    [1] = "b7f3", 
    [2] = "2b56", 
    [3] = "3cf1"
}

local controllers = {}

local panels = {
    {1, sides.front},
    {1, sides.front},
    {1, sides.front},
    {1, sides.front},
    {2, sides.front},
    {2, sides.front},
    {2, sides.front},
    {2, sides.front},
    {3, sides.front},
    {3, sides.front},
    {3, sides.front},
    {3, sides.front}
}


for k, v in pairs(controller_ids) do
    controllers[k] = component.proxy(component.get(v))
end


function set_value(src, panel, colour, value)
    pnl = panels[panel]
    controller = controllers[pnl[1]]

    controller.setBundledOutput(pnl[2], colour, value)
end


-- source, event, function
cbus.register(nil, cbus.EVENT_SET, set_value)