local Players = game:GetService("Players")

local museum = workspace:WaitForChild("Museum")
local interactables = museum:WaitForChild("Interactables")

local function getPrompt(partName)
	local part = interactables:WaitForChild(partName)
	return part:WaitForChild("ProximityPrompt")
end

local function setStatus(player, name, value)
	player:SetAttribute(name, value)
	print(("[Museum] %s: %s = %s"):format(player.Name, name, tostring(value)))
end

local function addStamp(player, stampName)
	local stamps = player:GetAttribute("PassportStamps") or ""
	if string.find("," .. stamps .. ",", "," .. stampName .. ",", 1, true) then
		return
	end

	local updated = stamps == "" and stampName or stamps .. "," .. stampName
	player:SetAttribute("PassportStamps", updated)
	print(("[Museum] %s earned stamp: %s"):format(player.Name, stampName))
end

Players.PlayerAdded:Connect(function(player)
	player:SetAttribute("HasBadIdeaPassport", false)
	player:SetAttribute("PocketProtectorRequired", false)
	player:SetAttribute("PunContaminated", false)
	player:SetAttribute("CurrentQuest", "VisitFrontDesk")
	player:SetAttribute("PassportStamps", "")
end)

getPrompt("PassportKiosk").Triggered:Connect(function(player)
	setStatus(player, "HasBadIdeaPassport", true)
	setStatus(player, "CurrentQuest", "SignWaiver")
	print("Welcome to the Museum of Bad Ideas. Please enjoy the consequences.")
end)

getPrompt("WaiverKiosk").Triggered:Connect(function(player)
	setStatus(player, "PocketProtectorRequired", true)
	setStatus(player, "CurrentQuest", "AppealPocketProtector")
	addStamp(player, "Waiver Signed Under Duress")
	print("You are now compliant with a rule you did not know existed.")
end)

getPrompt("BureaucracyClerk").Triggered:Connect(function(player)
	setStatus(player, "CurrentQuest", "TriggerPunExposure")
	print("You may petition to revoke the punishment, but first you need a petition authorizing your petition.")
end)

getPrompt("PunPlaque").Triggered:Connect(function(player)
	setStatus(player, "PunContaminated", true)
	setStatus(player, "CurrentQuest", "ReportToSanitation")
	print("PUN EXPOSURE DETECTED. Please report to Sanitation before the pun matures.")
end)

getPrompt("SanitationBooth").Triggered:Connect(function(player)
	if not player:GetAttribute("PunContaminated") then
		print("Sanitation denied. No active pun contamination detected.")
		return
	end

	setStatus(player, "PunContaminated", false)
	setStatus(player, "CurrentQuest", "PrototypeComplete")
	addStamp(player, "Pun Hazard Cleared")
	print("Pun neutralized. Certificate pending unnecessary lamination.")
end)
