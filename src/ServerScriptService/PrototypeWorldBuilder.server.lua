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

local function createStairs(parent, startPosition, stepCount, stepSize, stepHeight)
	for i = 1, stepCount do
		local part = Instance.new("Part")
		part.Name = "StairStep" .. i
		-- Move forward and up for each step
		part.Position = startPosition + Vector3.new(0, (i - 1) * stepHeight, -(i - 1) * stepSize.Z)
		part.Size = stepSize
		part.Color = Color3.fromRGB(150, 150, 150)
		part.Anchored = true
		part.Parent = parent
	end
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

local environment = museum:FindFirstChild("Environment")
if not environment then
	environment = Instance.new("Folder")
	environment.Name = "Environment"
	environment.Parent = museum
end

-- Check if parts already exist before creating them to avoid duplicates
if not interactables:FindFirstChild("PassportKiosk") then
	local kiosk = createPart("PassportKiosk", Vector3.new(0, 6, -20), Color3.fromRGB(100, 150, 255))
	kiosk.Parent = interactables
end

if not interactables:FindFirstChild("WaiverKiosk") then
	local waiver = createPart("WaiverKiosk", Vector3.new(10, 6, -20), Color3.fromRGB(255, 100, 100))
	waiver.Parent = interactables
end

if not interactables:FindFirstChild("BureaucracyClerk") then
	local clerk = createPart("BureaucracyClerk", Vector3.new(-10, 6, -20), Color3.fromRGB(200, 200, 200), Vector3.new(2, 5, 2))
	clerk.Parent = interactables
end

if not interactables:FindFirstChild("PunPlaque") then
	local plaque = createPart("PunPlaque", Vector3.new(15, 7, -15), Color3.fromRGB(255, 200, 0), Vector3.new(4, 3, 1))
	plaque.Parent = interactables
end

if not interactables:FindFirstChild("SanitationBooth") then
	local booth = createPart("SanitationBooth", Vector3.new(25, 8, -15), Color3.fromRGB(100, 255, 100), Vector3.new(6, 8, 6))
	booth.Parent = interactables
end

-- Create a platform for the kiosks to sit on
if not environment:FindFirstChild("MainPlatform") then
	local platform = Instance.new("Part")
	platform.Name = "MainPlatform"
	platform.Position = Vector3.new(0, 3, -20)
	platform.Size = Vector3.new(60, 2, 40)
	platform.Color = Color3.fromRGB(80, 80, 80)
	platform.Anchored = true
	platform.Parent = environment
end

-- Create stairs leading up to the platform
if not environment:FindFirstChild("StairStep1") then
	-- startPosition is at the edge of the platform, walking up towards it
	local startPos = Vector3.new(0, 0.5, 0)
	createStairs(environment, startPos, 6, Vector3.new(10, 1, 2), 0.5)
end

print("[PrototypeWorldBuilder] Generated placeholder museum world with stairs and platform.")
