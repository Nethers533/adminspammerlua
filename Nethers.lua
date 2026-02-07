-- =========================================
-- Nethers AP Spammer FINAL
-- Key system + Save key + No kick + Clean UI
-- =========================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")

pcall(function()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
end)

-- ===== KEY CONFIG =====
local KEY_FILE = "nethers_key.txt"

local VALID_KEYS = {
    ["Nethers123"] = true,
    ["Mango123"] = true,
    ["Srf234"] = true,
    ["DKF? C12D"] = true,
    ["dsglhvv"] = true,
    ["fk230dl"] = true,
    ["hknofp"] = true,
    ["nvbhjk8790"] = true
}

-- ===== SAVE / LOAD KEY =====
local function getSavedKey()
    if readfile and isfile and isfile(KEY_FILE) then
        return readfile(KEY_FILE)
    end
end

local function saveKey(key)
    if writefile then
        writefile(KEY_FILE, key)
    end
end

-- ===== MAIN GUI =====
local function loadMainGUI()
    local ScreenGui = Instance.new("ScreenGui", PlayerGui)

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UserInputService.TouchEnabled and UDim2.new(0,180,0,240) or UDim2.new(0,260,0,360)
    Main.Position = UDim2.new(0,10,0,10)
    Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Main.BackgroundTransparency = 0.45
    Main.BorderColor3 = Color3.fromRGB(90,90,90)
    Main.BorderSizePixel = 2

    -- Drag
    local dragging, dragStart, startPos
    Main.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = i.Position
            startPos = Main.Position
            i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(i)
        if dragging then
            local d = i.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + d.X,
                startPos.Y.Scale, startPos.Y.Offset + d.Y
            )
        end
    end)

    -- Title
    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1,0,0,25)
    Title.Text = "Nethers AP Spammer"
    Title.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 14

    -- Player list
    local List = Instance.new("ScrollingFrame", Main)
    List.Position = UDim2.new(0,5,0,30)
    List.Size = UDim2.new(1,-10,1,-40)
    List.CanvasSize = UDim2.new(0,0,0,0)
    List.BackgroundTransparency = 1
    List.ScrollBarImageTransparency = 0.2

    -- Execute commands (chat invisible)
    local function exec(playerName)
        local ch = TextChatService.TextChannels.RBXGeneral
        local cmds = {
            ";rocket "..playerName,
            ";balloon "..playerName,
            ";tiny "..playerName,
            ";inverse "..playerName,
            ";jumpscare "..playerName
        }
        for _,c in ipairs(cmds) do
            ch:SendAsync(c)
            task.wait(0.1)
        end
    end

    local y = 0
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local b = Instance.new("TextButton", List)
            b.Size = UDim2.new(1,-10,0,28)
            b.Position = UDim2.new(0,5,0,y)
            b.Text = p.Name
            b.BackgroundColor3 = Color3.fromRGB(70,70,70)
            b.TextColor3 = Color3.new(1,1,1)
            b.Font = Enum.Font.SourceSansBold
            b.TextSize = 12

            b.MouseButton1Click:Connect(function()
                b.Text = "EXEC..."
                b.BackgroundColor3 = Color3.fromRGB(255,170,0)
                exec(p.Name)
                b.Text = p.Name.." ✓"
                b.BackgroundColor3 = Color3.fromRGB(0,150,0)
                task.wait(1)
                b.Text = p.Name
                b.BackgroundColor3 = Color3.fromRGB(70,70,70)
            end)

            y += 32
        end
    end

    List.CanvasSize = UDim2.new(0,0,0,y)
end

-- ===== AUTO LOGIN IF KEY SAVED =====
local savedKey = getSavedKey()
if savedKey and VALID_KEYS[savedKey] then
    loadMainGUI()
    return
end

-- ===== KEY UI =====
local KeyGui = Instance.new("ScreenGui", PlayerGui)

local Frame = Instance.new("Frame", KeyGui)
Frame.Size = UDim2.new(0,300,0,160)
Frame.Position = UDim2.new(0.5,-150,0.5,-80)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.BackgroundTransparency = 0.25
Frame.BorderColor3 = Color3.fromRGB(90,90,90)
Frame.BorderSizePixel = 2

local Label = Instance.new("TextLabel", Frame)
Label.Size = UDim2.new(1,0,0,40)
Label.Text = "Enter Key"
Label.TextColor3 = Color3.new(1,1,1)
Label.BackgroundTransparency = 1
Label.Font = Enum.Font.SourceSansBold
Label.TextSize = 20

local Box = Instance.new("TextBox", Frame)
Box.Size = UDim2.new(1,-20,0,35)
Box.Position = UDim2.new(0,10,0,55)
Box.PlaceholderText = "Key here"
Box.BackgroundColor3 = Color3.fromRGB(50,50,50)
Box.TextColor3 = Color3.new(1,1,1)
Box.ClearTextOnFocus = true

local Btn = Instance.new("TextButton", Frame)
Btn.Size = UDim2.new(0,120,0,35)
Btn.Position = UDim2.new(0.5,-60,1,-45)
Btn.Text = "Submit"
Btn.BackgroundColor3 = Color3.fromRGB(0,150,0)
Btn.TextColor3 = Color3.new(1,1,1)
Btn.Font = Enum.Font.SourceSansBold

Btn.MouseButton1Click:Connect(function()
    if VALID_KEYS[Box.Text] then
        saveKey(Box.Text)
        KeyGui:Destroy()
        loadMainGUI()
    else
        Label.Text = "Invalid key\ncheck https://discord.gg/TtxaUwyp"
        Label.TextColor3 = Color3.fromRGB(255,80,80)
    end
end)

print("Nethers AP Spammer FINAL chargé ✅")
