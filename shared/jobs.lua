InternalShared = InternalShared or {}

-- For permission information see the README or config of the corresponding job resource.

InternalShared.Jobs = {
    ["sheriff"] = {
        Label = "Sheriff",
        BossMenus = {
            vector3(-278.3653, 806.05792, 119.38008),
        },
        Ranks = {
            [1] = {
                Label = "Deputy",
                Salary = 10,
                Permissions = {
                    "sheriff:general", "sheriff:mdt", "sheriff:lockers"
                }
            },
            [2] = {
                Label = "Sergeant",
                Salary = 15,
                Permissions = {
                    "sheriff:general", "sheriff:mdt", "sheriff:lockers"
                }
            },
            [3] = {
                Label = "Lieutenant",
                Salary = 20,
                Permissions = {
                    "sheriff:general", "sheriff:mdt", "sheriff:lockers"
                }
            },
            [4] = {
                Label = "Captain",
                Salary = 25,
                Permissions = {
                    "sheriff:general", "sheriff:mdt", "sheriff:lockers", "generic:bossmenu"
                }
            },
            [5] = {
                Label = "Sheriff",
                Salary = 30,
                Permissions = {
                    "sheriff:general", "sheriff:mdt", "sheriff:lockers", "generic:bossmenu"
                }
            }
        }
    },
}

GlobalState.Shared_Jobs = InternalShared.Jobs

---Export to check if a player has a job related permission. This prevents having to check for a list of each type of job in each resource.
---@param jobName string
---@param rank number
---@param permission string
---@return boolean
exports('HasJobPermission', function(jobName, rank, permission)
    if InternalShared.Jobs[jobName] and InternalShared.Jobs[jobName].Ranks[rank] and InternalShared.Jobs[jobName].Ranks[rank].Permissions then
        for _, perm in pairs(InternalShared.Jobs[jobName].Ranks[rank].Permissions) do
            if perm == permission then
                return true
            end
        end
    end
    return false
end)