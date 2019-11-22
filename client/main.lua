Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local menuOpen = false
local wasOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if menuOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)


function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 128)
	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
	for k,zone in pairs(Config.Blips) do
		CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local px,py,pz = table.unpack(Config.Zones.Washing1.coords)
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing1.coords, true) < Config.DistanceMarker then
			DrawMarker(Config.MarkerType, px, py, pz, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, 0,0, 0,1)
		end 
		local p2x,p2y,p2z = table.unpack(Config.Zones.Washing2.coords)
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing2.coords, true) < Config.DistanceMarker then
			DrawMarker(Config.MarkerType, p2x, p2y, p2z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, 0,0, 0,1)	
		end
		local p4x,p4y,p4z = table.unpack(Config.Zones.Washing3.coords)
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing3.coords, true) < Config.DistanceMarker then
			DrawMarker(Config.MarkerType, p4x, p4y, p4z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, 0,0, 0,1)	
		end
		local p4x,p4y,p4z = table.unpack(Config.Zones.Washing4.coords)
		if GetDistanceBetweenCoords(coords, Config.Zones.Washing4.coords, true) < Config.DistanceMarker then
			DrawMarker(Config.MarkerType, p4x, p4y, p4z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, 0,0, 0,1)	
		end
		local p4x,p4y,p4z = table.unpack(Config.Zones.Packing1.coords)
		if GetDistanceBetweenCoords(coords, Config.Zones.Packing1.coords, true) < Config.DistanceMarker then
			DrawMarker(Config.MarkerType, p4x, p4y, p4z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, 0,0, 0,1)	
		end
		local p4x,p4y,p4z = table.unpack(Config.Zones.Packing2.coords)
		if GetDistanceBetweenCoords(coords, Config.Zones.Packing2.coords, true) < Config.DistanceMarker then
			DrawMarker(Config.MarkerType, p4x, p4y, p4z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, 0,0, 0,1)	
		end
	end
end)