local ConnectedPlayers = {}

TP = function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil and args[2] == nil and args[3] == nil then
            if DoesEntityExist(GetPlayerPed(args[1])) then
                local toCoords = GetEntityCoords(GetPlayerPed(args[1]))
                SetEntityCoords(GetPlayerPed(source), toCoords --[[@as number]])
                lib.notify(source, { title = "Teleported to "..GetPlayerName(args[1]).." ["..args[1].."]", type = "success" })
            else
                lib.notify(source, { title = "Player offline?", type = "error" })
            end
        elseif args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
            SetEntityCoords(GetPlayerPed(source), 
                tonumber(args[1]) --[[@as number]],
                tonumber(args[2]) --[[@as number]],
                tonumber(args[3]) --[[@as number]]
            )
            lib.notify(source, { title = ("Teleported to %2.f, %2.f, %2.f"):format(tonumber(args[1]), tonumber(args[2]), tonumber(args[3])), type = "success" })
        else
            lib.notify(source, { title = "/tp [Player ID / X] [Y (optional)] [Z (optional)]", type = "error" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end
RegisterCommand("tp", TP, false)
RegisterCommand("goto", TP, false)

RegisterCommand("spec", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil then
            if args[1] == "off" then
                TriggerClientEvent("RPXAdmin:client:StopSpectating", source)
            else
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local PlayerPos = GetEntityCoords(GetPlayerPed(tonumber(args[1]) --[[@as number]]))
                    local Entity = NetworkGetNetworkIdFromEntity(GetPlayerPed(tonumber(args[1]) --[[@as number]]))
                    if PlayerPos then
                        TriggerClientEvent("RPXAdmin:client:Spectate", source, PlayerPos, tonumber(args[1]))
                    end
                end
            end
        else
            lib.notify(source, { title = "Usage:", description = "/spec [Player ID / off]", type = "error" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end, false)

RegisterNetEvent("RPXAdmin:server:RequestAdminSpec", function(source, targetplayer)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if targetplayer ~= nil then
            if targetplayer == "off" then
                TriggerClientEvent("RPXAdmin:client:StopSpectating", source)
            else
                local Target = RPX.GetPlayer(targetplayer)
                if Target then
                    local PlayerPos = GetEntityCoords(GetPlayerPed(tonumber(targetplayer) --[[@as number]]))
                    local Entity = NetworkGetNetworkIdFromEntity(GetPlayerPed(tonumber(targetplayer)--[[@as number]]))
                    if PlayerPos then
                        TriggerClientEvent("RPXAdmin:client:Spectate", source, PlayerPos, tonumber(targetplayer))
                    end
                end
            end
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

RegisterCommand("feedme", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        Player.SetMetaData("hunger", 100)
        Player.SetMetaData("thirst", 100)
        Player.SetMetaData("stress", 0)
        lib.notify(source, { title = "Fed and watered.", type = "success" })
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end, false)

RegisterCommand("bring", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil then
            if DoesEntityExist(GetPlayerPed(args[1])) then
                local toCoords = GetEntityCoords(GetPlayerPed(source))
                SetEntityCoords(GetPlayerPed(args[1]), toCoords --[[@as number]])
                lib.notify(source, { title = "Teleported "..GetPlayerName(args[1]).." ["..args[1].."] to you", type = "success" })
            else
                lib.notify(source, { title = "Player offline?", type = "error" })
            end
        else
            lib.notify(source, { title = "Usage:", description = "/bring [Player ID]", type = "error" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end, false)

RegisterCommand("tpm", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        TriggerClientEvent("RPXAdmin:client:TeleportToMarker", source)
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end, false)

RegisterCommand("announce", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        local msg = table.concat(args, " ")
        for _,target in pairs(GetPlayers()) do
            lib.notify(tonumber(target) --[[@as number]], { title = "SERVER ANNOUNCEMENT", description = msg, type = "inform" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

RegisterCommand("balances", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] then
            local Target = RPX.GetPlayer(args[1])
            if Target then
                local title = ("Balances for %s (%s %s)"):format(GetPlayerName(tonumber(args[1]) --[[@as number]]), Target.charinfo.firstname, Target.charinfo.lastname)
                local description = ("Cash: $%s, Bank: $%s"):format(Target.money.cash, Target.money.bank)
                lib.notify(source, { title = title, description = description, type = "inform" })
            else
                lib.notify(source, { title = "Player not logged in.", type = "error" })
            end
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

RegisterCommand("say", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] and args[2] then
            local id = args[1]
            table.remove(args, 1)
            local msg = table.concat(args, " ")
            lib.notify(tonumber(id) --[[@as number]], { title = "STAFF MESSAGE", description = msg, type = "inform" })
            lib.notify(source, { title = "Sent message to "..GetPlayerName(id).." ("..Player.charinfo.firstname.." "..Player.charinfo.lastname..")", type = "success" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

DeleteHorse = function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        TriggerClientEvent("RPXAdmin:client:DeleteVehicleAdmin", source)
    else
        TriggerClientEvent("RPXAdmin:client:DeleteVehicle", source)
    end
end
RegisterCommand("dv", DeleteHorse)
RegisterCommand("dh", DeleteHorse)

RegisterCommand("setrb", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil and args[2] ~= nil then
            if DoesEntityExist(GetPlayerPed(tonumber(args[1]) --[[@as number]])) then
                SetPlayerRoutingBucket(args[1], tonumber(args[2]) --[[@as number]])
            else
                lib.notify(source, { title = "Player offline?", type = "error" })
            end
            lib.notify(source, { title = "Usage:", description = "/setrb [Player ID] [Routing Bucket #]", type = "error" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

RegisterCommand("kick", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil and args[2] ~= nil then
            local targetId = args[1]
            table.remove(args, 1)
            local reason = table.concat(args, " ")
            DropPlayer(targetId, reason)
        else
            lib.notify(source, { title = "Usage:", description = "/kick [Player ID] [Reason]", type = "error" })
        end
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

RegisterCommand("pedscale", function(source, args)
    if args[1] then
        local Player = RPX.GetPlayer(source)
        if not Player then return end
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if tonumber(args[1]) > 0.2 and tonumber(args[1]) < 2.0 then
                TriggerClientEvent("RPXAdmin:client:SetScale", source, tonumber(args[1]))
            else
                lib.notify(source, {title = "Scale out of bounds. 0.2 - 2.0", type = "error"})
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    else
        lib.notify(source, { title = "Usage:", description = "/pedscale [Scale 0.2-2.0]", type = "error" })
    end
end)

RegisterCommand("invis", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        TriggerClientEvent("RPXAdmin:client:SetInvis", source)
    else
        lib.notify(source, { title = "Insufficient permissions.", type = "error" })
    end
end)

RegisterCommand("setgroup", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "superadmin" or IsPlayerAceAllowed(source, 'command') then
            if args[1] and args[2] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local group = args[2]
                    if group == "admin" or group == "superadmin" or group == "user" then
                        RPX.Players[tonumber(args[1])].permissiongroup = group
                        RPX.Permissions.SetPermissionGroup(tonumber(args[1]) --[[@as number]], group)
                        lib.notify(source, { title = "Set ".. GetPlayerName(tonumber(args[1]) --[[@as number]]) .."'s group to <strong style=\"color:gold\">"..group.."</strong>!", type = "success" })
                    end
                else
                    lib.notify(source, {title = "Player not found or isn't logged in.", type = "error"})
                end
            else
                lib.notify(source, { title = "Usage:", description = "/setgroup [Player ID] [Group]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("setmoney", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local amount = tonumber(args[2])
                    if amount > 0 then
                        Target.SetMoney("cash", tonumber(args[2]))

                        lib.notify(source, { title = "Set ".. Player.charinfo.fullname .."'s cash to <strong style=\"color:lime\">$".. RPX.CommaValue(string.format("%.2f", amount)).."</strong>!", type = "success" })
                        lib.notify(tonumber(args[1]) --[[@as number]], { title = "Staff set your cash to <strong style=\"color:lime\">$"..RPX.CommaValue(string.format("%.2f", amount)).."</strong>!", type = "success" })
                    end
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/setmoney [Player ID] [Amount]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("setjob", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] and args[3] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local job, rank = args[2], args[3]

                    Target.SetJob(job, rank)

                    TriggerClientEvent("redem_roleplay:JobChange", tonumber(args[1]) --[[@as number]], job)
                    lib.notify(source, { title = "Set "..Target.charinfo.fullname.."'s job to "..job.." (Rank "..rank..")", type = "success" })
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/setjob [Player ID] [Job] [Rank]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("setgang", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] and args[3] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local gang, rank = args[2], args[3]

                    Target.SetGang(gang, rank)

                    TriggerClientEvent("redem_roleplay:GangChange", tonumber(args[1]) --[[@as number]], gang)
                    lib.notify(source, { title = "Set "..Target.charinfo.fullname.."'s gang to "..gang.." (Rank "..rank..")", type = "success" })
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/setgang [Player ID] [Gang] [Rank]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("addmoney", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local amount = tonumber(args[2])
                    if amount > 0 then
                        Target.AddMoney("cash", tonumber(args[2]))

                        lib.notify(source, { title = "Added <strong style=\"color:lime\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> to ".. Target.charinfo.fullname .."!", type = "success" })
                        lib.notify(tonumber(args[1]) --[[@as number]], { title = "Staff gave you <strong style=\"color:lime\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong>!", type = "success" })
                    end
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/addmoney [Player ID] [Amount]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("addbankmoney", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local amount = tonumber(args[2])
                    if amount > 0 then

                        Target.AddMoney("bank", tonumber(args[2]))

                        lib.notify(source, {title = "Added <strong style=\"color:lime\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank to ".. Target.charinfo.fullname .."!", type = "success" })
                        lib.notify(tonumber(args[1]) --[[@as number]], {title = "Staff gave you <strong style=\"color:lime\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank money!", type = "success" })
                    end
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/addbankmoney [Player ID] [Amount]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("removemoney", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local amount = tonumber(args[2])
                    if amount > 0 then

                        Target.RemoveMoney(tonumber(args[2]))

                        lib.notify(source, { title = "Removed <strong style=\"color:red\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> cash from ".. Target.charinfo.fullname .."!", type = "success" })
                        lib.notify(tonumber(args[1]) --[[@as number]], { title = "Staff removed <strong style=\"color:red\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong> cash from you!", type = "error" })
                    end
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/removemoney [Player ID] [Amount]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)

RegisterCommand("removebankmoney", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player then
        if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
            if args[1] and args[2] then
                local Target = RPX.GetPlayer(args[1])
                if Target then
                    local amount = tonumber(args[2])
                    if amount > 0 then
                        Target.RemoveMoney('bank', tonumber(args[2]))
                        
                        lib.notify(source, { title = "Removed <strong style=\"color:red\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank money from ".. Target.charinfo.fullname .."!", type = "success" })
                        lib.notify(tonumber(args[1]) --[[@as number]], { title = "Staff removed <strong style=\"color:red\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank money from you!", type = "error" })
                    end
                else
                    lib.notify(source, { title = "Player not found or isn't logged in.", type = "error" })
                end
            else
                lib.notify(source, { title = "Usage:", description = "/removebankmoney [Player ID] [Amount]", type = "error" })
            end
        else
            lib.notify(source, { title = "Insufficient permissions.", type = "error" })
        end
    end
end)