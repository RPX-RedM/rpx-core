RPX.DrawText = function (str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    Citizen.InvokeNative(0xADA9255D, 1);
	SetTextFontForCurrentCommand(7)
    DisplayText(str, x, y)
end

RPX.NotifyLeft = function(title, text, dict, icon, duration)
    local _dict = dict
    local _icon = icon
    if not LoadTexture(_dict) then
        _dict = "generic_textures"
        LoadTexture(_dict)
        _icon = "tick"
    end
    exports['rpx-core']:DisplayLeftNotification(tostring(title), tostring(text), tostring(_dict), tostring(_icon), tonumber(duration))
end

RPX.NotifyRight = function(text, duration)
    exports['rpx-core']:ShowSimpleRightText(tostring(text), tonumber(duration))
end

RPX.pNotifyLeft = function(text, timeout)
    exports.pNotify:SendNotification({text = text, type = "error", layout = "centerLeft", timeout = timeout}) 
end

RPX.pNotifyRight = function(text, timeout)
    exports.pNotify:SendNotification({text = text, type = "error", layout = "centerRight", timeout = timeout}) 
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

LoadTexture = function(dict)
    if Citizen.InvokeNative(0xBA0163B277C2D2D0, dict) then 
        if not HasStreamedTextureDictLoaded(dict) then 
            RequestStreamedTextureDict(dict)
            while not HasStreamedTextureDictLoaded(dict) do 
                Citizen.Wait(1)
            end 
        end
    end
end