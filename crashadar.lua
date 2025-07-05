for i = 1,500 do
local args = {
    [1] = "PurchaseItem",
    [2] = "Firework"
}

game:GetService("ReplicatedStorage"):WaitForChild("NetworkEvent"):FireServer(unpack(args))
end

wait(5)

for _, t in game.Players.LocalPlayer.Backpack:GetChildren() do
  if t:IsA("Tool") then
      t.Parent = game.Players.LocalPlayer.Character
  end

end
task.wait(1)
for _, t in game.Players.LocalPlayer.Character:GetChildren() do
  if t:IsA("Tool") then
      t:Activate()
  end

end
