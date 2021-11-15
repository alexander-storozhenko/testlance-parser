result = 1

split = string_split(G_TITLE, ' ')

if split[1.0] == 'CUSTOM' then
    result = result / 2
end

return result