local Workspace = game:GetService("Workspace")

local MuseumGen = {}

-- Utility to create parts
function MuseumGen.createPart(name, parent, size, cframe, color, material)
	local part = Instance.new("Part")
	part.Name = name
	part.Size = size
	part.CFrame = cframe
	part.Color = color or Color3.fromRGB(200, 200, 200)
	part.Material = material or Enum.Material.SmoothPlastic
	part.Anchored = true
	part.Parent = parent
	return part
end

function MuseumGen.createCurvyShape(name, parent, size, cframe, color, shape)
	local part = Instance.new("Part")
	part.Name = name
	part.Shape = shape or Enum.PartType.Ball
	part.Size = size
	part.CFrame = cframe
	part.Color = color or Color3.fromRGB(240, 240, 240)
	part.Material = Enum.Material.Concrete
	part.Anchored = true
	part.Parent = parent
	return part
end

-- 1. Landscaping
function MuseumGen.buildLandscaping(parent)
	-- Main grounds
	local grounds = MuseumGen.createPart("Grounds", parent, Vector3.new(400, 4, 400), CFrame.new(0, 0, 0), Color3.fromRGB(80, 150, 80), Enum.Material.Grass)

	-- Curvy paths (using flattened cylinders/parts)
	for i = 1, 8 do
		local pathCFrame = CFrame.new(math.random(-100, 100), 2.1, math.random(-100, 100)) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0)
		MuseumGen.createPart("Path", parent, Vector3.new(20, 1, 120), pathCFrame, Color3.fromRGB(200, 200, 180), Enum.Material.Cobblestone)
	end
end

-- 2. Exterior (Curvy, Whimsical, Blob Architecture)
function MuseumGen.buildExterior(parent)
	-- Main central blob
	MuseumGen.createCurvyShape("MainDome", parent, Vector3.new(180, 90, 180), CFrame.new(0, 45, 0))

	-- Satellite curves overlapping the main dome
	for i = 1, 10 do
		local angle = (i / 10) * math.pi * 2
		local radius = 70
		local x = math.cos(angle) * radius
		local z = math.sin(angle) * radius
		local size = Vector3.new(math.random(70, 120), math.random(50, 100), math.random(70, 120))
		MuseumGen.createCurvyShape("WingBlob" .. i, parent, size, CFrame.new(x, size.Y/2 + 2, z))
	end

	-- Main Entrance Arch (cutout effect using a darker part, since CSG via script is complex)
	MuseumGen.createCurvyShape("MainEntrance", parent, Vector3.new(40, 40, 40), CFrame.new(0, 20, 90), Color3.fromRGB(10, 10, 10), Enum.PartType.Cylinder)

	-- Secondary Entrance Arch
	MuseumGen.createCurvyShape("SecondaryEntrance", parent, Vector3.new(30, 30, 30), CFrame.new(90, 15, 0) * CFrame.Angles(0, math.rad(90), 0), Color3.fromRGB(10, 10, 10), Enum.PartType.Cylinder)
end

-- 3. Rooms and Corridors (Interior)
function MuseumGen.buildInterior(parent)
	-- To make ~20 rooms across 2 levels
	local roomCount = 0
	local levels = 2
	local levelHeight = 25
	local roomSpacing = 35

	for level = 0, levels - 1 do
		local yOffset = 4 + (level * levelHeight)

		-- Floor for this level
		MuseumGen.createPart("Floor_L" .. level, parent, Vector3.new(160, 2, 160), CFrame.new(0, yOffset, 0), Color3.fromRGB(220, 220, 210), Enum.Material.Marble)

		for x = -2, 2 do
			for z = -2, 2 do
				if roomCount >= 20 and level == 1 then break end

				-- Don't place a room directly in the center to leave a grand atrium
				if not (x == 0 and z == 0) and math.random() > 0.2 then
					local rx = x * roomSpacing
					local rz = z * roomSpacing
					local roomSize = Vector3.new(math.random(25, 30), levelHeight, math.random(25, 30))
					local rCenter = CFrame.new(rx, yOffset + (levelHeight/2), rz)

					MuseumGen.buildRoom(parent, rCenter, roomSize, "Room" .. roomCount)
					roomCount = roomCount + 1
				end
			end
		end

		-- Build Stairs to next level in the central atrium
		if level < levels - 1 then
			MuseumGen.buildStairs(parent, CFrame.new(0, yOffset + 1, 15), levelHeight)
		end
	end
end

-- Helper to build a room with 4 walls, a doorway, and paintings
function MuseumGen.buildRoom(parent, centerCFrame, size, name)
	local wallThickness = 2
	local hw = size.X / 2
	local hz = size.Z / 2
	local h = size.Y

	-- Colors for museum walls (white/off-white)
	local wallColor = Color3.fromRGB(245, 245, 245)

	-- North Wall
	MuseumGen.createPart(name .. "_WallN", parent, Vector3.new(size.X, h, wallThickness), centerCFrame * CFrame.new(0, 0, -hz), wallColor)
	-- South Wall (with doorway)
	local sWall1 = MuseumGen.createPart(name .. "_WallS1", parent, Vector3.new((size.X - 10)/2, h, wallThickness), centerCFrame * CFrame.new(-(size.X/4) - 2.5, 0, hz), wallColor)
	local sWall2 = MuseumGen.createPart(name .. "_WallS2", parent, Vector3.new((size.X - 10)/2, h, wallThickness), centerCFrame * CFrame.new((size.X/4) + 2.5, 0, hz), wallColor)
	-- East Wall (with doorway)
	local eWall1 = MuseumGen.createPart(name .. "_WallE1", parent, Vector3.new(wallThickness, h, (size.Z - 10)/2), centerCFrame * CFrame.new(hw, 0, -(size.Z/4) - 2.5), wallColor)
	local eWall2 = MuseumGen.createPart(name .. "_WallE2", parent, Vector3.new(wallThickness, h, (size.Z - 10)/2), centerCFrame * CFrame.new(hw, 0, (size.Z/4) + 2.5), wallColor)
	-- West Wall
	local wWall = MuseumGen.createPart(name .. "_WallW", parent, Vector3.new(wallThickness, h, size.Z), centerCFrame * CFrame.new(-hw, 0, 0), wallColor)

	-- Add paintings to North and West walls (the solid ones)
	MuseumGen.addPainting(parent, centerCFrame * CFrame.new(0, 0, -hz + 1.1))
	MuseumGen.addPainting(parent, centerCFrame * CFrame.new(-hw + 1.1, 0, 0) * CFrame.Angles(0, math.rad(90), 0))
end

function MuseumGen.addPainting(parent, wallCFrame)
	-- Painting Canvas
	local pw = math.random(8, 14)
	local ph = math.random(6, 12)
	local pColor = Color3.new(math.random(), math.random(), math.random())
	local canvas = MuseumGen.createPart("Painting", parent, Vector3.new(pw, ph, 0.5), wallCFrame, pColor, Enum.Material.Fabric)

	-- Frame
	MuseumGen.createPart("Frame", parent, Vector3.new(pw + 1, ph + 1, 0.4), wallCFrame * CFrame.new(0, 0, 0.1), Color3.fromRGB(30, 30, 30), Enum.Material.Wood)
end

function MuseumGen.buildStairs(parent, startCFrame, heightToClimb)
	local stepHeight = 1
	local stepDepth = 2
	local stepWidth = 15
	local steps = math.floor(heightToClimb / stepHeight)

	for i = 1, steps do
		local stepPos = startCFrame * CFrame.new(0, (i * stepHeight) - stepHeight/2, -i * stepDepth)
		MuseumGen.createPart("Stair", parent, Vector3.new(stepWidth, stepHeight, stepDepth), stepPos, Color3.fromRGB(200, 200, 200), Enum.Material.Marble)
	end
end

-- Main Execution
local container = Workspace:FindFirstChild("ProceduralAdvancedMuseum")
if container then
	container:Destroy() -- clean up previous generation
end
container = Instance.new("Folder")
container.Name = "ProceduralAdvancedMuseum"
container.Parent = Workspace

print("[AdvancedMuseumGenerator] Starting procedural architecture generation...")
MuseumGen.buildLandscaping(container)
MuseumGen.buildExterior(container)
MuseumGen.buildInterior(container)
print("[AdvancedMuseumGenerator] Museum generated successfully!")
