RPX = {}

---@class RPX
---@field Config table
---@field Shared table
---@field Prompts table
---@field Debug table
---@field Logs table
---@field LogData table
---@field Player table
---@field Database table
---@field Players table
---@field ServerCallbacks table
---@field Permissions table
---@field UpdateStateBags function

RPX.Config = InternalConfig
RPX.Shared = InternalShared
RPX.Prompts = InternalPrompts
RPX.Debug = Internal_DebugLibrary
RPX.Logs = {}
RPX.LogData = {}
RPX.Player = {}
RPX.Database = {}
RPX.Players = {}
RPX.ServerCallbacks = {}

exports('GetObject', function()
    return RPX
end)

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

-- Database Initialization - This eliminates the need for SQL that you would normally have to run on your own.
CreateThread(function()
    RPX.Database.Init()
end)

-- Kick players who don't have a license identifier.
RegisterServerEvent('playerConnecting', function(name, setKickReason)
	local src = source --[[@as string]]
	if not GetPlayerIdentifierByType(src, "license") then
		setKickReason("Could not find 'license' identifier, please relaunch RedM.")
		CancelEvent()
	end
end)

-- Callbacks
function CreateCallback(name, cb)
    RPX.ServerCallbacks[name] = cb
end
exports('CreateCallback', CreateCallback)

function TriggerCallback(name, source, cb, ...)
    if not RPX.ServerCallbacks[name] then return end
    RPX.ServerCallbacks[name](source, cb, ...)
end
exports('TriggerCallback', TriggerCallback)

-- For Discord Rich Presence
CreateThread(function()
    GlobalState.MaxPlayers = Internal_Config.MaxPlayers
    GlobalState.PlayerCount = 0
    while true do
        Wait(10000)
        GlobalState.PlayerCount = #GetPlayers()
    end
end)