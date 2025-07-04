-- SETTINGS --
local settings = _G

settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 -- 0 to disable
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true --[[ only should be disabled if
your character havent played ANY animations, otherwise it breaks the reanimate ]]
settings["Instant respawn"] = false --[[ Instant respawns the
character, it will still wait the respawn time, but your character wont be dead.
Requires: replicatesignal function
Enable if you want the feature
]]
settings["Hide HumanoidRootPart"] = false --[[ Enabled by default. when enabled, your chat bubble or name tag
will not appear above your character, but you will have your character immortal in the Fencing arena.
]]
settings["Hide HumanoidRootPart"] = false --[[ Enabled by default. when enabled, your chat bubble or name tag
will not appear above your character, but you will have your character immortal in the Fencing arena.
]]
settings["PermaDeath fake character"] = false --[[When enabled, when you die when the reanimate is on, you
wont respawn. If you want respawn, set it to false
]]

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false



task.spawn(function()


--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz
]]
--// BY MrY7zz

if not game.IsLoaded then
	game.Loaded:Wait()
end

local UI = (gethui and gethui()) or (cloneref and cloneref(game:GetService("CoreGui"))) or (pcall(function() return game:GetService("CoreGui").Parent end) and game:GetService("CoreGui")) or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")

local function LoadUi(seconds)
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_2 = Instance.new("UIStroke")
	local UIStroke_3 = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel_2 = Instance.new("TextLabel")
	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent = UI
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, 429, 0, 79)
    Frame.Position = UDim2.new(0.5, -Frame.Size.X.Offset/2, 0.01, 0)
	UIStroke.Parent = Frame

	UIStroke_2.Color = Color3.fromRGB(65, 65, 65)
	UIStroke_3.Color = Color3.fromRGB(65, 65, 65)

	UICorner.Parent = Frame

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(79, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 127, 179))}
	UIGradient.Rotation = 40
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.07, 0.13), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = Frame

	UIStroke_3.Thickness = 0.7

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.265734255, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 50)
	TextLabel.Font = Enum.Font.BuilderSans
	TextLabel.Text = "MrY7zz's CurrentAngle V2 REANIMATE BY MrY7zz"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 20.000
	UIStroke_2.Parent = TextLabel

	TextLabel_2.Parent = Frame
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(-0.08, 0, 0.367088616, 0)
	TextLabel_2.Size = UDim2.new(0, 500, 0, 50)
	TextLabel_2.Font = Enum.Font.BuilderSans
	TextLabel_2.Text = tostring(seconds) .. " Seconds left for reanimate to load"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
    task.delay(seconds + 1.5, function()
        ScreenGui:Destroy()
    end)
end

if not sethiddenproperty then
	error("Script is only compatible with environments that have sethiddenproperty")
	return
end

local game = game
local debug = debug
local debug_info = debug.info

local gameIndex
local gameNewIndex
local CFrameIndex

local emptyCFrame = CFrame.new()

local getrawmetatableworks = false
local isindexsupported = false

if getrawmetatable then
	local s, r = pcall(getrawmetatable, game)
	local success, res = pcall(getrawmetatable, emptyCFrame)

	if s then  
		if r.__index then
			gameIndex = r.__index
			gameNewIndex = r.__newindex
			getrawmetatableworks = true
		end
	end
	if success and s then
		if res.__index then
			CFrameIndex = res.__index
		end
	end
end

if not getrawmetatableworks then
	xpcall(function()
		return game[{}]
	end, function()
		gameIndex = debug_info(2, "f")
	end)

	xpcall(function()
		game[{}] = {}
	end, function()
		gameNewIndex = debug_info(2, "f")
	end)

	xpcall(function()
		return emptyCFrame[{}]
	end, function()
		CFrameIndex = debug_info(2, "f")
	end)
end

local successtest, err = pcall(function()
	return gameIndex(game:GetService("Workspace"), "Parent")
end)

if not successtest then
	if string.find(err:lower(), "instance expected") then
		isindexsupported = false
	else
		isindexsupported = true
	end
else
	isindexsupported = true
end

if not gameIndex then
	gameIndex = function(self, key)
		return self[key]
	end
end

if not gameNewIndex then
	gameNewIndex = function(self, key, new)
		self[key] = new
	end
end

if not CFrameIndex then
	CFrameIndex = function(self, key, new)
		self[key] = new
	end
end

local zeropointone = 0.1
local twait = task.wait
local tspawn = task.spawn
local currentfakechar = nil
local vector3zero = Vector3.zero
local getgenv = getgenv or function()
	return _G
end

local NaN = 0/0

local dummypart = Instance.new("Part")

local GetDescendants = dummypart.GetDescendants
local IsA = dummypart.IsA
local Destroy = dummypart.Destroy

local math_random = math.random
local Vector3_new = Vector3.new

local usedefaultanims = _G["Use default animations"] or false

local transparency_level = _G["Fake character transparency level"] or 1

local disablescripts = _G["Disable character scripts"] or true

local fakecollisions = _G["Fake character should collide"] or true

local nametoexcludefromtransparency = _G["Names to exclude from transparency"] or {}

local parentrealchartofakechar = _G["Parent real character to fake character"] or false

local respawncharacter = (function() if _G["Respawn character"] == nil then return true else return _G["Respawn character"] end end)()

local instantrespawn = (function() if _G["Instant respawn"] == nil then return false else return _G["Instant respawn"] end end)()

local hiderootpart = (function() if _G["Hide HumanoidRootPart"] == nil then return false else return _G["Hide HumanoidRootPart"] end end)()

local permadeathcharacter = (function() if _G["PermaDeath fake character"] == nil then return true else return _G["PermaDeath fake character"] end end)()

local r15rig = (function() if _G["R15 Reanimate"] == nil then return false else return _G["R15 Reanimate"] end end)()

local LocalPlayer = game:GetService("Players").LocalPlayer

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
	twait(zeropointone)
	if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType ~= Enum.HumanoidRigType.R6 then
		error("Script is only compatible with R6 type rigs")
		return
	end
end

local function removeAnims(character)
	if character == currentfakechar then
		return
	end
	local humanoid = character:WaitForChild("Humanoid", 5)
	local animator = humanoid:FindFirstChildWhichIsA("Animator")
	if animator then
		Destroy(animator)
	end
	local animateScript = character:FindFirstChild("Animate")
	if animateScript then
		Destroy(animateScript)
	end
	local a = nil
	a = humanoid.DescendantAdded:Connect(function(child)
		if child:IsA("Animator") then
			Destroy(child)
			a:Disconnect()
			a = nil
		end
	end)
end

LocalPlayer.CharacterAdded:Once(removeAnims)

LocalPlayer.Character.Archivable = true
local originalChar = LocalPlayer.Character
local fakeChar

if not r15rig then
	fakeChar = originalChar:Clone()
else
	fakeChar = game:GetService("Players"):CreateHumanoidModelFromDescription(originalChar.Humanoid.HumanoidDescription, Enum.HumanoidRigType.R15)
	fakeChar.HumanoidRootPart.CFrame = originalChar.HumanoidRootPart.CFrame
end
fakeChar.Name = LocalPlayer.Name .. "_Fake"
local signaldiedbackend = LocalPlayer.ConnectDiedSignalBackend
local signalkill = LocalPlayer.Kill

if respawncharacter then
	LoadUi(game:GetService("Players").RespawnTime)
	if instantrespawn then
		if replicatesignal then
			replicatesignal(signaldiedbackend)
			twait(game:GetService("Players").RespawnTime - 0.05)
			replicatesignal(signalkill)
			LocalPlayer.CharacterAdded:Wait()
			fakeChar.Parent = workspace
			currentfakechar = fakeChar
		end
	else
		originalChar:BreakJoints()
		LocalPlayer.CharacterAdded:Wait()
		fakeChar.Parent = workspace
		currentfakechar = fakeChar
	end
end

twait(zeropointone)

local newChar = LocalPlayer.Character
newChar.Archivable = true

if disablescripts then
	tspawn(function()
		for _, obj in ipairs(fakeChar:GetChildren()) do
			if obj:IsA("LocalScript") then
				obj.Enabled = false
			end
		end
	end)
end

for _, part in ipairs(fakeChar:GetDescendants()) do
	if part:IsA("BasePart") or part:IsA("Decal") then
		if not nametoexcludefromtransparency[tostring(part)] then
			part.Transparency = transparency_level
		end
	end
end

twait(0.4)

LocalPlayer.Character = fakeChar
if parentrealchartofakechar then
	newChar.Parent = fakeChar
end

local newcharTorso = newChar:WaitForChild("Torso")
local fakecharTorso
if r15rig then
	fakecharTorso = fakeChar:WaitForChild("UpperTorso")
else
	fakecharTorso = fakeChar:WaitForChild("Torso")
end
local newcharRoot = newChar:WaitForChild("HumanoidRootPart")
local fakecharRoot = fakeChar:WaitForChild("HumanoidRootPart")

local limbmapping

if not r15rig then
	limbmapping = {
		Neck = fakeChar:WaitForChild("Head"),
		RootJoint = fakeChar:WaitForChild("Torso"),
		["Left Shoulder"] = fakeChar:WaitForChild("Left Arm"),
		["Right Shoulder"] = fakeChar:WaitForChild("Right Arm"),
		["Left Hip"] = fakeChar:WaitForChild("Left Leg"),
		["Right Hip"] = fakeChar:WaitForChild("Right Leg")
	}
else
	limbmapping = {
		Neck = fakeChar:WaitForChild("Head"),
		RootJoint = fakeChar:WaitForChild("UpperTorso"),
		["Left Shoulder"] = fakeChar:WaitForChild("LeftLowerArm"),
		["Right Shoulder"] = fakeChar:WaitForChild("RightLowerArm"),
		["Left Hip"] = fakeChar:WaitForChild("LeftLowerLeg"),
		["Right Hip"] = fakeChar:WaitForChild("RightLowerLeg")
	}
end 

local jointmapping = {
	Neck = newcharTorso:WaitForChild("Neck"),
	RootJoint = newChar.HumanoidRootPart:WaitForChild("RootJoint"),
	["Left Shoulder"] = newcharTorso:WaitForChild("Left Shoulder"),
	["Right Shoulder"] = newcharTorso:WaitForChild("Right Shoulder"),
	["Left Hip"] = newcharTorso:WaitForChild("Left Hip"),
	["Right Hip"] = newcharTorso:WaitForChild("Right Hip")
}

local Inverse = emptyCFrame.Inverse
local ToAxisAngle = emptyCFrame.ToAxisAngle
local ToObjectSpace = emptyCFrame.ToObjectSpace
local ToEulerAnglesXYZ = emptyCFrame.ToEulerAnglesXYZ

local function RCA6dToCFrame(Motor6D, TargetPart, ReferencePart)
	local rel = Inverse(gameIndex(ReferencePart, "CFrame")) * gameIndex(TargetPart, "CFrame")
	local delta = Inverse(gameIndex(Motor6D, "C0")) * rel * gameIndex(Motor6D, "C1")
	local axis, angle = ToAxisAngle(delta)
	local newangle = axis * angle
	sethiddenproperty(Motor6D, 'ReplicateCurrentOffset6D', CFrameIndex(delta, "Position"))
	sethiddenproperty(Motor6D, 'ReplicateCurrentAngle6D', newangle)
end

local poscache = CFrame.new(255, 255, 0)

local task_spawn = task.spawn
local function stepReanimate()
	--[[task_spawn(function()]]
	if flinging then return end

	if hiderootpart then
		newcharRoot.CFrame = poscache 
        + Vector3_new(0, math_random(1, 2) / 319.19, 0)
	else
		newcharRoot.CFrame = fakeChar.HumanoidRootPart.CFrame + Vector3_new(0, math_random(1, 2) / 319.19, 0)
	end

	--// YES it is unstable. im working on optimizing (later)

    	newcharRoot.Velocity = vector3zero
	newcharRoot.Velocity = vector3zero

	local rootjoint = jointmapping["RootJoint"]
	RCA6dToCFrame(rootjoint, limbmapping["RootJoint"], newcharRoot)

	for joint, limb in pairs(limbmapping) do
		local relativecframe = ToObjectSpace(limb.CFrame, gameIndex(fakecharTorso, "CFrame"))
		local pitch, yaw, _ = ToEulerAnglesXYZ(relativecframe)

		local angle = 0

		if joint == "Neck" or joint == "RootJoint" then
			angle = -yaw
		elseif joint == "Left Shoulder" or joint == "Left Hip" then
			angle = pitch
		elseif joint == "Right Shoulder" or joint == "Right Hip" then
			angle = -pitch
		end

		if joint ~= "RootJoint" then
			gameNewIndex(jointmapping[joint], "DesiredAngle", angle)
			RCA6dToCFrame(jointmapping[joint], limb, newChar.Torso)
		end
	end
	--[[end)]]
end

local function setdestroyheight(height)
	local sucess, result = pcall(function()
		workspace.FallenPartsDestroyHeight = height
	end)
end

local currentheight = workspace.FallenPartsDestroyHeight

local function flinginternal(character, time)
	if character == newChar then return end
	local time = time or 5

	flinging = true
	local start = tick()
	local connection
	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if tick() - start >= time then
			setdestroyheight(currentheight)
			flinging = false
			connection:Disconnect()
			--break
		end
		if character then
			if character:FindFirstChild("HumanoidRootPart") then
				local velocity = character.HumanoidRootPart.Velocity
				local direction = velocity.Magnitude > 1 and velocity.Unit or Vector3_new(0, 0, 0)
				local predictedPosition = (character.PrimaryPart.CFrame or character.HumanoidRootPart.CFrame).Position + direction * math_random(5, 12)

				newcharRoot.CFrame = CFrame.new(predictedPosition)
				newcharRoot.Velocity = Vector3_new(9e7, 9e7 * 10, 9e7)
				newcharRoot.RotVelocity = Vector3_new(9e8, 9e8, 9e8)
			else
				flinging = false
				connection:Disconnect()
				--break
			end
		else
			flinging = false
			connection:Disconnect()
			--break
		end
	end)

end

getgenv().fling = function(character, time, yield)
	setdestroyheight(NaN)
	local yield = yield or false
	if yield then
		flinginternal(character, time)
	else
		tspawn(flinginternal, character, time)
	end
end

local function disableCollisions()
	pcall(function()
		for _, char in ipairs({ newChar }) do
			for _, obj in ipairs(GetDescendants(char)) do
				if IsA(obj, "BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local function disableCollisionsWithFakeChar()
	pcall(function()
		for _, char in ipairs({ newChar, fakeChar }) do
			for _, obj in ipairs(GetDescendants(char)) do
				if IsA(obj, "BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local RunService = game:GetService("RunService")

local postSimConnection = RunService.PostSimulation:Connect(stepReanimate)
local disableCollisionConnection;

local humanoidnewchar = newChar:WaitForChild("Humanoid")

humanoidnewchar.PlatformStand = true
humanoidnewchar.AutoRotate = false

if fakecollisions then
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisions)
else
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisionsWithFakeChar)
end

if not permadeathcharacter then
	fakeChar.Humanoid.Died:Once(function()
		disableCollisionConnection:Disconnect()
		postSimConnection:Disconnect()

		fakeChar:Destroy()
		game:GetService("Players").LocalPlayer.Character = newChar
		newChar:BreakJoints()
	end)
end

workspace.CurrentCamera.CameraSubject = fakeChar:WaitForChild("Humanoid")

finished = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/anims"))









    













-- gObl00x Notification
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "gOb scripts";
	Text = "LOL Time to Exploit!";
	Icon = "rbxthumb://type=Asset&id=126389658690593&w=150&h=150"})
Duration = 15;

-- Dance 1 (The Hero)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "The Hero"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("The Hero.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/The%20Hero.mp3"))     
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 133160365635320)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("The Hero.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 1 and music stopped")
end)



-- Dance 2 (Two)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Two"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Two.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Two.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 137845929482571)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Two.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 2 and music stopped")
end)



-- Dance 3 (The Flop)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "The Flop"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("The Flop.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/The%20Flop.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 84447598378239)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("The Flop.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 3 and music stopped")
end)



-- Dance 4 (Club Penguin)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Club Penguin"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Club Penguin.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Club%20Penguin.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 89761302048916)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Club Penguin.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 4 and music stopped")
end)



-- Dance 5 (Breakdance)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Breakdance"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Breakdance.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Breakdance.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 132886479585903)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Breakdance.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 5 and music stopped")
end)



-- Dance 6 (Insanity)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Insanity"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Insanity.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Insanity.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 139483347792972)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Insanity.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 6 and music stopped")
end)










-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "OPM"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("opm.mp3", game:HttpGet("https://github.com/AzureEpic/noo/raw/refs/heads/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 132984799748032)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("opm.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 6 and music stopped")
end)






		



-- Dance 7 (Mannrobics)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Mannrobics"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Mannrobics.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Mannrobics.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 137456359844967)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Mannrobics.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 7 and music stopped")
end)



-- Dance 8 (Step)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Step"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Step.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Step.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 124074233795203)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Step.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
    
    player.Character.Humanoid.WalkSpeed = 3
end)

tool.Unequipped:Connect(function()
    player.Character.Humanoid.WalkSpeed = 16
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 8 and music stopped")
end)



-- Dance 9 (Poke Dance)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Poke Dance"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Poke Dance.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Poke%20Dance.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 18986687692)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Poke Dance.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 9 and music stopped")
end)



-- Dance 10 (Spooky Month)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Spooky Month"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Spooky Month.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Spooky%20Month.mp3"))
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 15231364673)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Spooky Month.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 10 and music stopped")
end)



-- Dance 11 (Chinese Dance)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Chinese Dance"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Chinese Dance.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Chinese%20Dance.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 124210157097622)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Chinese Dance.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 11 and music stopped")
end)



-- Dance 12 (Doodle)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Doodle"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Doodle.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Doodle.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 137721173051346)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Doodle.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 12 and music stopped")
end)



-- Dance 13 (Shinji Chair)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Shinji Chair"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Shinji Meme.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Shinji%20Meme.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 130485792890829)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Shinji Meme.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 13 and music stopped")
end)



-- Dance 14 (Rakuten Lemonade)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Rakuten Lemonade"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Rakuten Lemonade.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Rakuten%20Lemonade.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 18985726113)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Rakuten Lemonade.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 14 and music stopped")
end)



-- Dance 15 (Lonely Lonely Hakari)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Lonely Lonely (Hakari)"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Lonely Lonely.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Lonely%20Lonely.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 92699725136780)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Lonely Lonely.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end

    player.Character.Humanoid.WalkSpeed = 10

end)

tool.Unequipped:Connect(function()
    player.Character.Humanoid.WalkSpeed = 16
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 15 and music stopped")
end)



-- Dance 16 (Boppin)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Boppin"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Boppin.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Boppin.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 13579968035)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Boppin.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 16 and music stopped")
end)



-- Dance 17 (Shuba Duck)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Shuba Duck"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Hey Ya.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Hey%20Ya.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 13357063395)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Hey Ya.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 17 and music stopped")
end)



-- Dance 18 (Goopie)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Goopie"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Goopie.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Goopie.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 7828640127)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Goopie.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 18 and music stopped")
end)



-- Dance 19 (Prince of Egypt)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Prince of Egypt"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Prince Of Egypt.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Prince%20Of%20Egypt.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 100136360352723)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Prince Of Egypt.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 19 and music stopped")
end)



-- Dance 20 (WMD Boombox)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "WMD Boombox"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Wipe me Down.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Wipe%20me%20Down.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 72460213504303)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Wipe me Down.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 20 and music stopped")
end)



-- Dance 21 (Shoo Whop)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Shoo Whop"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Shoo Whop.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Shoo%20Whop.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 121535445943256)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Shoo Whop.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 21 and music stopped")
end)


-- Dance 22 (PoPiPo) 
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "PoPiPo"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("PoPiPo.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/PoPiPo.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 78991327797272)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("PoPiPo.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 22 and music stopped")
end)


-- Dance 23 (Monoko) 
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Monoko"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Monoko.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Monoko.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 139889845987864)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Monoko.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end

    player.Character.Humanoid.WalkSpeed = 8

end)

tool.Unequipped:Connect(function()
    player.Character.Humanoid.WalkSpeed = 16
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 23 and music stopped")
end)


-- Dance 24 (Lagtrain) 
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Lagtrain"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Lagtrain.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Lagtrain.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 131559207454945)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Lagtrain.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end

    player.Character.Humanoid.WalkSpeed = 20

end)

tool.Unequipped:Connect(function()
    player.Character.Humanoid.WalkSpeed = 16
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 24 and music stopped")
end)


-- Dance 25 (Inside In My Head)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Inside In My Head"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("In My Head.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/In%20My%20Head.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 114160464579438)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("In My Head.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 25 and music stopped")
end)


-- Dance 26 (Lemon Melon Cookie)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Lemon Melon Cookie"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("LMC.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/LMC.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 120262284704633)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("LMC.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 26 and music stopped")
end)


-- Dance 27 (Get Down)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Get Down"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Get Down.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Get%20Down.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 98916367562022)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Get Down.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 27 and music stopped")
end)


-- Dance 28 (Dia Delicia)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Dia Delicia"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Dia Delicia.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Dia%20Delicia.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 80641587562132)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Dia Delicia.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 28 and music stopped")
end)


-- Dance 29 (Epik)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Epik"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Epik.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Epik.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 135424282094138)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Epik.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 29 and music stopped")
end)


-- Dance 30 (Shigure)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Shigure"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Loli Dance.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Loli%20Dance.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 14887006269)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Loli Dance.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 30 and music stopped")
end)


-- Dance 31 (I WANNA RUN AWAY)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "I WANNA RUN AWAY🗣️"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("IWRA.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/IWRA.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 131562546189485)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("IWRA.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 31 and music stopped")
end)


-- Dance 32 (WhatsApp Meme)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "WhatsApp Meme"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("WhatsApp Meme.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/WhatsApp%20Meme.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 131539514978219)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("WhatsApp Meme.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 32 and music stopped")
end)


-- Dance 33 (Goofy)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Goofy"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Goofy Song.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Goofy%20Song.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 75148929064618)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Goofy Song.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 33 and music stopped")
end)


-- Dance 34 (Who Can It Be Now?)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Who Can It Be Now?"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("WCIBN.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/WCIBN.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 16240038168)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("WCIBN.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 34 and music stopped")
end)


-- Dance 35 (Pretty Princess)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "Pretty Princess"
tool.RequiresHandle = false
tool.Parent = backpack

        writefile("Pretty Princess Theme.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/Pretty%20Princess%20Theme.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
    end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
    local character = player.Character
    if character then
        Anim = Animator.new(character, 118452043589079)
        Anim:Play()
        Anim.Stopped:Connect(function()
            Anim:Play()
        end)
        sound = Instance.new("Sound")
        sound.SoundId = getcustomasset("Pretty Princess Theme.mp3")
        sound.Volume = 2
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    end
end)

tool.Unequipped:Connect(function()
    if Anim then
        Anim:Stop()
        Anim:Destroy()
    end
    if sound then
        sound:Stop()
        sound:Destroy()
    end
    print("Dance 35 and music stopped")
end)











    






    



  end)


repeat task.wait() until finished
