--// 🌸 NETHERS AP SPAMMER 🌸
--// KEY SYSTEM + SAKURA ANIMATED ON UI ONLY + DRAGGABLE + NO DELAY

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ===== KEY SYSTEM =====
_G.NETHERS_KEY_VALID = _G.NETHERS_KEY_VALID or false

local VALID_KEYS = {
    ["NETHERS123"] = true,
    ["MANGO123"] = true,
    ["SRF234"] = true,
    ["DKFC12D"] = true,
    ["DSGLHVV"] = true,
    ["FK230DL"] = true,
    ["HKNOFP"] = true,
    ["NVBHJK8790"] = true,
}

local function normalizeKey(k)
    return k:upper():gsub("%s+", "")
end

-- ===== SAKURA ANIMATION =====
local function startSakura(frame)
    task.spawn(function()
        while frame.Parent do
            local petal = Instance.new("Frame", frame)
            petal.Size = UDim2.new(0, math.random(6,10), 0, math.random(6,10))
            petal.Position = UDim2.new(math.random(), 0, -0.05, 0)
            petal.BackgroundColor3 = Color3.fromRGB(255,170,210)
            petal.BackgroundTransparency = 0.15
            petal.BorderSizePixel = 0
            petal.Rotation = math.random(0,360)
            Instance.new("UICorner", petal).CornerRadius = UDim.new(1,0)

            local duration = math.random(6,10)
            local tween = TweenService:Create(
                petal,
                TweenInfo.new(duration, Enum.EasingStyle.Linear),
                {
                    Position = UDim2.new(
                        petal.Position.X.Scale + math.random(-5,5)/100, -- léger décalage horizontal
                        0,
                        1.1,
                        0
                    ),
                    Rotation = petal.Rotation + math.random(180,360),
                    BackgroundTransparency = 1
                }
            )
            tween:Play()
            tween.Completed:Connect(function()
                petal:Destroy()
            end)

            task.wait(0.25)
        end
    end)
end

-- ===== AP SPAMMER =====
local function startAPSpammer()
    local Gui = Instance.new("ScreenGui", PlayerGui)
    Gui.Name = "NethersAPSpammer"

    local Main = Instance.new("Frame", Gui)
    Main.Size = UDim2.new(0,300,0,460)
    Main.Position = UDim2.new(0.5,0,0.5,0)
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.BackgroundColor3 = Color3.fromRGB(25,20,35)
    Main.BorderSizePixel = 0
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)

    startSakura(Main) -- 🌸 Sakura ONLY dans le Main frame

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1,0,0,60)
    Title.Text = "🌸 Nethers AP Spammer 🌸"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 20
    Title.TextColor3 = Color3.fromRGB(255,200,230)
    Title.BackgroundTransparency = 1
    Title.Active = true

    -- Drag
    local dragging, dragStart, startPos
    Title.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = i.Position
            startPos = Main.Position
        end
    end)
    Title.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = i.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Player List
    local List = Instance.new("ScrollingFrame", Main)
    List.Position = UDim2.new(0,15,0,80)
    List.Size = UDim2.new(1,-30,1,-95)
    List.BackgroundTransparency = 1
    List.ScrollBarThickness = 4

    local function executeCommands(target)
        local commands = {"inverse","balloon","rocket","jumpscare"}
        local signature = " | Made By Nethers 🌸"
        local channels = TextChatService:FindFirstChild("TextChannels")
        if not channels then return end
        local general = channels:FindFirstChild("RBXGeneral")
        if not general then return end
        for _, cmd in ipairs(commands) do
            general:SendAsync(";"..cmd.." "..target..signature)
        end
    end

    local function refresh()
        List:ClearAllChildren()
        local y = 0
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local b = Instance.new("TextButton", List)
                b.Size = UDim2.new(1,0,0,44)
                b.Position = UDim2.new(0,0,0,y)
                b.Text = "🌸 "..p.DisplayName
                b.Font = Enum.Font.GothamMedium
                b.TextSize = 14
                b.TextColor3 = Color3.fromRGB(255,235,245)
                b.BackgroundColor3 = Color3.fromRGB(45,40,70)
                b.BorderSizePixel = 0
                Instance.new("UICorner", b).CornerRadius = UDim.new(0,14)

                b.MouseButton1Click:Connect(function()
                    executeCommands(p.Name)
                end)

                y += 50
            end
        end
        List.CanvasSize = UDim2.new(0,0,0,y)
    end

    refresh()
    Players.PlayerAdded:Connect(refresh)
    Players.PlayerRemoving:Connect(refresh)
end

-- ===== KEY GUI =====
if _G.NETHERS_KEY_VALID then
    startAPSpammer()
    return
end

local KeyGui = Instance.new("ScreenGui", PlayerGui)

local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0,360,0,220)
Frame.Position = UDim2.new(0.5,0,0.5,0)
Frame.AnchorPoint = Vector2.new(0.5,0.5)
Frame.BackgroundColor3 = Color3.fromRGB(22,18,34)
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,18)

startSakura(Frame) -- 🌸 Sakura uniquement dans le frame de la key GUI

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,50)
Title.Text = "🌸 Nethers Access 🌸"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255,200,230)
Title.BackgroundTransparency = 1

local Box = Instance.new("TextBox", Frame)
Box.Position = UDim2.new(0.1,0,0.4,0)
Box.Size = UDim2.new(0.8,0,0,42)
Box.PlaceholderText = "🔑 ENTER KEY"
Box.Font = Enum.Font.Gotham
Box.TextSize = 15
Box.TextColor3 = Color3.new(1,1,1)
Box.BackgroundColor3 = Color3.fromRGB(40,35,60)
Box.BorderSizePixel = 0
Instance.new("UICorner", Box).CornerRadius = UDim.new(0,12)

local Btn = Instance.new("TextButton", Frame)
Btn.Position = UDim2.new(0.25,0,0.7,0)
Btn.Size = UDim2.new(0.5,0,0,40)
Btn.Text = "UNLOCK"
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 15
Btn.BackgroundColor3 = Color3.fromRGB(255,160,200)
Btn.TextColor3 = Color3.fromRGB(30,20,35)
Btn.BorderSizePixel = 0
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,14)

Btn.MouseButton1Click:Connect(function()
    local key = normalizeKey(Box.Text)
    if VALID_KEYS[key] then
        _G.NETHERS_KEY_VALID = true
        KeyGui:Destroy()
        startAPSpammer()
    else
        Box.Text = ""
        Box.PlaceholderText = "❌ INVALID KEY"
    end
end)
