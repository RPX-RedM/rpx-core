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