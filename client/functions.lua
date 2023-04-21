---@deprecated
RPX.NotifyLeft = function(title, text, texture_dict, texture_name, duration)
    if texture_dict == "menu_textures" and texture_name == "menu_icon_alert" then
        lib.notify({ title = title, description = text, type = "error" })
    elseif texture_dict == "menu_textures" and texture_name == "menu_icon_tick" then
        lib.notify({ title = title, description = text, type = "success" })
    end
end

---@deprecated
RPX.NotifyRight = function(text, duration)
    lib.notify({ title = text })
end

---@deprecated
RPX.pNotifyLeft = function(text, timeout)
    lib.notify({ title = text })
end

---@deprecated
RPX.pNotifyRight = function(text, timeout)
    lib.notify({ title = text })
end

--- Format a number with commas.
---@param amount number | string
---@return string | number formatted The formatted number.
RPX.CommaValue = function(amount)
    local formatted = amount
    local k
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end

--- Draw text on screen.
---@param str string The text to display.
---@param x number The X screen position.
---@param y number The Y screen position.
---@param w number The width of the text.
---@param h number The height of the text.
---@param enableShadow boolean Enable a shadow behind the text.
---@param r number The red value of the text.
---@param g number The green value of the text.
---@param b number The blue value of the text.
---@param a number The alpha value of the text.
---@param centre boolean Centre the text.
RPX.DrawText = function (str, x, y, w, h, enableShadow, r, g, b, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(r), math.floor(g), math.floor(b), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    Citizen.InvokeNative(0xADA9255D, 1);
    SetTextFontForCurrentCommand(7)
    DisplayText(str, x, y)
end

--- Request a routing bucket for the client.
---@param bucket number The bucket to request.
RPX.RequestRoutingBucket = function(bucket)
    TriggerServerEvent("SERVER:RPX:RequestRoutingBucketForSelf", bucket)
end