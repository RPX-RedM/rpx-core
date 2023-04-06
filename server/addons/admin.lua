RPX = exports['rpx-core']:GetObject()

local ConnectedPlayers = {}

TP = function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil and args[2] == nil and args[3] == nil then
            if DoesEntityExist(GetPlayerPed(args[1])) then
                local toCoords = GetEntityCoords(GetPlayerPed(args[1]))
                SetEntityCoords(GetPlayerPed(source), toCoords)
                RPX.func.pNotifyRight(source, "Teleported to "..GetPlayerName(args[1]).." ["..args[1].."]", 3000)
            else
                RPX.pNotifyRight(source, "Player offline?", 3000)
            end
        elseif args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
            SetEntityCoords(GetPlayerPed(source), tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
            RPX.pNotifyRight(source, "/tp [Player ID / X] [Y (optional)] [Z (optional)]", 3000)
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
                    local PlayerPos = GetEntityCoords(GetPlayerPed(tonumber(args[1])))
                    local Entity = NetworkGetNetworkIdFromEntity(GetPlayerPed(tonumber(args[1])))
                    if PlayerPos then
                        TriggerClientEvent("RPXAdmin:client:Spectate", source, PlayerPos, tonumber(args[1]))
                    end
                end
            end
        else
            RPX.pNotifyRight(source, "/spec [Player ID / off]", 3000)
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
                    local PlayerPos = GetEntityCoords(GetPlayerPed(tonumber(targetplayer)))
                    local Entity = NetworkGetNetworkIdFromEntity(GetPlayerPed(tonumber(targetplayer)))
                    if PlayerPos then
                        TriggerClientEvent("RPXAdmin:client:Spectate", source, PlayerPos, tonumber(targetplayer))
                    end
                end
            end
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
    end
end)

RegisterCommand("feedme", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        Player.func.SetMetaData("hunger", 100)
        Player.func.SetMetaData("thirst", 100)
        Player.func.SetMetaData("stress", 0)
        RPX.pNotifyRight(source, "Fed and watered.", 3000)
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
    end
end, false)

RegisterCommand("bring", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] ~= nil then
            if DoesEntityExist(GetPlayerPed(args[1])) then
                local toCoords = GetEntityCoords(GetPlayerPed(source))
                SetEntityCoords(GetPlayerPed(args[1]), toCoords)
                RPX.pNotifyRight(source, "Teleported "..GetPlayerName(args[1]).." ["..args[1].."] to you", 3000)
            else
                RPX.pNotifyRight(source, "Player offline?", 3000)
            end
        else
            RPX.pNotifyRight(source, "/bring [Player ID]", 3000)
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
    end
end, false)

RegisterCommand("tpm", function(source, args, rawCommand)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        TriggerClientEvent("RPXAdmin:client:TeleportToMarker", source)
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
    end
end, false)

RegisterCommand("announce", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        local msg = table.concat(args, " ")
        --TriggerClientEvent('chatMessage', -1, "SYSTEM", "error", "^3"..msg)
        RPX.NotifyLeft(-1, "SERVER ANNOUNCEMENT", msg, "menu_textures", "menu_icon_alert", 10000)
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
    end
end)

RegisterCommand("balances", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        if args[1] then
            local Target = RPX.GetPlayer(args[1])
            if Target then
                RPX.pNotifyRight(source, GetPlayerName(tonumber(args[1]).." ("..Target.firstname.." "..Target.lastname.." cash: $"..Target.money.cash..", bank: $"..Target.money.bank), 3000)
            else
                RPX.pNotifyRight(source, "Player not logged in.", 3000)
            end
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
            RPX.NotifyLeft(tonumber(id), "STAFF MESSAGE", msg, "menu_textures", "menu_icon_alert", 10000)
            RPX.pNotifyRight(source, "Sent message to "..GetPlayerName(id).." ("..Player.firstname.." "..Player.lastname..")")
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
            if DoesEntityExist(GetPlayerPed(tonumber(args[1]))) then
                SetPlayerRoutingBucket(tonumber(args[1]), tonumber(args[2]))
            else
                RPX.pNotifyRight(source, "Player offline?", 3000)
            end
            RPX.pNotifyRight(source, "/setrb [Player ID] [Routing Bucket #]", 3000)
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
            RPX.pNotifyRight(source, "/kick [Player ID] [Reason]", 3000)
        end
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
                RPX.pNotifyRight(source, "Scale out of bounds. 0.2 - 2.0", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
        end
    else
        RPX.pNotifyRight(source, "/pedscale [Scale 0.2-2.0]", 3000)
    end
end)

RegisterCommand("invis", function(source, args)
    local Player = RPX.GetPlayer(source)
    if not Player then return end
    if Player.permissiongroup == "mod" or Player.permissiongroup == "admin" or Player.permissiongroup == "superadmin" then
        TriggerClientEvent("RPXAdmin:client:SetInvis", source)
    else
        RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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
                        RPX.Permissions.SetPermissionGroup(tonumber(args[1]), group)
                        RPX.pNotifyRight(source, "Set ".. GetPlayerName(tonumber(args[1])) .."'s group to <strong style=\"color:gold\">"..group.."</strong>!", 3000)
                    end
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/setgroup [Player ID] [Group]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                        RPX.pNotifyRight(source, "Set ".. Player.charinfo.fullname .."'s cash to <strong style=\"color:lime\">$".. RPX.CommaValue(string.format("%.2f", count)).."</strong>!", 3000)
                        RPX.pNotifyRight(tonumber(args[1]), "Staff set your cash to <strong style=\"color:lime\">$"..RPX.CommaValue(string.format("%.2f", count)).."</strong>!", 3000)
                    end
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/setmoney [Player ID] [Amount]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                    Target.func.SetJob(job, rank)

                    TriggerClientEvent("redem_roleplay:JobChange", tonumber(args[1]), job)
                    RPX.pNotifyRight(source, "Set "..Target.charinfo.fullname.."'s job to "..job.." (Rank "..rank..")", 3000)
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/setjob [Player ID] [Job] [Rank]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                    Target.func.SetGang(gang, rank)

                    TriggerClientEvent("redem_roleplay:GangChange", tonumber(args[1]), gang)
                    RPX.pNotifyRight(source, "Set "..Target.charinfo.fullname.."'s gang to "..gang.." (Rank "..rank..")", 3000)
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/setgang [Player ID] [Gang] [Rank]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                        Target.func.AddMoney("cash", tonumber(args[2]))

                        RPX.pNotifyRight(source, "Added <strong style=\"color:lime\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> to ".. Target.charinfo.fullname .."!", 3000)
                        RPX.pNotifyRight(tonumber(args[1]), "Staff gave you <strong style=\"color:lime\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong>!", 3000)
                    end
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/addmoney [Player ID] [Amount]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                        Target.func.AddMoney("bank", tonumber(args[2]))

                        RPX.pNotifyRight(source, "Added <strong style=\"color:lime\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank to ".. Target.charinfo.fullname .."!", 3000)
                        RPX.pNotifyRight(tonumber(args[1]), "Staff gave you <strong style=\"color:lime\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank money!", 3000)
                    end
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/addbankmoney [Player ID] [Amount]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                        RPX.pNotifyRight(source, "Removed <strong style=\"color:red\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> cash from ".. Target.charinfo.fullname .."!", 3000)
                        RPX.pNotifyRight(tonumber(args[1]), "Staff removed <strong style=\"color:red\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong> cash from you!", 3000)
                    end
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/removemoney [Player ID] [Amount]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
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

                        Target.RemoveBankMoney(tonumber(args[2]))
                        
                        RPX.pNotifyRight(source, "Removed <strong style=\"color:red\">$".. RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank money from ".. Target.charinfo.fullname .."!", 3000)
                        RPX.pNotifyRight(tonumber(args[1]), "Staff removed <strong style=\"color:red\">$"..RPX.CommaValue(string.format("%.2f", args[2])).."</strong> bank money from you!", 3000)
                    end
                else
                    RPX.pNotifyRight(source, "Player not found or isn't logged in.", 3000)
                end
            else
                RPX.pNotifyRight(source, "/removebankmoney [Player ID] [Amount]", 3000)
            end
        else
            RPX.pNotifyRight(source, "Insufficient permissions.", 3000)
        end
    end
end)