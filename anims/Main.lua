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







-- 🛠️ Hotfix for Signal.lua (patches missing :Fire method)
getgenv().httpRequireCache = getgenv().httpRequireCache or {}
getgenv().httpRequireCache[pathToGithub .. "Nevermore/Signal.lua"] = (function()
	local HttpService = game:GetService("HttpService")

	local Signal = {}
	Signal.__index = Signal
	Signal.ClassName = "Signal"

	function Signal.new()
		local self = setmetatable({}, Signal)
		self._bindableEvent = Instance.new("BindableEvent")
		self._argMap = {}
		self._source = ""

		self._bindableEvent.Event:Connect(function(key)
			self._argMap[key] = nil
			if (not self._bindableEvent) and (not next(self._argMap)) then
				self._argMap = nil
			end
		end)

		return self
	end

	function Signal:Fire(...)
		if not self._bindableEvent then
			warn(("Signal is already destroyed. %s"):format(self._source))
			return
		end

		local args = table.pack(...)
		local key = HttpService:GenerateGUID(false)
		self._argMap[key] = args
		self._bindableEvent:Fire(key)
	end

	function Signal:Connect(handler)
		if typeof(handler) ~= "function" then
			error(("connect(%s)"):format(typeof(handler)), 2)
		end

		return self._bindableEvent.Event:Connect(function(key)
			local args = self._argMap[key]
			if args then
				handler(table.unpack(args, 1, args.n))
			else
				error("Missing arg data, probably due to reentrance.")
			end
		end)
	end

	function Signal:Wait()
		local key = self._bindableEvent.Event:Wait()
		local args = self._argMap[key]
		if args then
			return table.unpack(args, 1, args.n)
		else
			error("Missing arg data, probably due to reentrance.")
		end
	end

	function Signal:Destroy()
		if self._bindableEvent then
			self._bindableEvent:Destroy()
			self._bindableEvent = nil
		end
		setmetatable(self, nil)
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
