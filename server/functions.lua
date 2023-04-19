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
---@param amount number | string The number to format.
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

--- Gets a player's permission group. If the player is not in the permissions table, it will return "user".
---@param src string | number The player's source.
---@return string group The player's permission group.
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

--- Sets a player's permission group. If the group is "user", it will remove the player from the permissions table.
---@param src string | number The player's source.
---@param group string  The player's permission group.
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

--- Update state bags for a player.
---@param src string | number The player's source.
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
exports('UpdateStateBags', RPX.UpdateStateBags) -- Export this function so it can be used by other resources without having to use the RPX namespace.

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


--- Returns the player's object by their server id.
---@param src string | number | unknown
---@return Player | nil
RPX.GetPlayer = function(src)
    local playerId = tonumber(src)
    if RPX.Players[playerId] then
        return RPX.Players[playerId]
    end
    return nil
end

---Returns the player's object by their citizen id.
---@param citizenId string
---@return Player | nil
RPX.GetPlayerByCitizenId = function(citizenId)
    for _,player in pairs(RPX.Players) do
        if player.citizenid == citizenId then
            return player
        end
    end
    return nil
end

---Returns the player's characters.
---@param src string | number
---@return table
RPX.Player.GetCharacters = function(src)
    ---@cast src string
    local license = GetPlayerIdentifierByType(src, "license")
    local result = MySQL.Sync.fetchAll('SELECT * FROM characters WHERE license = ? ORDER BY slot', { license })
    if result then
        local characterList = {}
        for k,v in pairs(result) do
            characterList[k] = v
        end
        return characterList
    end
    return {}
end

--- Helper function for the multicharacter to select a character.
---@param src string | number
---@param citizenid any
RPX.Player.SelectCharacter = function(src, citizenid)
    ---@cast src string
    local license = GetPlayerIdentifierByType(src, "license")
    local result = MySQL.prepare.await('SELECT * FROM characters WHERE license = ? AND citizenid = ?', { license, citizenid })
    if not result then
        return print("[RPX] Character not found. (rpx-core server error code 1)")
    end

    local dbdata = result
    dbdata.charinfo = json.decode(dbdata.charinfo)
    dbdata.skin = json.decode(dbdata.skin)
    dbdata.clothes = json.decode(dbdata.clothes)
    dbdata.job = json.decode(dbdata.job)
    dbdata.gang = json.decode(dbdata.gang)
    dbdata.money = json.decode(dbdata.money)
    dbdata.metadata = json.decode(dbdata.metadata)
    dbdata.position = json.decode(dbdata.position)

    RPX.Players[src] = CreatePlayer(src, dbdata)

    RPX.Logs.AddLog("framework", 
        ("Player %s (%s) has logged into their character %s %s (%s)"):format(RPX.Players[src].name, src, dbdata.charinfo.firstname, dbdata.charinfo.lastname, dbdata.citizenid)
    )
    
    ---@cast src number

    RPX.UpdateStateBags(src)
    TriggerClientEvent("CLIENT:MultiCharacter:CharacterSelected", src, dbdata, false)
    TriggerClientEvent("CLIENT:RPX:PlayerLoaded", src)
    TriggerEvent("SERVER:RPX:PlayerLoaded", src, RPX.Players[src])
end

--- Create a new character.
---@param src string | number The player's server id.
---@param info table The character's information.
---@param slot number The character's slot.
RPX.Player.CreateCharacter = function(src, info, slot)
    ---@cast src string
    local license = GetPlayerIdentifierByType(src, "license")

    local NewCharacterData = {}
    NewCharacterData.charinfo = info
    NewCharacterData.slot = slot
    RPX.Players[src] = CreatePlayer(src, NewCharacterData)

    local PlayerInfo = RPX.Players[src]
    
    MySQL.execute('INSERT INTO characters (`license`, `citizenid`, `slot`, `charinfo`, `skin`, `clothes`, `job`, `gang`, `money`, `metadata`, `position`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        license,
        PlayerInfo.citizenid,
        slot,
        json.encode(PlayerInfo.charinfo),
        json.encode(PlayerInfo.skin),
        json.encode(PlayerInfo.clothes),
        json.encode(PlayerInfo.job),
        json.encode(PlayerInfo.gang),
        json.encode(PlayerInfo.money),
        json.encode(PlayerInfo.metadata),
        json.encode(PlayerInfo.position)
    })

    RPX.Logs.AddLog("framework", 
        ("Player %s (%s) has created character %s %s (%s)"):format(PlayerInfo.name, src, info.firstname, info.lastname, PlayerInfo.citizenid)
    )

    RPX.UpdateStateBags(src)
    PlayerInfo.position = Internal_Config.DefaultPosition

    ---@cast src number
    TriggerClientEvent("CLIENT:MultiCharacter:CharacterSelected", src, PlayerInfo, true)

    TriggerClientEvent("rpx-appearance:client:newPlayer", src)
end

--- Delete a character from the database.
---@param src string | number The player's source.
---@param citizenid string The citizenid of the character to delete.
RPX.Player.DeleteCharacter = function(src, citizenid)
    ---@cast src string
    local license = GetPlayerIdentifierByType(src, "license")
    MySQL.execute('DELETE FROM characters WHERE license = ? AND citizenid = ?', { license, citizenid })
    RPX.Logs.AddLog("framework", 
        ("Player %s (%s) has deleted character ID %s"):format(GetPlayerName(src), src, citizenid)
    )
end

---Saves the player's data to the database.
---@param src number The player's source.
RPX.Player.Save = function(src)
    if RPX.Players[src] then
        local PlayerInfo = RPX.Players[src]
        MySQL.execute('UPDATE characters SET charinfo = ?, skin = ?, clothes = ?, job = ?, gang = ?, money = ?, metadata = ?, position = ? WHERE license = ? AND citizenid = ?', {
            json.encode(PlayerInfo.charinfo),
            json.encode(PlayerInfo.skin),
            json.encode(PlayerInfo.clothes),
            json.encode(PlayerInfo.job),
            json.encode(PlayerInfo.gang),
            json.encode(PlayerInfo.money),
            json.encode(PlayerInfo.metadata),
            json.encode(PlayerInfo.position),
            PlayerInfo.license,
            PlayerInfo.citizenid
        })
    end
end

--- Logs the player out and saves their data.
---@param src number The player's source.
RPX.Player.Logout = function(src)
    if RPX.Players[src] then
        RPX.Player.Save(src)
        RPX.Players[src] = nil
        Player(src).state:set("isLoggedIn", false, true)
    end
end

--- Generate a citizen id.
---@return string CitizenId The citizen id.
RPX.Player.GenerateCitizenId = function()
    local Length = Internal_Config.CitizenIDLength
    local GoodCitizenIdFound = false
    local CitizenId = ""
    local charset = {}  do -- [0-9A-Z]
        for c = 48, 57  do table.insert(charset, string.char(c)) end
        for c = 97, 122 do table.insert(charset, string.char(c)) end
    end
    while not GoodCitizenIdFound do
        CitizenId = ""
        math.randomseed(os.time())
        for i = 1, Length do
            CitizenId = CitizenId .. "" .. charset[math.random(1, #charset)]
        end

        CitizenId = string.upper(CitizenId) -- Make sure it's uppercase. I could have changed the charset, but meh.

        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM characters WHERE citizenid = ?', { CitizenId })
        if result == 0 then
            GoodCitizenIdFound = true
        end
    end
    return CitizenId
end
