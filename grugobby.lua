for _ = 1, 10000 do
--game:GetService("ReplicatedStorage").FreeSkipEvent:FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("RebirthEvent"):FireServer()
--wait(0.0001)
end
