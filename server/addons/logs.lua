RPX.LogTypes = {
    ["framework"] = "",
    ["charselect"] = "",
    ["banking"] = "",
}

RPX.Logs.AddLog = function(type, message)
    local date = os.date("%d/%m/%Y %X")
    local log = "[" .. date .. "] [" .. type .. "] " .. message
    if not RPX.LogTypes[type] then
        return
    end
    if not RPX.LogData[type] then
        RPX.LogData[type] = {}
    end
    table.insert(RPX.LogData[type], log)
    print("[RPX Logs] ".. log)
end

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        CreateThread(function()
            for k,v in pairs(RPX.LogTypes) do
                SaveResourceFile(GetCurrentResourceName(), k .. ".log", json.encode(RPX.LogData[k]), -1)
            end
        end)
    end
end)
