-- date time functions for spec

function date()
    return g_date_now()
end

function time()
    return g_time_now()
end

function time_with_zone()
    return g_time_now(true)
end

return { date = date(), time = time(), time_with_zone = time_with_zone() }