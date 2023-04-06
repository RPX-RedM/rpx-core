InternalShared = InternalShared or {}

-- For permission information see the README or config of the corresponding job resource.

InternalShared.Jobs = {
    ["sheriff"] = {
        Label = "Sheriff",
        BossMenus = {
            vector3(0.0, 0.0, 0.0),
        },
        Ranks = {
            [1] = {
                Label = "Deputy",
                Salary = 10,
                Permissions = {
                    ["police:cuff"] = true,
                    ["police:hogtie"] = true,
                    ["police:jail"] = true,
                    ["police:mdt"] = true,
                    ["police:lockers"] = true,
                }
            },
            [2] = {
                Label = "Sergeant",
                Salary = 15,
                Permissions = {
                    ["police:cuff"] = true,
                    ["police:hogtie"] = true,
                    ["police:jail"] = true,
                    ["police:mdt"] = true,
                    ["police:lockers"] = true,
                }
            },
            [3] = {
                Label = "Lieutenant",
                Salary = 20,
                Permissions = {
                    ["police:cuff"] = true,
                    ["police:hogtie"] = true,
                    ["police:jail"] = true,
                    ["police:mdt"] = true,
                    ["police:lockers"] = true,
                }
            },
            [4] = {
                Label = "Captain",
                Salary = 25,
                Permissions = {
                    ["police:cuff"] = true,
                    ["police:hogtie"] = true,
                    ["police:jail"] = true,
                    ["police:mdt"] = true,
                    ["police:lockers"] = true,
                    ["police:bossmenu"] = true,
                }
            },
            [5] = {
                Label = "Sheriff",
                Salary = 30,
                Permissions = {
                    ["police:cuff"] = true,
                    ["police:hogtie"] = true,
                    ["police:jail"] = true,
                    ["police:mdt"] = true,
                    ["police:lockers"] = true,
                    ["police:bossmenu"] = true,
                }
            }
        }
    },
}