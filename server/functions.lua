RPX.NotifyLeft = function(source, title, text, texture_dict, texture_name, duration)
    TriggerClientEvent("RPX:NotifyLeft", source, title, text, texture_dict, texture_name, duration)
end

RPX.NotifyRight = function(source, text, duration)
    TriggerClientEvent("RPX:ShowSimpleRightText", source, text, duration)
end

RPX.pNotifyLeft = function(source, text, timeout)
    TriggerClientEvent("pNotify:SendNotification", source, {text = text, type = "error", layout = "centerLeft", timeout = timeout}) 
end

RPX.pNotifyRight = function(source, text, timeout)
    TriggerClientEvent("pNotify:SendNotification", source, {text = text, type = "error", layout = "centerRight", timeout = timeout}) 
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