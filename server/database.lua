RPX.Database.Tables = {
    {
        name = "characters",
        query = [[
            CREATE TABLE IF NOT EXISTS `characters` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `license` VARCHAR(255), 
                `citizenid` VARCHAR(12), 
                `slot` int(11),
                `charinfo` TEXT, 
                `skin` TEXT, 
                `clothes` TEXT, 
                `job` TEXT, 
                `gang` TEXT, 
                `money` TEXT, 
                `metadata` TEXT, 
                `position` TEXT, 
                `inventory` longtext DEFAULT NULL,
                `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                PRIMARY KEY (`citizenid`),
                KEY `id` (`id`),
                KEY `last_updated` (`last_updated`),
                KEY `license` (`license`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1;
        ]],
    },
    {
        name = "permissions",
        query = [[
            CREATE TABLE IF NOT EXISTS `permissions` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `license` VARCHAR(255), 
                `group` VARCHAR(12), 
                PRIMARY KEY (`license`),
                KEY `id` (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1;
        ]],
    },
    { 
        name = "outfits",
        query = [[
            CREATE TABLE IF NOT EXISTS `outfits` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `citizenid` varchar(50) DEFAULT NULL,
                `outfitname` varchar(50) NOT NULL,
                `skin` text DEFAULT NULL,
                `outfitId` varchar(50) NOT NULL,
                PRIMARY KEY (`id`),
                KEY `citizenid` (`citizenid`),
                KEY `outfitId` (`outfitId`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1;
        ]],
    },
    {
        name = "inventory_stashes",
        query = [[
            CREATE TABLE IF NOT EXISTS `inventory_stashes` (
                `owner` varchar(60) DEFAULT NULL,
                `name` varchar(100) NOT NULL,
                `data` longtext DEFAULT NULL,
                `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                UNIQUE KEY `owner` (`owner`,`name`)
            );
        ]],
    },
    {
        name = "horses",
        query = [[
            CREATE TABLE IF NOT EXISTS `horses` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `cid` varchar(50) NOT NULL,
                `selected` int(11) NOT NULL DEFAULT 0,
                `model` varchar(50) NOT NULL,
                `name` varchar(50) NOT NULL,
                `components` varchar(512) NOT NULL DEFAULT '{}',
                `metadata` varchar(512) NOT NULL DEFAULT '{}',
                PRIMARY KEY (`id`)
            );
        ]],
    }
}

CreateThread(function()
    MySQL.ready(function()
        for _,table in pairs(RPX.Database.Tables) do
            MySQL.Async.execute(table.query, {}, function()
                print(("RPX: Database table %s initialized"):format(table.name))
            end)
        end
    end)
end)
