local selfExports = exports[GetCurrentResourceName()]

RegisterCommand("duty", function(source, args)
	local char = RPX.GetPlayer(source)
    if not char then return end
	if selfExports:HasJobPermission(char.job.name, char.job.rank, "sheriff:general")
	or selfExports:HasJobPermission(char.job.name, char.job.rank, "doctor:general" ) then
		char.SetJobDuty(not char.job.duty)
		lib.notify(source, {title = "You are now "..(not char.job.duty and "on" or "off").." duty.", type = "success"})
	end
end)

RegisterCommand("quitjob", function(source, args)
    local char = RPX.GetPlayer(source)
    if not char then return end
    if char.job.name ~= "unemployed" then
        char.SetJob("unemployed", 0)
        lib.notify(source, {title = "You are now unemployed!", type = "success"})
    end
end)

RegisterCommand("job", function(source, args)
    local char = RPX.GetPlayer(source)
    if not char then return end
    if char.job == "unemployed" then
        lib.notify(source, {title = "No Job!", description = "You are unemployed!", type = "error" })
    else
        if not char.job then
            lib.notify(source, {title = "Unknown Job", description = "Your job is not set up properly!", type = "error" })
            return
        end
        local jobLabel = InternalShared.Jobs[char.job.name].Label or ""
        local jobRank = InternalShared.Jobs[char.job.name].Ranks[char.job.rank].Label or char.job.rank
        if char.job.duty then
            lib.notify(source, {title = "Current Job", description = jobLabel.." ".. jobRank.." ("..char.job.name.." "..char.job.rank..") [ON DUTY]", type = "inform" })
        else
            lib.notify(source, {title = "Current Job", description = jobLabel.." ".. jobRank.." ("..char.job.name.." "..char.job.rank..") [OFF DUTY]", type = "inform" })
        end
    end
end)