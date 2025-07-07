-- gObl00x Notification
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "have you ever played bloxfruits";
	Text = "with your life on the line";
	Icon = "rbxthumb://type=Asset&id=126389658690593&w=150&h=150"})
Duration = 15;



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




local tool = Instance.new("Tool")
tool.Name = "pp"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 125079981123066)
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
	print("gadfsdfsfs and music stopped")
end)



local tool = Instance.new("Tool")
tool.Name = "Tall"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 77224418341462)
		Anim:Play()
		Anim.Stopped:Connect(function()
			Anim:Play()
		end)
		sound = Instance.new("Sound")
		sound.SoundId = getcustomasset("p.mp3")
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
	print("gadfsdfsfs and music stopped")
end)


local tool = Instance.new("Tool")
tool.Name = "Wide"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 119666431052314)
		Anim:Play()
		Anim.Stopped:Connect(function()
			Anim:Play()
		end)
		sound = Instance.new("Sound")
		sound.SoundId = getcustomasset("p.mp3")
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
	print("gadfsdfsfs and music stopped")
end)










local tool = Instance.new("Tool")
tool.Name = "Elevator"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 88967272465848)
		Anim:Play()
		Anim.Stopped:Connect(function()
			Anim:Play()
		end)
		sound = Instance.new("Sound")
		sound.SoundId = getcustomasset("p.mp3")
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
	print("gadfsdfsfs and music stopped")
end)





local tool = Instance.new("Tool")
tool.Name = "Discombobulate"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 91576392401568)
		Anim:Play()
		Anim.Stopped:Connect(function()
			Anim:Play()
		end)
		sound = Instance.new("Sound")
		sound.SoundId = getcustomasset("p.mp3")
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
	print("gadfsdfsfs and music stopped")
end)




local tool = Instance.new("Tool")
tool.Name = "Limb Line"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 118054103869881)
		Anim:Play()
		Anim.Stopped:Connect(function()
			Anim:Play()
		end)
		sound = Instance.new("Sound")
		sound.SoundId = getcustomasset("p.mp3")
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
	print("gadfsdfsfs and music stopped")
end)







local tool = Instance.new("Tool")
tool.Name = "Tall Line"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded
if not getgenv()["Animator"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
end

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 93352902645060)
		Anim:Play()
		Anim.Stopped:Connect(function()
			Anim:Play()
		end)
		sound = Instance.new("Sound")
		sound.SoundId = getcustomasset("p.mp3")
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
	print("gadfsdfsfs and music stopped")
end)
