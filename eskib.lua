


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

writefile("IWRA.mp3", game:HttpGet("https://github.com/gObl00x/Epik-Musics/raw/refs/heads/main/IWRA.mp3"))
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

writefile("mp3.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded



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
		sound.SoundId = getcustomasset("opm.mp3")
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


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 95597903731379)
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




local tool = Instance.new("Tool")
tool.Name = "Car test"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 136191531700652)
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
tool.Name = "Chair 1"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 133105926912632)
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
tool.Name = "Smooth Chair"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 71049821037790)
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
tool.Name = "Table"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 119917797713373)
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
tool.Name = "Plus symbol"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 115788097688955)
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
tool.Name = "weird seizure"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 99912838256503)
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
tool.Name = "torso sign"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 112490325200907)
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
tool.Name = "torso sign (hides nametag)"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 139867618198724)
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


--[[
local tool = Instance.new("Tool")
tool.Name = "torso sign (hides nametag,r15)"
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
		Anim = Animator.new(character, 79034314742750)
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
end)]]




local tool = Instance.new("Tool")
tool.Name = "Pp 2"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 120797321747916)
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
tool.Name = "JoJo pose ahh"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 85507963183329)
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
tool.Name = "Catapult"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 129924903195052)
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
tool.Name = "Walker Run"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))
-- Load Animator if not already loaded


local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 99927339127162)
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
tool.Name = "Afterimages"
tool.RequiresHandle = false
tool.Parent = backpack

writefile("p.mp3", game:HttpGet("https://github.com/AzureEpic/noo/blob/main/sounds/opm.mp3"))

local Anim = nil
local sound = nil

tool.Equipped:Connect(function()
	local character = player.Character
	if character then
		Anim = Animator.new(character, 83338065156611)
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

