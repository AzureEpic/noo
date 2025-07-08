-- Roblox Animator Script with fixes for race conditions

local TweenService = game:GetService("TweenService")

-- Assuming these are loaded via your custom require function
local Parser = animatorRequire("Parser.lua")
local Utility = animatorRequire("Utility.lua")
local Signal = animatorRequire("Nevermore/Signal.lua")
local Maid = animatorRequire("Nevermore/Maid.lua")

-- Helper function to merge tables
function merge(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
	return t1
end

local Animator = {}

-- Local shortcuts for performance
local tinsert = table.insert
local format = string.format
local spawn = task.spawn
local wait = task.wait
local clock = os.clock

Animator.__index = Animator
Animator.ClassName = "Animator"

function Animator.isAnimator(value)
	return type(value) == "table" and getmetatable(value) == Animator
end

function Animator.new(Character, AnimationResolvable)
	if typeof(Character) ~= "Instance" then
		error(format("invalid argument 1 to 'new' (Instance expected, got %s)", typeof(Character)))
	end

	local self = setmetatable({
		AnimationData = {},
		BoneIgnoreInList = {},
		MotorIgnoreInList = {},
		BoneIgnoreList = {},
		MotorIgnoreList = {},
		handleVanillaAnimator = true,
		Character = nil,
		Looped = false,
		Length = 0,
		Speed = 1,
		IsPlaying = false,
		_stopFadeTime = 0.1,
		_playing = false,
		_stopped = false,
		_isLooping = false,
		_markerSignal = {},
	}, Animator)

	local type = typeof(AnimationResolvable)
	local IsInstance = type == "Instance"
	local IsAnimation = IsInstance and AnimationResolvable.ClassName == "Animation"

	-- Parse the animation data from various sources
	if IsAnimation or type == "string" or type == "number" then
		local keyframeSequence = game:GetObjects(
			"rbxassetid://" .. tostring(IsAnimation and AnimationResolvable.AnimationId or AnimationResolvable)
		)[1]
		if not keyframeSequence or keyframeSequence.ClassName ~= "KeyframeSequence" then
			error(
				IsAnimation and "invalid argument 2 to 'new' (Content inside AnimationId expected)"
					or "invalid argument 2 to 'new' (string/number expected)"
			)
		end
		self.AnimationData = Parser:parseAnimationData(keyframeSequence)
	elseif type == "table" then
		self.AnimationData = AnimationResolvable
	elseif IsInstance then
		if AnimationResolvable.ClassName == "KeyframeSequence" then
			self.AnimationData = Parser:parseAnimationData(AnimationResolvable)
		end
	else
		error(format("invalid argument 2 to 'new' (number,string,table,Instance expected, got %s)", type))
	end

	self.Character = Character
	self.Looped = self.AnimationData.Loop
	self.Length = self.AnimationData.Frames[#self.AnimationData.Frames].Time

	self._maid = Maid.new()

	-- Create signals for animation events
	self.DidLoop = Signal.new()
	self.Stopped = Signal.new()
	self.KeyframeReached = Signal.new()

	-- Add signals to the maid for automatic cleanup
	self._maid.DidLoop = self.DidLoop
	self._maid.Stopped = self.Stopped
	self._maid.KeyframeReached = self.KeyframeReached
	
	return self
end

function Animator:IgnoreMotor(inst)
	if typeof(inst) ~= "Instance" or inst.ClassName ~= "Motor6D" then
		error(format("invalid argument 1 to 'IgnoreMotor' (Motor6D Instance expected, got %s)", typeof(inst)))
	end
	tinsert(self.MotorIgnoreList, inst)
end

function Animator:IgnoreBone(inst)
	if typeof(inst) ~= "Instance" or inst.ClassName ~= "Bone" then
		error(format("invalid argument 1 to 'IgnoreBone' (Bone Instance expected, got %s)", typeof(inst)))
	end
	tinsert(self.BoneIgnoreList, inst)
end

function Animator:IgnoreMotorIn(inst)
	if typeof(inst) ~= "Instance" then
		error(format("invalid argument 1 to 'IgnoreMotorIn' (Instance expected, got %s)", typeof(inst)))
	end
	tinsert(self.MotorIgnoreInList, inst)
end

function Animator:IgnoreBoneIn(inst)
	if typeof(inst) ~= "Instance" then
		error(format("invalid argument 1 to 'IgnoreBoneIn' (Instance expected, got %s)", typeof(inst)))
	end
	tinsert(self.BoneIgnoreInList, inst)
end

function Animator:_playPose(pose, parent, fade)
	-- Recursively apply poses to sub-parts
	if pose.Subpose then
		for _, sp in ipairs(pose.Subpose) do
			self:_playPose(sp, pose, fade)
		end
	end
	if not parent then
		return
	end

	-- Get all motors and bones to animate
	local MotorMap = Utility:getMotorMap(self.Character, { IgnoreIn = self.MotorIgnoreInList, IgnoreList = self.MotorIgnoreList })
	local BoneMap = Utility:getBoneMap(self.Character, { IgnoreIn = self.BoneIgnoreInList, IgnoreList = self.BoneIgnoreList })
	
	local TI = TweenInfo.new(fade, pose.EasingStyle, pose.EasingDirection)
	local Target = { Transform = pose.CFrame }
	
	local M = MotorMap[parent.Name]
	local B = BoneMap[parent.Name]
	local C = {}
	if M and M[pose.Name] then C = merge(C, M[pose.Name]) end
	if B and B[pose.Name] then C = merge(C, B[pose.Name]) end

	-- Apply the tween or set the CFrame directly
	for _, obj in ipairs(C) do
		if self._stopped then break end
		if fade > 0 then
			TweenService:Create(obj, TI, Target):Play()
		else
			obj.Transform = pose.CFrame
		end
	end
end

function Animator:Play(fadeTime, weight, speed)
	fadeTime = fadeTime or 0.1
	if not self.Character or not self.Character.Parent or (self._playing and not self._isLooping) then
		return
	end

	self._playing = true
	self._isLooping = false
	self.IsPlaying = true
	local deathConnection
	local noParentConnection

	-- Handle character death and removal
	local Humanoid = self.Character:FindFirstChildOfClass("Humanoid")
	if Humanoid then
		deathConnection = Humanoid.Died:Connect(function()
			self:Destroy()
		end)
	end
	noParentConnection = self.Character.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			self:Destroy()
		end
	end)
	
	-- Disable vanilla animator if needed
	if self.handleVanillaAnimator then
		local AnimateScript = self.Character:FindFirstChild("Animate")
		if AnimateScript then AnimateScript.Disabled = true end
		if Humanoid then
			for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
				track:Stop(0)
			end
			local characterAnimator = Humanoid:FindFirstChild("Animator")
			if characterAnimator then characterAnimator:Destroy() end
		end
	end

	local start = clock()
	spawn(function()
		-- Main animation loop
		for i, f in ipairs(self.AnimationData.Frames) do
			if self._stopped then break end

			local t = f.Time / (speed or self.Speed)
			
			-- Fire keyframe and marker events
			if f.Name ~= "Keyframe" then
				self.KeyframeReached:Fire(f.Name)
			end
			if f.Marker then
				for k, v in pairs(f.Marker) do
					if self._markerSignal[k] then
						for _, v2 in pairs(v) do
							self._markerSignal[k]:Fire(v2)
						end
					end
				end
			end
			
			-- Apply poses
			if f.Pose then
				for _, p in ipairs(f.Pose) do
					local ft = fadeTime
					if i > 1 then
						ft = (t * (speed or self.Speed) - self.AnimationData.Frames[i - 1].Time) / (speed or self.Speed)
					end
					self:_playPose(p, nil, ft)
				end
			end
			
			-- Wait for the correct time
			local timeToWait = t - (clock() - start)
			if timeToWait > 0 then
				wait(timeToWait)
			end
		end

		-- Cleanup connections
		if deathConnection then deathConnection:Disconnect() end
		if noParentConnection then noParentConnection:Disconnect() end

		-- *** FIX IS HERE ***
		-- Check if the animator has been destroyed before attempting to loop.
		-- We check `self._maid` because it's set to nil in Destroy().
		if self.Looped and not self._stopped and self._maid then
			self.DidLoop:Fire()
			self._isLooping = true
			self:Play(fadeTime, weight, speed) -- Recursive call for loop
			return -- Important: exit the coroutine here to prevent the code below from running
		end

		-- Animation finished (or was stopped)
		if self.Character and self.handleVanillaAnimator then
			if Humanoid and not Humanoid:FindFirstChild("Animator") then
				Instance.new("Animator").Parent = Humanoid
			end
			local AnimateScript = self.Character:FindFirstChild("Animate")
			if AnimateScript then AnimateScript.Disabled = false end
		end
		
		self._stopped = false
		self._playing = false
		self.IsPlaying = false
		
		-- Only fire Stopped if the signal hasn't been destroyed
		if self._maid and self._maid.Stopped then
			self.Stopped:Fire()
		end
	end)
end

function Animator:GetTimeOfKeyframe(keyframeName)
	for _, f in ipairs(self.AnimationData.Frames) do
		if f.Name == keyframeName then
			return f.Time
		end
	end
	return 0
end

function Animator:GetMarkerReachedSignal(name)
	if not self._markerSignal[name] then
		local signal = Signal.new()
		self._markerSignal[name] = signal
		self._maid["M_" .. name] = signal
	end
	return self._markerSignal[name]
end

function Animator:AdjustSpeed(speed)
	self.Speed = speed or 1
end

function Animator:Stop(fadeTime)
	self._stopFadeTime = fadeTime or 0.1
	self._stopped = true
end

function Animator:Destroy()
	-- If the animation coroutine is running, we need to stop it and wait.
	if self._playing then
		self:Stop(0)
		-- Wait for the Play coroutine to fire the Stopped signal
		if self.Stopped then
			self.Stopped:Wait()
		end
	end

	-- Now that we're sure the coroutine is no longer running,
	-- we can safely clean everything up.
	if self._maid then
		self._maid:DoCleaning()
		self._maid = nil -- Set to nil to indicate destruction
	end

	-- Clear out the metatable to prevent further calls
	setmetatable(self, nil)
end

return Animator
