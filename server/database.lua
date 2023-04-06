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
        name = "stashitems",
        query = [[
            CREATE TABLE IF NOT EXISTS `stashitems` (
                `id` INT(11) NOT NULL AUTO_INCREMENT,
                `stash` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
                `items` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
                PRIMARY KEY (`stash`) USING BTREE,
                INDEX `id` (`id`) USING BTREE
            ) ENGINE=InnoDB AUTO_INCREMENT=1;
        ]],
    },
}

RPX.Database.Init = function()
    MySQL.ready(function()
        for _,table in pairs(RPX.Database.Tables) do
            MySQL.Async.execute(table.query, {}, function()
                print(("RPX: Database table %s initialized"):format(table.name))
            end)
        end
    end)
end