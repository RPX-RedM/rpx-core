---@deprecated
RPX.NotifyLeft = function(source, title, text, texture_dict, texture_name, duration)
    if texture_dict == "menu_textures" and texture_name == "menu_icon_alert" then
        lib.notify(source, {title = title, description = text, type = "error" })
    elseif texture_dict == "menu_textures" and texture_name == "menu_icon_tick" then
        lib.notify(source, {title = title, description = text, type = "success" })
    end
end

---@deprecated
RPX.NotifyRight = function(source, text, duration)
    lib.notify(source, { title = text })
end

---@deprecated
RPX.pNotifyLeft = function(source, text, timeout)
    lib.notify(source, { title = text })
end

---@deprecated
RPX.pNotifyRight = function(source, text, timeout)
    lib.notify(source, { title = text })
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

-- Permissions System
RPX.Permissions = {}

---Gets a player's permission group. If the player is not in the permissions table, it will return "user".
---@param src string | number
---@return string
RPX.Permissions.GetPermissionGroup = function(src)
    ---@cast src string
    local license = GetPlayerIdentifierByType(src, "license")
    local group = "user"
    local result = MySQL.Sync.fetchAll("SELECT * FROM permissions WHERE license = @license", {["@license"] = license})
    if result[1] then
        group = result[1].group
        print("[RPX] Logging in staff member: " .. GetPlayerName(src) .. " (" .. license .. ") as " .. group)
    end
    return group
end

---Sets a player's permission group. If the group is "user", it will remove the player from the permissions table.
---@param src string | number
---@param group string
RPX.Permissions.SetPermissionGroup = function(src, group)
    ---@cast src string
    local license = GetPlayerIdentifierByType(src, "license")
    if group == "user" then
        MySQL.Sync.execute("DELETE FROM permissions WHERE license = @license", {["@license"] = license})
        return
    end

    local result = MySQL.Sync.fetchAll("SELECT * FROM permissions WHERE license = @license", {["@license"] = license})
    if result[1] then
        MySQL.Sync.execute("UPDATE permissions SET `group` = @group WHERE license = @license", {["@license"] = license, ["@group"] = group})
    else
        MySQL.Sync.execute("INSERT INTO permissions (`license`, `group`) VALUES (@license, @group)", {["@license"] = license, ["@group"] = group})
    end
end

---State Bag Propagation
---@param src string | number
RPX.UpdateStateBags = function(src)
    if RPX.Players[src] then
        local PlayerInfo = RPX.Players[src]
        Player(src).state:set("isLoggedIn", true, true)

        for key, value in pairs(PlayerInfo) do
            if type(value) ~= "function" then -- Only set state for non-functions. We don't need to propagate functions to the client.
                Player(src).state:set(key, value, true)
            end
        end
    end
end

--- Create a server callback that can be used by the client to get data from the server.
---@param name string The name of the callback.
---@param cb function The callback function.
function CreateCallback(name, cb)
    RPX.ServerCallbacks[name] = cb
end
exports('CreateCallback', CreateCallback)

--- Trigger a server callback.
---@param name string The name of the callback.
---@param source string | number The source of the callback.
---@param cb function The callback function.
function TriggerCallback(name, source, cb, ...)
    if not RPX.ServerCallbacks[name] then return end
    RPX.ServerCallbacks[name](source, cb, ...)
end
exports('TriggerCallback', TriggerCallback)