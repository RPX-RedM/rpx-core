---@class Player
---@field source number
---@field license string
---@field name string
---@field citizenid string
---@field permissiongroup string
---@field slot number
---@field charinfo table
---@field skin table
---@field clothes table
---@field job table
---@field gang table
---@field money table
---@field metadata table
---@field position table
---@field SetMoney function
---@field GetMoney function
---@field AddMoney function
---@field RemoveMoney function
---@field SetJob function
---@field SetJobDuty function
---@field SetGang function
---@field SetSkinData function
---@field SetClothesData function
---@field SetMetaData function
---@field Save function


--- Create the player object.
---@param src any
---@param dbdata any
---@return Player 
CreatePlayer = function(src, dbdata) -- For some reason, this function doesn't seem to work if it's inside the RPX.Player table. I have no idea why.
    local self = {}
    self.source = src
    self.license = GetPlayerIdentifierByType(self.source, "license")
    self.name = GetPlayerName(self.source)
    self.citizenid = dbdata.citizenid or RPX.Player.GenerateCitizenId()
    self.permissiongroup = RPX.Permissions.GetPermissionGroup(self.source)
    self.slot = dbdata.slot or 1 -- Default slot

    self.charinfo = dbdata.charinfo or {}
    self.charinfo.firstname = self.charinfo.firstname or "John" -- Default name
    self.charinfo.lastname = self.charinfo.lastname or "Doe" -- Default name
    self.charinfo.fullname = ("%s %s"):format(self.charinfo.firstname, self.charinfo.lastname)
    self.charinfo.age = self.charinfo.age or 18 -- 18 is the default age
    self.charinfo.gender = self.charinfo.gender or 1 -- 1 = Male, 0 = Female
    self.charinfo.height = self.charinfo.height or 178 -- 178cm is the default height

    self.skin = dbdata.skin or {}
    self.clothes = dbdata.clothes or {}

    self.job = dbdata.job or {}
    self.job.name = self.job.name or "unemployed" -- Default job
    self.job.rank = tonumber(self.job.rank) or 0 -- Default rank
    self.job.duty = false

    self.gang = dbdata.gang or {}
    self.gang.name = self.gang.name or "none" -- Default gang
    self.gang.rank = tonumber(self.gang.rank) or 0 -- Default rank

    self.money = dbdata.money or {}
    self.money.cash = tonumber(self.money.cash) or Internal_Config.Player.StartingCash
    self.money.bank = tonumber(self.money.bank) or Internal_Config.Player.StartingBank

    self.metadata = dbdata.metadata
    if self.metadata == nil then self.metadata = {} end
    if not self.metadata.thirst then self.metadata.thirst = 100 end
    if not self.metadata.hunger then self.metadata.hunger = 100 end
    if not self.metadata.stress then self.metadata.stress = 0 end
    if not self.metadata.health then self.metadata.health = 100 end
    if not self.metadata.stamina then self.metadata.stamina = 100 end

    self.position = dbdata.position or Internal_Config.Player.DefaultPosition

    -- Functions
    self.SetMoney = function(type, amount)
        if self.money[type] then
            self.money[type] = amount
            if type == "cash" then
                TriggerEvent("SERVER:RPX:OnCashChanged", self.source, self.money[type])
            end
            RPX.UpdateStateBags(self.source)
        end
    end

    self.AddMoney = function(type, amount)
        if self.money[type] then
            self.money[type] = self.money[type] + tonumber(amount)
            TriggerClientEvent("hud:client:OnMoneyChange", self.source, type, amount, false)
            if type == "cash" then
                TriggerEvent("SERVER:RPX:OnCashChanged", self.source, self.money[type])
            end
            RPX.UpdateStateBags(self.source)
        end
    end

    self.RemoveMoney = function(type, amount)
        if self.money[type] then
            self.money[type] = self.money[type] - tonumber(amount)
            TriggerClientEvent("hud:client:OnMoneyChange", self.source, type, amount, true)
            if type == "cash" then
                TriggerEvent("SERVER:RPX:OnCashChanged", self.source, self.money[type])
            end
            RPX.UpdateStateBags(self.source)
        end
    end

    self.SetJob = function(job, rank)
        self.job.name = job
        self.job.rank = tonumber(rank)
        RPX.UpdateStateBags(self.source) -- Not a huge fan of repeating this in every setter function. Not sure how to refactor yet.
    end

    self.SetJobDuty = function(jobDuty)
        self.job.duty = jobDuty
        RPX.UpdateStateBags(self.source)
    end

    self.SetGang = function(gang, rank)
        self.gang.name = gang
        self.gang.rank = tonumber(rank)
        RPX.UpdateStateBags(self.source)
    end

    self.SetMetaData = function(key, value)
        self.metadata[key] = value
        RPX.UpdateStateBags(self.source)
    end

    self.SetSkinData = function(data) 
        self.skin = data
        RPX.UpdateStateBags(self.source)
    end

    self.SetClothesData = function(data)
        self.clothes = data
        RPX.UpdateStateBags(self.source)
    end

    self.Save = function()
        RPX.Player.Save(self.source)
    end

    self.UpdateStateBags = function()
        RPX.UpdateStateBags(self.source)
    end

    return self
end