local modem = component.proxy(component.list("modem")())

local function sleep(timeout)
    checkArg(1, timeout, "number", "nil")
    local deadline = computer.uptime() + (timeout or 0)
    repeat
        computer.pullSignal(deadline - computer.uptime())
    until computer.uptime() >= deadline
end

while true do
    sleep(3)
    modem.broadcast(123, "hello world!")
    computer.beep(1000, 0.2)
end
