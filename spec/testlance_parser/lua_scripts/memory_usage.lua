-- memory use over limit for spec

local table = {}

for i = 1, 10000 do
    table[i] = 1
end

return 1