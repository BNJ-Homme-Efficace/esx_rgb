--BY BNJ-- 𝑯𝒐𝒎𝒎𝒆-𝒆𝒇𝒇𝒊𝒄𝒂𝒔𝒆
local Keys = {
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

local PlayerData = {}
local CurrentAction = nil
local CurrentActionMsg  = ''
local CurrentActionData = {}

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)

function OpenLightsMenu()

		local elements = {
		{label = 'Blanc', value = 'swiatla1'},
		{label = 'Rouge', value = 'swiatla2'},
		{label = 'Bleu', value = 'swiatla3'},
		{label = 'Vert', value = 'swiatla4'},
		{label = 'Jaune', value = 'swiatla5'},
		{label = 'Pourpre',		value = 'swiatla6'},
		{label = 'Orange',	value = 'swiatla7'},
		{label = 'Rose',		value = 'swiatla8'},
		{label = 'Sombre',	value = 'swiatla9'},
		}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lights_colors',
	{
		title    = 'Pilot RGB',
		align    = 'right',
		elements = elements
		}, function(data2, menu2)
			local ply = GetPlayerPed(-1)
			if (IsPedInAnyVehicle(ply, true)) then
				local action = data2.current.value					
				if action == 'swiatla1' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 0)
					menu2.close()
				elseif action == 'swiatla2' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 8)
					menu2.close()
				elseif action == 'swiatla3' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 1)
					menu2.close()
				elseif action == 'swiatla4' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 4)
					menu2.close()
				elseif action == 'swiatla5' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 5)
					menu2.close()
				elseif action == 'swiatla6' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 11)
					menu2.close()
				elseif action == 'swiatla7' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 7)
					menu2.close()
				elseif action == 'swiatla8' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 10)
					menu2.close()
				elseif action == 'swiatla9' then
					local veh = GetVehiclePedIsUsing(PlayerPedId())
					ToggleVehicleMod(veh, 22, true)
					SetVehicleHeadlightsColour(veh, 12)
					menu2.close()
					--OpenLightsMenu(closestPlayer)
				end

			else
				ESX.ShowNotification('Vous devez être dans le véhicule!')
			end
		end, function(data2, menu2)
			menu2.close()
		end)
end

function UpMiniMapNotification(text)

    SetNotificationTextEntry("STRING")

    AddTextComponentString(text)

    DrawNotification(0, 1)

end

Citizen.CreateThread(function()

  while true do

    Citizen.Wait(0)

	local ply = GetPlayerPed(-1)	

    if IsControlJustReleased(0, Keys['F1']) and (IsPedInAnyVehicle(ply, true)) and not isDead and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'lights_colors') then

      ESX.TriggerServerCallback('swiatelka:getItemAmount', function(qtty)

		  if qtty > 0 then

			OpenLightsMenu()
          
        else

          UpMiniMapNotification("Vous n'avez pas de  ~r~boitier rgb~s~!")

        end

      end, 'boitierrgb')



    end
	
    if menuIsOpen == true then
      for _, value in ipairs(KeyToucheCloseEvent) do
        if IsControlJustPressed(1, value.code) then
          SendNUIMessage({keyUp = value.event})
        end
      end
    end
  end
end)
