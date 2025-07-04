while true do
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Sit = false
            end
        end
    end)
    task.wait()
end
