local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local invis_on = false

local function toggleInvis(_, inputState, _)
    if inputState ~= Enum.UserInputState.Begin then return end -- only trigger once per press

    invis_on = not invis_on
    if invis_on then
        local savedpos = LocalPlayer.Character.HumanoidRootPart.CFrame

        task.wait()
        LocalPlayer.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))

        task.wait(0.15)
        local Seat = Instance.new('Seat', workspace)
        Seat.Anchored = false
        Seat.CanCollide = false
        Seat.Name = 'invischair'
        Seat.Transparency = 1
        Seat.Position = Vector3.new(-25.95, 84, 3537.55)

        local Weld = Instance.new("Weld", Seat)
        Weld.Part0 = Seat
        Weld.Part1 = LocalPlayer.Character:FindFirstChild("Torso") or LocalPlayer.Character:FindFirstChild("UpperTorso")

        task.wait()
        Seat.CFrame = savedpos

        game.StarterGui:SetCore("SendNotification", {
            Title = "Invis On",
            Duration = 1,
            Text = "",
        })
    else
        local chair = workspace:FindFirstChild('invischair')
        if chair then chair:Destroy() end

        game.StarterGui:SetCore("SendNotification", {
            Title = "Invis Off",
            Duration = 1,
            Text = "",
        })
    end
end

-- Bind to the X key
ContextActionService:BindAction("ToggleInvis", toggleInvis, false, Enum.KeyCode.X)
