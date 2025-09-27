-- Dance 31 (I WANNA RUN AWAY)
local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create the tool
local tool = Instance.new("Tool")
tool.Name = "I WANNA RUN AWAY🗣️"
tool.RequiresHandle = false
tool.Parent = backpack

if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

--writefile("IWRA.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/IWRA.mp3"))
-- Load Animator if not already loaded


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
		--sound:Play()
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



