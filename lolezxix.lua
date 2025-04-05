print("Thank to lich king for helping")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")

local Window = OrionLib:MakeWindow({Name = "Skibi-lich hub", HidePremium = false, SaveConfig = true})
local Tab = Window:MakeTab({Name = "Главная", Icon = "rbxassetid://89991291117147"})
local Tabv2 = Window:MakeTab({
	Name = "Главная v2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local power = 50
local flight = 0.52
local speed = 0
local slapfarmEnabled = false
local flightEnabled = false
local spamEnabled = false

Tab:AddTextbox({
    Name = "Мощность",
    Default = tostring(power),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            power = num
        else
            powerTextbox:Set(tostring(power))
        end
    end
})

Tab:AddTextbox({
    Name = "Скорость полёта",
    Default = tostring(power),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            flight = num
        else
            flightspeedTextbox:Set(tostring(flight))
        end
    end
})
Tab:AddTextbox({
    Name = "Скорость",
    Default = tostring(speed),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            speed = num
        else
            speedTextbox:Set(tostring(speed))
        end
    end
})

Tab:AddToggle({
    Name = "Включить функцию",
    Default = flightEnabled,
    Callback = function(value)
        flightEnabled = value
    end
})

Tabv2:AddButton({
    Name = "Включить Slap farm",
    Callback = function(value)
game.Players.LocalPlayer.Character.Torso.CFrame = game.Workspace.LobbyGloboStart.Portal.Union.CFrame
wait(0.21)
game.Players.LocalPlayer.Backpack.Brick.Parent = game.Players.LocalPlayer.Character
while task.wait() do
local VU = game:GetService("VirtualUser")
    VU:CaptureController()
    VU:ClickButton1(Vector2.new(9,9,9))
for _,plrs in ipairs(game.Players:GetChildren()) do
if game.Players.LocalPlayer.Character.name ~= plrs.name and plrs.Character.Inlobby.Value == 1 then
game.Players.LocalPlayer.Character.Torso.CFrame = plrs.Character.Torso.CFrame
end
game.Players.LocalPlayer.Character.Humanoid:Died:Connect()
break
end
		end)
			end
    end
})

Tab:AddButton({
    Name = "Увеличить хитбоксы",
    Callback = function()
       local brick = game.Players.LocalPlayer.Character.Brick
			if brick then
--[[OrionLib:MakeNotification({
	Name = "Функция сработала!",
	Content = "Увеличены хитбоксы",
	Image = "rbxassetid://9122804122",
	Time = 5
}) --]]
brick.Handle.Size = Vector3.new(1254, math.random(1, 10), math.random(1, 10))
			end
			end
})

-- buff = Включить мощность и т.д
Tab:AddButton({
    Name = "Включить мощность и т.д",
    Callback = function()
       local brick = game.Players.LocalPlayer.Character.Brick
			if brick then
            brick.Speed.Value = speed
              brick.FlightSpeed.Value = flight
            brick.Power.Value = power / 10
			end
			end
})


Tab:AddButton({
    Name = "Сброс к дефолту",
    Callback = function()
       local brick = game.Players.LocalPlayer.Character:WaitForChild("Brick")
			if brick then
flight = 0.52
        power = 5
        speed = 0.7
brick.Handle.Size = Vector3.new(1.7042549848556519, 2.625422477722168, 0.33697208762168884)
        powerTextbox:Set(tostring(power / 10))
flightspeedTextbox:Set(tostring(flight))

        speedTextbox:Set(tostring(speed))
			end
			end
})

task.spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Brick") then
            local brick = game.Players.LocalPlayer.Character.Brick
	if flightEnabled then
            brick.Speed.Value = speed
            brick.Power.Value = power / 10
                brick.Handle.Massless = true
                brick.Handle.Size = Vector3.new(1254, math.random(1, 10), math.random(1, 10))
                brick.FlightSpeed.Value = flight
            end
        end
    end
end)

OrionLib:Init()

