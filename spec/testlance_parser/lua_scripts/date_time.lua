-- date time functions for spec

function date()
    return G_DATE_NOW()
end

function time()
    return G_TIME_NOW()
end

function time_with_zone()
    return G_TIME_NOW(true)
end

return { date = date(), time = time(), time_with_zone = time_with_zone() }