Internal_BlipLibrary = {}

Internal_BlipLibrary.Create = function(sprite, coordinates, name)
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coordinates.x, coordinates.y, coordinates.z) -- _BLIP_ADD_FOR_COORD
    SetBlipSprite(blip, sprite)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, CreateVarString(10, "LITERAL_STRING", name)) -- _SET_BLIP_NAME_FROM_PLAYER_STRING
    return blip
end