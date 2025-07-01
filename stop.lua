local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureEpic/noo/refs/heads/main/s.lua"))()

_G.DroneController = {}

local dc = _G.DroneController
dc.Player = game:GetService("Players").LocalPlayer
dc.RunService = game:GetService("RunService")
dc.UserInputService = game:GetService("UserInputService")
dc.CurrentDrone = dc.FlyParts[1] -- pointer to active drone part
dc.Seat = nil

dc.Camera = workspace.CurrentCamera
dc.Character = dc.Player.Character or dc.Player.CharacterAdded:Wait()
dc.Humanoid = dc.Character:WaitForChild("Humanoid")
dc.HRP = dc.Character:WaitForChild("HumanoidRootPart")
dc.Folder = workspace:WaitForChild("Blocks"):WaitForChild("Thunblaze911")
dc.FlyParts = {}
dc.BaseSpeed = 100
dc.UpDown = 0
dc.DroneCamEnabled = false
dc.NormalWalkSpeed = dc.Humanoid.WalkSpeed

-- 🧱 Setup fly parts
for _, part in pairs(dc.Folder:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Anchored = false

		local gyro = Instance.new("BodyGyro")
		gyro.MaxTorque = Vector3.new(1,1,1) * math.huge
		gyro.P = 10000
		gyro.CFrame = part.CFrame
		gyro.Parent = part

		local vel = Instance.new("BodyVelocity")
		vel.MaxForce = Vector3.new(1,1,1) * math.huge
		vel.Velocity = Vector3.zero
		vel.P = 10000
		vel.Parent = part

		table.insert(dc.FlyParts, {part = part, gyro = gyro, velocity = vel})
	end
end

local function attachSeatTo(part)
	if dc.Seat then
		dc.Seat:Destroy()
	end

	local seat = Instance.new("Seat")
	seat.Anchored = false
	seat.CanCollide = true
	seat.CFrame = part.CFrame
	seat.Parent = workspace

	dc.Seat = seat
	seat:Sit(dc.Humanoid)
end

attachSeatTo(dc.CurrentDrone.part)


-- 🧠 Get closest part
dc.GetClosestPart = function()
	local closest, shortest = nil, math.huge
	for _, data in pairs(dc.FlyParts) do
		local dist = (data.part.Position - dc.HRP.Position).Magnitude
		if dist < shortest then
			shortest = dist
			closest = data
		end
	end
	return closest
end

-- 🕹️ Input handlers
dc.UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Space then
		dc.UpDown = 1
	elseif input.KeyCode == Enum.KeyCode.LeftShift then
		dc.UpDown = -1
	end
end)

dc.UserInputService.InputEnded:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftShift then
		dc.UpDown = 0
	end
end)

-- 🌀 Control loop
dc.RenderLoop = dc.RunService.RenderStepped:Connect(function()
	local move = dc.Humanoid.MoveDirection
	local camDir = dc.Camera.CFrame.LookVector
	local up = Vector3.new(0, dc.UpDown, 0)
	local fullDir = (camDir + up).Unit

	for _, data in pairs(dc.FlyParts) do
	local part, gyro, vel = data.part, data.gyro, data.velocity
	if data == dc.CurrentDrone then
		if move.Magnitude > 0 then
			vel.Velocity = fullDir * dc.BaseSpeed
		else
			vel.Velocity = Vector3.zero
		end
	end
	gyro.CFrame = CFrame.new(part.Position, part.Position + fullDir)



	if dc.DroneCamEnabled then
	local targetData = dc.CurrentDrone
	if targetData then
		local offset = Vector3.new(0, 5, -10)
		local camPos = targetData.part.Position + offset
		dc.Camera.CameraType = Enum.CameraType.Custom
		dc.Camera.CameraSubject = dc.Humanoid
		dc.Camera.CFrame = CFrame.new(camPos, camPos + dc.Camera.CFrame.LookVector)
	end

    end
end)

-- 🌈 UI SETUP
local Window = OrionLib:MakeWindow({
	Name = "Drone Control UI",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "DroneUI"
})

local MainTab = Window:MakeTab({
	Name = "Controls",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = MainTab:AddSection({ Name = "Drone Movement" })

-- Toggle for Drone Cam
MainTab:AddToggle({
	Name = "Enable Drone Camera",
	Default = false,
	Callback = function(state)
		dc.DroneCamEnabled = state
		if state then
			dc.NormalWalkSpeed = dc.Humanoid.WalkSpeed
			dc.Humanoid.WalkSpeed = 0
		else
			dc.Humanoid.WalkSpeed = dc.NormalWalkSpeed
		end
	end
})

-- Slider to adjust drone speed
MainTab:AddSlider({
	Name = "Drone Speed",
	Min = 10,
	Max = 300,
	Default = 100,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 10,
	ValueName = "studs/s",
	Callback = function(value)
		dc.BaseSpeed = value
	end
})

-- 🔄 Button to swap flyParts[1] with the closest part
MainTab:AddButton({
	Name = "Switch Drone to Nearest Part",
	Callback = function()
		local closest = dc.GetClosestPart()
		if closest and closest ~= dc.CurrentDrone then
			dc.CurrentDrone = closest
			attachSeatTo(closest.part)

			OrionLib:MakeNotification({
				Name = "Switched!",
				Content = "Now controlling nearest part!",
				Time = 3
			})
		end
	end
})


-- 💥 Destroy Button
MainTab:AddButton({
	Name = "Destroy Interface",
	Callback = function()
		if dc.RenderLoop then dc.RenderLoop:Disconnect() end
		OrionLib:Destroy()
		_G.DroneController = {}
	end
})

-- 🧪 Init UI
OrionLib:Init()
