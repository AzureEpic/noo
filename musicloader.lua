--[[ example usage:
local musicLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureEpic/noo/refs/heads/main/musicloader.lua"))()
musicLoader("opm.mp3", "https://raw.githubusercontent.com/AzureEpic/noo/main/sounds/opm.mp3")



]]
return function(Name,URL)
writefile(Name, game:HttpGet(URL)) 
  task.wait()
  sound = Instance.new("Sound")
		sound.SoundId = getcustomasset(Name)
		sound.Volume = 2
		sound.Looped = true
		sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		sound:Play()
 
end
