local lockedDoors = {
	831345624, -- Tumbleweed jail cell
	2984805596, -- Tumbleweed jail, left cell door
	2677989449, -- Tumbleweed jail, right cell door

	1711767580, -- Saint Denis jail cell

	193903155, -- Valentine jail cell
	295355979, -- Valentine jail cell

	1878514758, -- Rhodes jail cell

	2514996158, -- Blackwater jail cell
	2167775834, -- Blackwater jail cell

	902070893, -- Strawberry jail cell
	1207903970, -- Strawberry jail cell

	4016307508, -- Armadillo jail cell
	4235597664, -- Amradillo jail cell
}

CreateThread(function()
	for _, doorInfo in pairs(DoorSystemGetActive()) do
		if not IsDoorRegisteredWithSystem(doorInfo[1]) then
			Citizen.InvokeNative(0xD99229FE93B46286, doorInfo[1], 1, 1, 0, 0, 0, 0) -- ADD_DOOR_TO_SYSTEM_NEW
		end
		DoorSystemSetDoorState(doorInfo[1], 0)
	end

	for door, state in pairs(lockedDoors) do
		DoorSystemSetDoorState(door, 1)
	end
end)