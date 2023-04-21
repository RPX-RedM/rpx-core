if GlobalState.DeploymentType == "dev" then

    RegisterCommand('v4', function(source, args)
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local outputString = ('vec4(%.3f, %.3f, %.3f, %.3f)'):format(playerPos.x, playerPos.y, playerPos.z, GetEntityHeading(playerPed))
        lib.setClipboard(outputString)
        lib.notify({title = 'Clipboard set!', description = 'Your current position was copied to your clipboard in vector4 format.', icon = 'fas fa-clipboard'})
    end)

    RegisterCommand('v3', function(source, args)
        local playerPos = GetEntityCoords(PlayerPedId())
        local outputString = ('vec3(%.3f, %.3f, %.3f)'):format(playerPos.x, playerPos.y, playerPos.z)
        lib.setClipboard(outputString)
        lib.notify({title = 'Clipboard set!', description = 'Your current position was copied to your clipboard in vector3 format.', icon = 'fas fa-clipboard'})
    end)

    RegisterCommand('v2', function(source, args)
        local playerPos = GetEntityCoords(PlayerPedId())
        local outputString = ('vec2(%.3f, %.3f)'):format(playerPos.x, playerPos.y)
        lib.setClipboard(outputString)
        lib.notify({title = 'Clipboard set!', description = 'Your current position was copied to your clipboard in vector2 format.', icon = 'fas fa-clipboard'})
    end)

    AddEventHandler("CLIENT:RPX:PlayerLoaded", function()
        lib.notify({
            title = 'Dev Mode Warning', 
            description = 'RPX Framework is running in dev mode, meaning dev commands and more are available, and debug information exposed. Please disable this mode if running in production.', 
            icon = 'fas fa-triangle-exclamation',
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
            duration = 12000
        })
        print("[RPX] RPX Framework is running in dev mode, meaning dev commands and more are available, and debug information exposed. Please disable this mode if running in production.")
    end)
    
end