-- date time functions for spec

function date()
    return G_DATE_NOW()
end

function time()
    return G_TIME_NOW()
end

return { date = date(), time = time() }