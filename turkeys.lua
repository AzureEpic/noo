local args = {
    [1] = {
        [1] = "RemoveAll"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("WearItem"):FireServer(unpack(args))
local args = {
    [1] = {
        [1] = "Wear",
        [2] = "130213380",
        [3] = "Faces"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("WearItem"):FireServer(unpack(args))
--// UI Setup
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "TurkeySpamGui"

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 150, 0, 50)
toggleButton.Position = UDim2.new(0.5, -75, 0.5, -25)
toggleButton.Text = "Toggle Turkey Spam"
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 150, 0)

--// Dragging logic
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

toggleButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = toggleButton.Position
	end
end)

toggleButton.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		toggleButton.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

--// Spam logic
local spamming = false

toggleButton.MouseButton1Click:Connect(function()
	spamming = not spamming
	toggleButton.Text = spamming and "Spamming: ON" or "Spamming: OFF"

	if spamming then
		task.spawn(function()
			while spamming do
				local args = {
					[1] = "Morph",
					[2] = "Turkey"
				}

				game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer(unpack(args))
				wait() -- no cooldown, adjust if needed
			end
		end)
	end
end)
