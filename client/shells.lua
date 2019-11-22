local spawnedShells = 0
local shellss = {}
local isPickingUp, isWashing = false, false
local IsRiding = false
local isPacking = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.Zones.CocklesField.coords, true) < 50 then
			SpawnShellls()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)


-- Pickup --
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #shellss, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(shellss[i]), false) < 1 then
				nearbyObject, nearbyID = shellss[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then
			if not isPickingUp then
				DrawDisplayText("[~g~E~w~] - Pickup")
			end
			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				ESX.TriggerServerCallback('fifteen_shells:canPick', function(result)
					if result == true then
						isPickingUp = true
						ESX.TriggerServerCallback('fifteen_shells:canPickUp', function(canPickUp)
							if canPickUp then
								TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
								TriggerEvent("mythic_progbar:client:progress", {
									name = "unique_action_name",
									duration = (Config.TimePickup*1000),
									label = "Picking...",
									useWhileDead = false,
									canCancel = true,
									controlDisables = {
									    disableMovement = true,
									    disableCarMovement = true,
									    disableMouse = false,
									    disableCombat = true,
									},
								    --[[animation = {
								        animDict = "world_human_bum_wash",
								        anim = "world_human_bum_wash",
								    },
								    --[[prop = {
								        model = "prop_paper_bag_small",
								    }]]
								}, function(status)
								    if not status then
								        ESX.Game.DeleteObject(nearbyObject)
										table.remove(shellss, nearbyID)
										spawnedShells = spawnedShells - 1
										TriggerServerEvent('fifteen_shells:pickedUpShells')
								    end
								    ClearPedTasks(playerPed)
								end)
							else
								exports['mythic_notify']:DoHudText('error', 'You do not have any more inventory space for Cockles.')
							end
							isPickingUp = false
						end, 'shell_1')
					else
						exports['mythic_notify']:DoHudText('error', 'You need to buy Trowel')
					end
				end, 'trowel')
			end		
		else
			Citizen.Wait(500)
		end
	end
end)

-- Washing --
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local v = Config.Zones.Washing1.coords

		if GetDistanceBetweenCoords(coords, Config.Zones.Washing1.coords, true) < 1.5 then
			if not isWashing then
				Draw3DText(v.x, v.y, v.z+1.0, "[~g~E~w~] - Washing Cockles")
			end

			if IsControlJustReleased(0, 38) and not isWashing then
				Washing()
			end
		else
			Citizen.Wait(500)
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local v = Config.Zones.Washing2.coords
		
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing2.coords, true) < 1.5 then
			if not isWashing then
				Draw3DText(v.x, v.y, v.z+1.0, "[~g~E~w~] - Washing Cockles")
			end

			if IsControlJustReleased(0, 38) and not isWashing then
				Washing()
			end
		else
			Citizen.Wait(500)
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local v = Config.Zones.Washing3.coords
		
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing3.coords, true) < 1.5 then
			if not isWashing then
				Draw3DText(v.x, v.y, v.z+1.0, "[~g~E~w~] - Washing Cockles")
			end

			if IsControlJustReleased(0, 38) and not isWashing then
				Washing()
			end
		else
			Citizen.Wait(500)
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local v = Config.Zones.Washing4.coords
		
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing4.coords, true) < 1.5 then
			if not isWashing then
				Draw3DText(v.x, v.y, v.z+1.0, "[~g~E~w~] - Washing Cockles")
			end

			if IsControlJustReleased(0, 38) and not isWashing then
				Washing()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Packing --
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local v = Config.Zones.Packing1.coords
		
		if GetDistanceBetweenCoords(coords, Config.Zones.Packing1.coords, true) < 1.5 then
			if not isWashing then
				Draw3DText(v.x, v.y, v.z+1.0, "[~g~E~w~] - Washing Cockles")
			end

			if IsControlJustReleased(0, 38) and not isWashing then
				Packing()
			end
		else
			Citizen.Wait(500)
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local v = Config.Zones.Packing2.coords
		
		if GetDistanceBetweenCoords(coords, Config.Zones.Packing2.coords, true) < 1.5 then
			if not isWashing then
				Draw3DText(v.x, v.y, v.z+1.0, "[~g~E~w~] - Washing Cockles")
			end

			if IsControlJustReleased(0, 38) and not isWashing then
				Packing()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function Washing()
	isWashing = true
	local timeLeft = 3000 
	local playerPed = PlayerPedId()
	ESX.TriggerServerCallback('fifteen_shells:checkLimit', function(result)
		if result == true then 
			TaskStartScenarioInPlace(playerPed, "world_human_bum_wash", 0, false)
			TriggerEvent("mythic_progbar:client:progress", {
				name = "unique_action_name",
				duration = (Config.TimeWasAndhPack*1000),
				label = "Washing...",
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
				    disableMovement = true,
				    disableCarMovement = true,
				    disableMouse = false,
				    disableCombat = true,
				},
			    animation = {
			        animDict = "world_human_bum_wash",
			        anim = "idle_a",
			    },
			    --[[prop = {
			        model = "prop_paper_bag_small",
			    }]]
			}, function(status)
			    if not status then
			       	TriggerServerEvent('fifteen_shells:Washing')
			    end
			    ClearPedTasks(playerPed)
			end)
		else
			exports['mythic_notify']:DoHudText('inform', 'Need More Dirty Cockles')
		end
	end, 'shell_1', 1)

	Citizen.Wait(3300)
	isWashing = false
end

function Packing()
	isWashing = true
	local timeLeft = 3000 
	local playerPed = PlayerPedId()
	ESX.TriggerServerCallback('fifteen_shells:checkLimit', function(result)
		if result == true then 
			TaskStartScenarioInPlace(playerPed, "world_human_bum_wash", 0, false)
			TriggerEvent("mythic_progbar:client:progress", {
				name = "unique_action_name",
				duration = (Config.TimeWasAndhPack*1000),
				label = "Packing...",
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
				    disableMovement = true,
				    disableCarMovement = true,
				    disableMouse = false,
				    disableCombat = true,
				},
			    --[[animation = {
			        animDict = "missheistdockssetup1clipboard@idle_a",
			        anim = "idle_a",
			    },
			    prop = {
			        model = "prop_paper_bag_small",
			    }]]
			}, function(status)
			    if not status then
			       	TriggerServerEvent('fifteen_shells:Packing')
			    end
			    ClearPedTasks(playerPed)
			end)
		else
			exports['mythic_notify']:DoHudText('inform', 'Need More Clean Cockles')
		end
	end, 'shell_2', 2)

	Citizen.Wait(3300)
	isWashing = false
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(shellss) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnShellls()
	while spawnedShells < 50 do
		Citizen.Wait(0)
		local shellCoords = GenerateShellCoords()

		ESX.Game.SpawnLocalObject(Config.Props, shellCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(shellss, obj)
			spawnedShells = spawnedShells + 1
		end)
	end
end

function ValidateShellCoord(plantCoord)
	if spawnedShells > 0 then
		local validate = true

		for k, v in pairs(shellss) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 4 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.Zones.CocklesField.coords, false) > 40 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateShellCoords()
	while true do
		Citizen.Wait(100)

		local shellCoordX, shellCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-30, 30)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-30, 30)

		shellCoordX = Config.Zones.CocklesField.coords.x + modX
		shellCoordY = Config.Zones.CocklesField.coords.y + modY

		local coordZ = GetCoordZ(shellCoordX, shellCoordY)
		local coord = vector3(shellCoordX, shellCoordY, coordZ)

		if ValidateShellCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 199.0, 199.1, 199.2, 199.3, 199.4, 199.5, 200.0, 200.1, 200.2, 200.3, 200.4, 200.5, 201.0, 201.1, 201.2, 201.3, 201.4, 201.5 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 199.0, 199.1, 199.2, 199.3, 199.4, 199.5, 200.0, 200.1, 200.2, 200.3, 200.4, 200.5, 201.0, 201.1, 201.2, 201.3, 201.4, 201.5
end

function DrawDisplayText(text)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.6, 0.6)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    SetTextCentre(true)
    DrawText(0.5, 0.88)
end

function Draw3DText(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.4, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(255, 0, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 300
    DrawRect(_x,_y+0.0160, 0.030+ factor, 0.04, 41, 11, 41, 85)
end