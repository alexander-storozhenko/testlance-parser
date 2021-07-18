-- protect global variables

setmetatable(_G, {__newindex= function(t, k, v)
    assert(not __constants[k], 'read only variable!')
    rawset(t, k, v)
end})

