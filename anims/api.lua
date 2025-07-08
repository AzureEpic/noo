local pathToGithub = "https://raw.githubusercontent.com/AzureEpic/noo/refs/heads/main/anims/"

local sub = string.sub

getgenv().httpRequireCache = getgenv().httpRequireCache or {}

getgenv().HttpRequire = function(path, noCache)
	if sub(path, 1, 8) == "https://" or sub(path, 1, 7) == "http://" then
		if not noCache and httpRequireCache[path] then
			return httpRequireCache[path]
		end
		-- syn > request > vanilla
		httpRequireCache[path] = loadstring(
			(syn and syn.request) and syn.request({ Url = path }).Body
				or (request and request({ Url = path }).Body or game:HttpGet(path))
		)()
		return httpRequireCache[path]
	else
		return require(path)
	end
end

getgenv().animatorRequire = function(path)
	return HttpRequire(pathToGithub .. path)
end





getgenv().httpRequireCache = getgenv().httpRequireCache or {}

getgenv().httpRequireCache[pathToGithub .. "Nevermore/Signal.lua"] = (function()
	local Signal = {}
	Signal.__index = Signal

	function Signal.new()
		local self = setmetatable({}, Signal)
		self._bindable = Instance.new("BindableEvent")
		return self
	end

	function Signal:Fire(...)
		self._bindable:Fire(...)
	end

	function Signal:Connect(callback)
		return self._bindable.Event:Connect(callback)
	end

	function Signal:Wait()
		return self._bindable.Event:Wait()
	end

	function Signal:Destroy()
		if self._bindable then
			self._bindable:Destroy()
			self._bindable = nil
		end
	end

	return Signal
end)()




getgenv().Animator = animatorRequire("Animator.lua")

local Utility = animatorRequire("Utility.lua")

getgenv().hookAnimatorFunction = function()
	local OldFunc
	OldFunc = hookmetamethod(game, "__namecall", function(Object, ...)
		local NamecallMethod = getnamecallmethod()
		if not checkcaller() or Object.ClassName ~= "Humanoid" or NamecallMethod ~= "LoadAnimation" then
			return OldFunc(Object, ...)
		end
		local args = { ... }
		if args[2] then
			return OldFunc(Object, ...)
		end
		return Animator.new(Object.Parent, ...)
	end)
	Utility:sendNotif("Hook Loaded\nby whited#4382", nil, 5)
end

Utility:sendNotif("Animator API Loaded", nil, 5)

return "Nullware my beloved <3"
