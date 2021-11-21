-- date time functions for spec

function date()
    return date_now()
end

function time()
    return time_now()
end

function time_with_zone()
    return time_now(true)
end

return { date = date(), time = time(), time_with_zone = time_with_zone() }