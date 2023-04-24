--
-- This is an addon script that will display a native location notification when changing zones.
--

-- Credit: VORP (outsider31000 & AndrewR3K) @ https://github.com/VORPCORE/vorp_zonenotify
-- Edits by Sinatra#0101 for RPX

local zoneData = require 'client.data.zones'

local function GetCardinalDirection(h)
    if h <= 22.5 then
        return "N"
    elseif h <= 67.5 then
        return "NE"
    elseif h <= 112.5 then
        return "E"
    elseif h <= 157.5 then
        return "SE"
    elseif h <= 202.5 then
        return "S"
    elseif h <= 247.5 then
        return "SW"
    elseif h <= 292.5 then
        return "W"
    elseif h <= 337.5 then
        return "NW"
    else
        return "N"
    end
end

local function getzoneData(hash)
    if hash ~= false then
        local sd = zoneData[hash]
        if sd then
            return sd.texture
        else
            print('No data for:', hash)
            return nil
        end
    else
        return nil
    end
end

local function formatTime(time) 
    if time < 10 then
        time = '0'..time
    end
    return time
end

local function getIGTime()
    -- Get Time for game
    local hour =  GetClockHours()
    local ap = 'am'

    if hour > 12 then
        hour = hour  - 12
        ap = 'pm'
    elseif hour == 0 then
        hour = hour + 12
        ap = 'am'
    elseif hour == 12 then
        ap = 'pm'
    end

    return formatTime(hour) ..":" .. formatTime(GetClockMinutes()) .. ap
end

local function getIGTemp()
    -- Get Temperatures
    local metric = ShouldUseMetricTemperature();
    local temperature
    local temperatureUnit
    local windSpeed
    local windSpeedUnit
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    if metric then
        temperature = math.floor(GetTemperatureAtCoords(x, y, z))
        temperatureUnit = 'C'

        windSpeed = math.floor(GetWindSpeed())
        windSpeedUnit = 'kph'
    else
        temperature = math.floor(GetTemperatureAtCoords(x, y, z) * 9/5 + 32)
        temperatureUnit = 'F'

        windSpeed = math.floor(GetWindSpeed() * 0.621371)
        windSpeedUnit = 'mph'
    end

    local wx, wy, wz = table.unpack(GetWindDirection())
    local direction = GetCardinalDirection(wz)

    return string.format('~q~ | ~COLOR_YELLOWSTRONG~%d °%s ~q~| %d%s %s', temperature, temperatureUnit, windSpeed, windSpeedUnit, direction)
end


local CurrentZone = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))        
        local zone = nil
    
        local tempstate = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 0)
        if tempstate then
            zone = tempstate
        end

        local tempwritten = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 13)
        if tempwritten then
            zone = tempwritten
        end

        local tempprint = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 12)
        if tempprint then
           zone = tempprint
        end

        local tempdistrict = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 10)
        if tempdistrict then
            zone = tempdistrict
        end

        local temptown = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 1)
        if temptown then
            zone = temptown
        end

        if CurrentZone ~= zone and LocalPlayer.state.isLoggedIn then
            CurrentZone = zone

            local zone = getzoneData(CurrentZone)

            local time = getIGTime()
            local temp = getIGTemp()
      
            if zone and LocalPlayer.state.isLoggedIn then
               print(zone)
               exports[GetCurrentResourceName()]:DisplayTopCenterNotification('~COLOR_BLUE~'.. time ..  temp, zone, 5000)
            end
        end
    end
end)