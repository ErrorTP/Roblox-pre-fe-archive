local function createSandbox()
	print("Using Errorcodedot's AutoFE v1.0.2")
	local UserInputService_Names = {
		"InputEnded",
		"InputBegan",
		"InputChanged",
		"TouchPan",
		"TouchTap",
		"TouchStarted",
		"TouchEnded",
		"TouchMoved",
		"TouchPinch",
		"TouchSwipe",
		"TouchRotate",
		"TouchLongPress",
		"TouchTapInWorld",
		"JumpRequest",
		"PointerAction",
		"WindowFocused",
		"TextBoxFocused",
		"GamepadConnected",
		"GamepadDisconnected",
		"UserCFrameChanged",
		"DeviceGravityChanged",
		"DeviceRotationChanged",
		"DeviceAccelerationChanged",
		"LastInputTypeChanged"}
	local Mouse_Events = {
		"Idle",
		"Move",
		"Button1Up",
		"Button1Down",
		"Button2Up",
		"Button2Down",
		"WheelForward",
		"WheelBackward",
		"KeyDown",
		"KeyUp",
		"keyDown",
		"keyUp"
	}
	local UIS_Bindables = Instance.new("Folder")
	UIS_Bindables.Parent = script
	local FakeMouseBindables = Instance.new("Folder")
	FakeMouseBindables.Parent = script
	local function makeBinds()
		local Bind
		for i,v in pairs(UserInputService_Names) do
			Bind = Instance.new("BindableEvent")
			Bind.Name = v
			Bind.Parent = UIS_Bindables
		end
		for i,v in pairs(Mouse_Events) do
			Bind = Instance.new("BindableEvent")
			Bind.Name = v
			Bind.Parent = FakeMouseBindables
		end
	end
	makeBinds()
	local Mouseobj = {
		TargetFilter = nil,
		Icon = ""
	}
	local FakeMouse = Instance.new("RemoteEvent")
	FakeMouse.Parent = owner.PlayerGui
	FakeMouse.Name = "Mouse"
	local MouseUpdate = Instance.new("RemoteEvent")
	MouseUpdate.Parent = owner.PlayerGui
	MouseUpdate.Name = "MouseUpdate"
	local UISRemote = Instance.new("RemoteEvent")
	UISRemote.Parent = owner.PlayerGui
	UISRemote.Name = "UIS"
	local LocalScript = NLS([[local u = game:GetService("UserInputService")
local r = owner.PlayerGui:WaitForChild("UIS")
local r2 = owner.PlayerGui:WaitForChild("Mouse")
local r3 = owner.PlayerGui:WaitForChild("MouseUpdate")
local sandboxed = {
	"InputEnded",
	"InputBegan",
	"InputChanged",
	"TouchPan",
	"TouchTap",
	"TouchStarted",
	"TouchEnded",
	"TouchMoved",
	"TouchPinch",
	"TouchSwipe",
	"TouchRotate",
	"TouchLongPress",
	"TouchTapInWorld",
	"JumpRequest",
	"PointerAction",
	"WindowFocused",
	"TextBoxFocused",
	"GamepadConnected",
	"GamepadDisconnected",
	"UserCFrameChanged",
	"DeviceGravityChanged",
	"DeviceRotationChanged",
	"DeviceAccelerationChanged",
	"LastInputTypeChanged"
}
for i,v in pairs(sandboxed) do
	u[v]:Connect(function(processed,...)
		if processed then return end
		local ut = table.pack(...)
		ut["n"] = nil
		if type(ut[1])=="userdata" and typeof(ut[1])~="EnumItem" then
			pcall(function()
				ut[1] = {
					KeyCode = ut[1].KeyCode,
					Position= ut[1].Position,
					Parent=ut[1].Parent,
					UserInputType = ut[1].UserInputType,
					Delta=ut[1].Delta,
					UserInputState = ut[1].UserInputState,
				}
				if v == "InputBegan" then
					r2:FireServer("KeyDown",string.lower(ut[1].KeyCode.Name))
					r2:FireServer("keyDown",string.lower(ut[1].KeyCode.Name))
				elseif v == "InputEnded" then
					r2:FireServer("KeyUp",string.lower(ut[1].KeyCode.Name))
					r2:FireServer("keyUp",string.lower(ut[1].KeyCode.Name))
				end
			end)
		end
		r:FireServer(v,table.unpack(ut))
	end)
end
local mouse = game.Players.LocalPlayer:GetMouse()
local Mouse_Events = {
	"Idle",
	"Move",
	"Button1Up",
	"Button1Down",
	"Button2Up",
	"Button2Down",
	"WheelForward",
	"WheelBackward",
	"KeyDown",
	"KeyUp",
	"keyDown",
	"keyUp"
}
game:GetService("RunService").Heartbeat:Connect(function()
	r3:FireServer({
		X=mouse.X,
		Y=mouse.Y,
		Target=mouse.Target,
		Hit=mouse.Hit,
		Origin=mouse.Origin,
		UnitRay=mouse.UnitRay,
		TargetSurface=mouse.TargetSurface,
		ViewSizeX = mouse.ViewSizeX,
		ViewSizeY = mouse.ViewSizeY
	})
end)
r3.OnClientEvent:Connect(function(var,val)
	mouse[var] = val
end)
for i,v in pairs(Mouse_Events) do
	mouse[v]:Connect(function(...)
		r2:FireServer(v,...)
	end)
end]],owner.PlayerGui)
	LocalScript.Name = "FE Compatibility"
	UISRemote.OnServerEvent:Connect(function(plr,event,...)
		if plr~=owner then return end
		--print(event,...)
		UIS_Bindables:FindFirstChild(event):Fire(...)
	end)
	FakeMouse.OnServerEvent:Connect(function(plr,event,...)
		if plr~=owner then return end
		FakeMouseBindables:FindFirstChild(event):Fire(...)
	end)
	MouseUpdate.OnServerEvent:Connect(function(plr,newmouse)
		for i,v in pairs(newmouse) do
			Mouseobj[i] = v
		end
	end)
	local original = {
		game = game,
		typeof = typeof,
		players = game:GetService("Players"),
		RunService = game:GetService("RunService"),
		UserInputService = game:GetService("UserInputService")
	}
	local _game = newproxy(true)
	local _gamem = getmetatable(_game)
	local players = newproxy(true)
	local _players = getmetatable(players)
	local FakePlayer = newproxy(true)
	local _FakePlayer = getmetatable(FakePlayer)
	local FakeMouse = newproxy(true)
	local _FakeMouse = getmetatable(FakeMouse)
	_FakeMouse.__newindex = function(self,var,val)
		if var == "TargetFilter" or var=="Icon" then
			Mouseobj[var] = val
			MouseUpdate:FireClient(owner,var,val)
		end
	end
	_FakeMouse.__index = function(self,v)
		local method = Mouseobj[v]
		if FakeMouseBindables:FindFirstChild(v) then
			return FakeMouseBindables:FindFirstChild(v).Event
		else
			return method
		end
	end
	_FakePlayer.__index = function(self,v)
		if v=="real" then
			return owner
		end
		local method = owner[v]
		if type(method) == "function" then
			if v=="GetMouse" then
				return function(_, ...)
					return FakeMouse
				end
			else
				return function(_, ...)
					return method(owner,...)
				end
			end
		else
			return method
		end
	end
	_players.__index = function(self,v)
		local method = original.players[v]
		if v == "LocalPlayer" or v == "localPlayer" then
			return FakePlayer
		elseif type(method) == "function" then
			return function(_, ...)
				return method(original.players, ...)
			end
		else
			return method
		end
	end
	local RunService = newproxy(true)
	local _RunService = getmetatable(RunService)
	_RunService.__index = function(self,v)
		local method = original.RunService[v]
		if v == "RenderStepped" then
			return original.RunService.Stepped
		elseif type(method) == "function" then
			if v == "IsServer" then
				return function(...)
					return false
				end
			elseif v == "IsClient" then
				return function(...)
					return true
				end
			end
			return function(_, ...)
				return method(original.game:GetService("RunService"), ...)
			end
		else
			return method
		end
	end
	local UserInputService = newproxy(true)
	local _UserInputService = getmetatable(UserInputService)
	_UserInputService.__index = function(self,v)
		local method = original.UserInputService[v]
		if table.find(UserInputService_Names,v) then
			return UIS_Bindables:FindFirstChild(v).Event
		elseif type(method) == "function" then
			return function(_, ...)
				return method(original.game, ...)
			end
		else
			return method
		end
	end
	_UserInputService.__newindex = function(self,i,n)
		
	end
	local ProxiedObjs = {
		_game,
		players,
		UserInputService,
		RunService
	}
	local gameServices = {
		Players = players,
		UserInputService = UserInputService,
		RunService = RunService,
		players=players
	}
	local function GetService(self,service)
		service = string.gsub(service," ","")
		if gameServices[service]~=nil then
			return gameServices[service]
		else
			return original.game:GetService(service)
		end
	end
	_gamem.__index = function(self, v)
		if v=="Run Service" then
			return GetService(_game,"RunService")
		end
		if v == "_objtype" then
			return "Instance"
		end
		local method = original.game[v]
		if type(method) == "function" then
			if v == "GetService" or v=="service" then
				return function(_, ...)
					return GetService(original.game, ...)
				end
			elseif v=="findFirstChild" then
				return function(_, ...)
					return method(original.game, ...)
				end
			else
				return function(_, ...)
					return method(original.game, ...)
				end
			end
		elseif gameServices[v]~=nil then
			return GetService(original.game,v)
		else
			return method
		end
	end
	_FakeMouse.__metatable = "The metatable is locked"
	_FakePlayer.__metatable = "The metatable is locked"
	_players.__metatable = "The metatable is locked"
	_RunService.__metatable = "The metatable is locked"
	_gamem.__metatable = "The metatable is locked"
	function _typeof(obj)
		if table.find(ProxiedObjs,obj) then
			return obj._objtype
		else
			return original.typeof(obj)
		end
	end
	local ins = Instance.new
	local fakeInstance = {}
	function fakeInstance.new(Name:string,Parent)
		if Name == "ObjectValue" then
			local real = ins(Name,Parent)
			local fake = newproxy(true)
			local meta = getmetatable(fake)
			game:GetService("Players"):IsA("Player")
			local newindex = function(self,index,new)
				if new == nil then
				elseif index == "Value" then
					if new.real~=nil then
						real[index]=new.real
						return
					end
				end
				real[index]=new
			end
			local index = function(self,index)
				if index == 'real' then
					return real
				end
				if real[index]:IsA("Player") and real[index]==owner then
					return _game.Players.LocalPlayer
				elseif real[index]:IsA("ObjectValue") then
					local fake = newproxy(true)
					local meta = getmetatable(fake)
					meta.__index = index
					meta.__newindex = newindex
					return fake
				end
				return real[index]
			end
			meta.__index = index
			meta.__newindex = newindex
			return fake
		elseif Name == "Sound" then
			local real = ins(Name,Parent)
			local fake = newproxy(true)
			local meta = getmetatable(fake)
			meta.__index = function(self,index)
				if index == 'real' then
					return real
				end
				local method = real[index]
				if typeof(method) == "Instance" then
					return method
				elseif typeof(method) == "function" then
					return function(...)
						local args = table.pack(...)
						if args[1]==self then
							args[1] = real
						end
						local output = table.pack(method(table.unpack(args)))
						output["n"]=nil
						return table.unpack(output)
					end

				end
				return method
			end
			meta.__newindex = function(self,index,new)
				if index == "Parent" and (new == workspace) then
					real.Parent=owner.Character.HumanoidRootPart
					return
				end
				real[index]=new
			end
			return fake
		elseif Name=="HopperBin" then
			local real = ins('Tool',Parent)
			real.Name = "HopperBin"
			real.RequiresHandle=false
			local fake = newproxy(true)
			local meta = getmetatable(fake)
			meta.__index = function(self,index)
				if index == 'real' then
					return real
				elseif index == "Selected" then
					return real.Equipped
				elseif index == "Deselected" then
					return real.Unequipped
				end
				local method = real[index]
				if typeof(method) == "Instance" then
					return method
				elseif typeof(method) == "function" then
					return function(...)
						local args = table.pack(...)
						if args[1]==self then
							args[1] = real
						end
						local output = table.pack(method(table.unpack(args)))
						output["n"]=nil
						return table.unpack(output)
					end
				end
				return method
			end
			meta.__newindex = function(self,index,new)
				if index=="Parent" and typeof(new)=="userdata" and new.real~=nil then
					real[index]=new.real
					return
				end
				real[index]=new
			end
			return fake
		end
		if typeof(Parent) == "userdata" and Parent.real~=nil then
			return ins(Name,Parent.real)
		else
			return ins(Name,Parent)
		end
	end
	local realscript = script
	local _script = newproxy(true)
	local meta = getmetatable(_script)
	meta.__index = function(self,index)
		if index=="real" then
			return realscript
		elseif index=="Parent" and realscript.Parent:IsA("Tool") then
			local real = realscript.Parent
			local fake = newproxy(true)
			local meta = getmetatable(fake)
			meta.__index = function(self,index)
				if index == 'real' then
					return real
				elseif index == "Selected" then
					return real.Equipped
				elseif index == "Deselected" then
					return real.Unequipped
				end
				local method = real[index]
				if typeof(method) == "Instance" then
					return method
				elseif typeof(method) == "function" then
					return function(...)
						local args = table.pack(...)
						if args[1]==self then
							args[1] = real
						end
						local output = table.pack(method(table.unpack(args)))
						output["n"]=nil
						return table.unpack(output)
					end
				end
				return method
			end
			meta.__newindex = function(self,index,new)
				if index=="Parent" and typeof(new)=="userdata" and new.real~=nil then
					real[index]=new.real
					return
				end
				real[index]=new
			end
			return fake
		end
		local method = realscript[index]
		if typeof(method) == "Instance" then
			return method
		elseif typeof(method) == "function" then
			return function(...)
				local args = table.pack(...)
				if args[1]==self then
					args[1] = realscript
				end
				local output = table.pack(method(table.unpack(args)))
				output["n"]=nil
				return table.unpack(output)
			end
		end
		return method
	end
	meta.__newindex = function(self,index,new)
		if index=="Parent" and typeof(new)=="userdata" and new.real~=nil then
			realscript[index]=new.real
			return
		end
		realscript[index]=new
	end
	while not owner.PlayerGui:FindFirstChild("FE Compatibility") do task.wait() end
	task.wait(0.5)
	return _game,_typeof,fakeInstance,_script
end
game,typeof,Instance,script = createSandbox()
loadstring(game:GetService("HttpService"):GetAsync("https://pastebin.com/raw/i8kWKyJ6"))()
