CreateThread(function()
	while true do
		if LocalPlayer.state.isLoggedIn and GlobalState.DensityMultipliers then
			-- RedM
			SetAmbientAnimalDensityMultiplierThisFrame(GlobalState.DensityMultipliers.ambientAnimals)
			SetAmbientHumanDensityMultiplierThisFrame(GlobalState.DensityMultipliers.ambientHumans)
			SetAmbientPedDensityMultiplierThisFrame(GlobalState.DensityMultipliers.ambientPeds)
			SetScenarioAnimalDensityThisFrame(GlobalState.DensityMultipliers.scenarioAnimals)
			SetScenarioHumanDensityThisFrame(GlobalState.DensityMultipliers.scenarioHumans)
			SetScenarioPedDensityMultiplierThisFrame(GlobalState.DensityMultipliers.scenarioPeds)

			SetParkedVehicleDensityMultiplierThisFrame(GlobalState.DensityMultipliers.parkedVehicles)
			SetRandomVehicleDensityMultiplierThisFrame(GlobalState.DensityMultipliers.randomVehicles)
			SetVehicleDensityMultiplierThisFrame(GlobalState.DensityMultipliers.vehicles)
            
			Wait(0)
		else
			Wait(2000)
		end
	end
end)

function SetAmbientAnimalDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xC0258742B034DFAF, multiplier)
end

function SetAmbientHumanDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xBA0980B5C0A11924, multiplier)
end

function SetAmbientPedDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xAB0D553FE20A6E25, multiplier)
end

function SetScenarioAnimalDensityThisFrame(multiplier)
	Citizen.InvokeNative(0xDB48E99F8E064E56, multiplier)
end

function SetScenarioHumanDensityThisFrame(multiplier)
	Citizen.InvokeNative(0x28CB6391ACEDD9DB, multiplier)
end
