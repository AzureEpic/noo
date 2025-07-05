local args = {
    [1] = 53453455000000000
}

game:GetService("ReplicatedStorage"):WaitForChild("money"):FireServer(unpack(args))




local args = {
    [1] = "PurchaseItem",
    [2] = "Firework"
}

game:GetService("ReplicatedStorage"):WaitForChild("NetworkEvent"):FireServer(unpack(args))
