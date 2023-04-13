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

RPX.NotifyLeft = function(title, text, texture_dict, texture_name, duration)
    if texture_dict == "menu_textures" and texture_name == "menu_icon_alert" then
        lib.notify({ title = title, description = text, type = "error" })
    elseif texture_dict == "menu_textures" and texture_name == "menu_icon_tick" then
        lib.notify({ title = title, description = text, type = "success" })
    end
end

RPX.NotifyRight = function(text, duration)
    lib.notify({ title = text })
end

RPX.pNotifyLeft = function(text, timeout)
    lib.notify({ title = text })
end

RPX.pNotifyRight = function(text, timeout)
    lib.notify({ title = text })
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