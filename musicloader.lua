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
