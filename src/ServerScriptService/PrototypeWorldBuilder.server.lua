local Workspace = game:GetService("Workspace")

local function createPart(name, position, color, size)
	local part = Instance.new("Part")
	part.Name = name
	part.Position = position
	part.Color = color
	part.Size = size or Vector3.new(4, 4, 4)
	part.Anchored = true

	local prompt = Instance.new("ProximityPrompt")
	prompt.ActionText = "Interact"
	prompt.ObjectText = name
	prompt.Parent = part

	return part
end

-- Create folder structure
local museum = Workspace:FindFirstChild("Museum")
if not museum then
	museum = Instance.new("Folder")
	museum.Name = "Museum"
	museum.Parent = Workspace
end

local interactables = museum:FindFirstChild("Interactables")
if not interactables then
	interactables = Instance.new("Folder")
	interactables.Name = "Interactables"
	interactables.Parent = museum
end

-- Check if parts already exist before creating them to avoid duplicates
if not interactables:FindFirstChild("PassportKiosk") then
	local kiosk = createPart("PassportKiosk", Vector3.new(0, 2, -10), Color3.fromRGB(100, 150, 255))
	kiosk.Parent = interactables
end

if not interactables:FindFirstChild("WaiverKiosk") then
	local waiver = createPart("WaiverKiosk", Vector3.new(10, 2, -10), Color3.fromRGB(255, 100, 100))
	waiver.Parent = interactables
end

if not interactables:FindFirstChild("BureaucracyClerk") then
	local clerk = createPart("BureaucracyClerk", Vector3.new(-10, 2, -10), Color3.fromRGB(200, 200, 200), Vector3.new(2, 5, 2))
	clerk.Parent = interactables
end

if not interactables:FindFirstChild("PunPlaque") then
	local plaque = createPart("PunPlaque", Vector3.new(15, 3, -5), Color3.fromRGB(255, 200, 0), Vector3.new(4, 3, 1))
	plaque.Parent = interactables
end

if not interactables:FindFirstChild("SanitationBooth") then
	local booth = createPart("SanitationBooth", Vector3.new(25, 4, -5), Color3.fromRGB(100, 255, 100), Vector3.new(6, 8, 6))
	booth.Parent = interactables
end

print("[PrototypeWorldBuilder] Generated placeholder museum world.")
