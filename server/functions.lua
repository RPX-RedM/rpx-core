RPX.NotifyLeft = function(source, title, text, texture_dict, texture_name, duration)
    if texture_dict == "menu_textures" and texture_name == "menu_icon_alert" then
        lib.notify(source, {title = title, description = text, type = "error" })
    elseif texture_dict == "menu_textures" and texture_name == "menu_icon_tick" then
        lib.notify(source, {title = title, description = text, type = "success" })
    end
end

RPX.NotifyRight = function(source, text, duration)
    lib.notify(source, { title = text })
end

RPX.pNotifyLeft = function(source, text, timeout)
    lib.notify(source, { title = text })
end

RPX.pNotifyRight = function(source, text, timeout)
    lib.notify(source, { title = text })
end

RPX.CommaValue = function(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end