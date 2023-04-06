RPX = {}
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

RPX.Permissions = {}
RPX.Permissions.GetPermissionGroup = function(src)
    local license = GetPlayerIdentifierByType(src, "license")
    local group = "user"
    local result = MySQL.Sync.fetchAll("SELECT * FROM permissions WHERE license = @license", {["@license"] = license})
    if result[1] then
        group = result[1].group
        print("[RPX] Logging in staff member: " .. GetPlayerName(src) .. " (" .. license .. ") as " .. group)
    end
    return group
end

RPX.Permissions.SetPermissionGroup = function(src, group)
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

exports('GetObject', function()
    return RPX
end)

CreateThread(function()
    RPX.Database.Init()
end)

RegisterServerEvent('playerConnecting', function(name, setKickReason)
	local src = source
	if not GetPlayerIdentifierByType(src, "license") then
		setKickReason("Unable to find requested identifier: 'license', please relaunch RedM")
		CancelEvent()
	end
end)

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
    GlobalState.MaxPlayers = RPX.Config.MaxPlayers
    GlobalState.PlayerCount = 0
    while true do
        Wait(10000)
        GlobalState.PlayerCount = #GetPlayers()
        GetPlayer
    end
end) 