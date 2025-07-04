--[[ example usage:
local musicLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureEpic/noo/refs/heads/main/musicloader.lua"))()
musicLoader("opm.mp3", "https://raw.githubusercontent.com/AzureEpic/noo/main/sounds/opm.mp3", true, 2, workspace)

]]


return function(Name, URL, looped, volume, parent)
   
    writefile(Name, game:HttpGet(URL))
    task.wait() 
    local asset = getcustomasset(Name)

    
    local sound = parent:FindFirstChild("BGMSoundCustom")
    if not sound then
        sound = Instance.new("Sound")
        sound.Name = "BGMSoundCustom"
        sound.Parent = parent
    end

   
    sound.SoundId = asset
    sound.Looped = looped or false
    sound.Volume = volume or 1

    sound:Play()
end
