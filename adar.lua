local args = {
    [1] = 53453455000000000
}

game:GetService("ReplicatedStorage"):WaitForChild("money"):FireServer(unpack(args))
