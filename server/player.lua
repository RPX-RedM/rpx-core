RPX.GetPlayer = function(src)
    local playerId = tonumber(src)
    if RPX.Players[playerId] then
        return RPX.Players[playerId]
    end
    return nil
end

RPX.Player.GetCharacters = function(src)
    local license = GetPlayerIdentifierByType(src, "license")
    local result = MySQL.Sync.fetchAll('SELECT * FROM characters WHERE license = ? ORDER BY slot', { license })
    if result then
        local characterList = {}
        for k,v in pairs(result) do
            characterList[k] = v
        end
        return characterList
    end
    return {}
end

RPX.Player.SelectCharacter = function(src, citizenid)
    local license = GetPlayerIdentifierByType(src, "license")
    local result = MySQL.prepare.await('SELECT * FROM characters WHERE license = ? AND citizenid = ?', { license, citizenid })
    if not result then
        return print("[RPX] Character not found. (rpx-core server error code 1)")
    end

    local dbdata = result
    dbdata.charinfo = json.decode(dbdata.charinfo)
    dbdata.skin = json.decode(dbdata.skin)
    dbdata.clothes = json.decode(dbdata.clothes)
    dbdata.job = json.decode(dbdata.job)
    dbdata.gang = json.decode(dbdata.gang)
    dbdata.money = json.decode(dbdata.money)
    dbdata.metadata = json.decode(dbdata.metadata)
    dbdata.position = json.decode(dbdata.position)

    RPX.Players[src] = CreatePlayer(src, dbdata)

    RPX.Logs.AddLog("framework", 
        ("Player %s (%s) has logged into their character %s %s (%s)"):format(RPX.Players[src].name, src, dbdata.charinfo.firstname, dbdata.charinfo.lastname, dbdata.citizenid)
    )
    
    RPX.UpdateStateBags(src)
    TriggerClientEvent("CLIENT:MultiCharacter:CharacterSelected", src, dbdata, false)
    TriggerClientEvent("CLIENT:RPX:PlayerLoaded", src)
    TriggerEvent("SERVER:RPX:PlayerLoaded", src, RPX.Players[src])
end

RPX.Player.CreateCharacter = function(src, info, slot)
    local license = GetPlayerIdentifierByType(src, "license")

    local NewCharacterData = {}
    NewCharacterData.charinfo = info
    NewCharacterData.slot = slot
    RPX.Players[src] = CreatePlayer(src, NewCharacterData)

    local PlayerInfo = RPX.Players[src]
    
    MySQL.execute('INSERT INTO characters (`license`, `citizenid`, `slot`, `charinfo`, `skin`, `clothes`, `job`, `gang`, `money`, `metadata`, `position`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        license,
        PlayerInfo.citizenid,
        slot,
        json.encode(PlayerInfo.charinfo),
        json.encode(PlayerInfo.skin),
        json.encode(PlayerInfo.clothes),
        json.encode(PlayerInfo.job),
        json.encode(PlayerInfo.gang),
        json.encode(PlayerInfo.money),
        json.encode(PlayerInfo.metadata),
        json.encode(PlayerInfo.position)
    })

    RPX.Logs.AddLog("framework", 
        ("Player %s (%s) has created character %s %s (%s)"):format(PlayerInfo.name, src, info.firstname, info.lastname, PlayerInfo.citizenid)
    )

    RPX.UpdateStateBags(src)
    PlayerInfo.position = Internal_Config.DefaultPosition
    TriggerClientEvent("CLIENT:MultiCharacter:CharacterSelected", src, PlayerInfo, true)
    
    TriggerClientEvent("rpx-appearance:client:newPlayer", src)    --TriggerClientEvent("CLIENT:RPX:PlayerLoaded", src)
    --TriggerEvent("SERVER:RPX:PlayerLoaded", src)
end

RPX.Player.DeleteCharacter = function(src, citizenid)
    local license = GetPlayerIdentifierByType(src, "license")
    MySQL.execute('DELETE FROM characters WHERE license = ? AND citizenid = ?', { license, citizenid })
    RPX.Logs.AddLog("framework", 
        ("Player %s (%s) has deleted character ID %s"):format(GetPlayerName(src), src, citizenid)
    )
end

RPX.UpdateStateBags = function(src)
    if RPX.Players[src] then
        local PlayerInfo = RPX.Players[src]
        Player(src).state:set("isLoggedIn", true, true)
        Player(src).state:set("name", ("%s %s"):format(PlayerInfo.charinfo.firstname, PlayerInfo.charinfo.lastname), true)
        Player(src).state:set("gender", PlayerInfo.charinfo.gender, true)
        Player(src).state:set("age", PlayerInfo.charinfo.age, true)
        Player(src).state:set("height", PlayerInfo.charinfo.height, true)
        Player(src).state:set("cash", PlayerInfo.money.cash, true)
        Player(src).state:set("bank", PlayerInfo.money.bank, true)
        Player(src).state:set("job", PlayerInfo.job, true)
        Player(src).state:set("gang", PlayerInfo.gang, true)
        Player(src).state:set("position", PlayerInfo.position, true)
        Player(src).state:set("skin", PlayerInfo.skin, true)
        Player(src).state:set("clothes", PlayerInfo.clothes, true)
        Player(src).state:set("metadata", PlayerInfo.metadata, true)
    end
end

RPX.Player.Save = function(src)
    if RPX.Players[src] then
        local PlayerInfo = RPX.Players[src]
        MySQL.execute('UPDATE characters SET charinfo = ?, skin = ?, clothes = ?, job = ?, gang = ?, money = ?, metadata = ?, position = ? WHERE license = ? AND citizenid = ?', {
            json.encode(PlayerInfo.charinfo),
            json.encode(PlayerInfo.skin),
            json.encode(PlayerInfo.clothes),
            json.encode(PlayerInfo.job),
            json.encode(PlayerInfo.gang),
            json.encode(PlayerInfo.money),
            json.encode(PlayerInfo.metadata),
            json.encode(PlayerInfo.position),
            PlayerInfo.license,
            PlayerInfo.citizenid
        })
    end
end

RPX.Player.Logout = function(src)
    if RPX.Players[src] then
        RPX.Player.Save(src)
        RPX.Players[src] = nil
        Player(src).state:set("isLoggedIn", false, true)
    end
end

RPX.Player.GenerateCitizenId = function()
    local Length = Internal_Config.CitizenIDLength
    local GoodCitizenIdFound = false
    local CitizenId = ""
    local charset = {}  do -- [0-9A-Z]
        for c = 48, 57  do table.insert(charset, string.char(c)) end
        for c = 97, 122 do table.insert(charset, string.char(c)) end
    end
    while not GoodCitizenIdFound do
        CitizenId = ""
        math.randomseed(os.time())
        for i = 1, Length do
            CitizenId = CitizenId .. "" .. charset[math.random(1, #charset)]
        end

        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM characters WHERE citizenid = ?', { CitizenId })
        if result == 0 then
            GoodCitizenIdFound = true
        end
    end
    return CitizenId
end

CreatePlayer = function(src, dbdata)
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
    self.job.rank = self.job.rank or 0 -- Default rank

    self.gang = dbdata.gang or {}
    self.gang.name = self.gang.name or "none" -- Default gang
    self.gang.rank = self.gang.rank or 0 -- Default rank

    self.money = dbdata.money or {}
    self.money.cash = self.money.cash or Internal_Config.Player.StartingCash
    self.money.bank = self.money.bank or Internal_Config.Player.StartingBank

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
            Player(self.source).state:set(type, self.money[type], true)
        end
    end

    self.AddMoney = function(type, amount)
        if self.money[type] then
            self.money[type] = self.money[type] + amount
            TriggerClientEvent("hud:client:OnMoneyChange", self.source, type, amount, false)
            Player(self.source).state:set(type, self.money[type], true)
        end
    end

    self.RemoveMoney = function(type, amount)
        if self.money[type] then
            self.money[type] = self.money[type] - amount
            TriggerClientEvent("hud:client:OnMoneyChange", self.source, type, amount, true)
            Player(self.source).state:set(type, self.money[type], true)
        end
    end

    self.SetJob = function(job, rank)
        self.job.name = job
        self.job.rank = rank
        Player(self.source).state:set("job", self.job, true)
    end

    self.SetGang = function(gang, rank)
        self.gang.name = gang
        self.gang.rank = rank
        Player(self.source).state:set("gang", self.gang, true)
    end

    self.SetMetaData = function(key, value)
        self.metadata[key] = value
        Player(self.source).state:set("metadata", self.metadata, true)
    end

    self.SetSkinData = function(data) 
        self.skin = data
    end

    self.SetClothesData = function(data)
        self.clothes = data
    end

    self.Save = function()
        RPX.Player.Save(self.source)
    end

    self.UpdateStateBags = function()
        RPX.UpdateStateBags(self.source)
    end

    return self
end