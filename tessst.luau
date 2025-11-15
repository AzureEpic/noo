return function(Name, URL, looped)
	-- download video file
	writefile(Name, game:HttpGet(URL))
	task.wait()

	local asset = getcustomasset(Name)

	-- create ScreenGui if missing
	local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

	local gui = playerGui:FindFirstChild("CustomVideoGui")
	if not gui then
		gui = Instance.new("ScreenGui")
		gui.Name = "CustomVideoGui"
		gui.ResetOnSpawn = false
		gui.Parent = playerGui
	end

	-- create holder frame
	local frame = gui:FindFirstChild("VideoHolder")
	if not frame then
		frame = Instance.new("Frame")
		frame.Name = "VideoHolder"
		frame.Size = UDim2.fromScale(1, 1)
		frame.BackgroundTransparency = 1
		frame.Parent = gui
	end

	-- create VideoFrame
	local video = frame:FindFirstChild("VideoFrame")
	if not video then
		video = Instance.new("VideoFrame")
		video.Name = "VideoFrame"
		video.Size = UDim2.fromScale(1, 1)
		video.BackgroundTransparency = 1
		video.Parent = frame
	end

	video.Video = asset
	video.Looped = looped or false
	video:Play()
end
