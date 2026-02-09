--// NETHERS KEY SYSTEM - JAPAN THEME
--// Accès une seule fois

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ================== CONFIG ==================

local KEY_FILE = "nethers_key.json"

local VALID_KEYS = {
    ["xiEdyQk9wS"] = true,
    ["EqKM25dMSvHuiFnp"] = true,
    ["f+-8akSG1aDB2nQj"] = true,
    ["CSS-,YMo`w3dsOB"] = true,
    ["1E52C"] = true,
    ["F9714169A7C5E"] = true,
    ["Nethers 2026"] = true,
}

-- ================== SAVE SYSTEM ==================

local function hasKey()
    if not isfile or not readfile then return false end
    if not isfile(KEY_FILE) then return false end
    local data = HttpService:JSONDecode(readfile(KEY_FILE))
    return data and data.valid == true
end

local function saveKey()
    if writefile then
        writefile(KEY_FILE, HttpService:JSONEncode({
            valid = true,
            time = os.time()
        }))
    end
end

-- ================== GUI ==================

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "NethersKeySystem"
ScreenGui.IgnoreGuiInset = true

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 420, 0, 260)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
Main.BackgroundTransparency = 0.1
Main.BorderSizePixel = 0
Main.Visible = not hasKey()

local Corner = Instance.new("UICorner", Main)
Corner.CornerRadius = UDim.new(0, 18)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255, 150, 200)
Stroke.Thickness = 1.5
Stroke.Transparency = 0.2

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "🌸 Nethers Access 🌸"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextColor3 = Color3.fromRGB(255, 200, 220)

-- Subtitle
local Sub = Instance.new("TextLabel", Main)
Sub.Position = UDim2.new(0, 0, 0, 45)
Sub.Size = UDim2.new(1, 0, 0, 30)
Sub.BackgroundTransparency = 1
Sub.Text = "Enter your key to continue"
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 14
Sub.TextColor3 = Color3.fromRGB(180, 170, 200)

-- Input
local Box = Instance.new("TextBox", Main)
Box.Position = UDim2.new(0.1, 0, 0.45, 0)
Box.Size = UDim2.new(0.8, 0, 0, 42)
Box.PlaceholderText = "🔑 Key here..."
Box.Text = ""
Box.Font = Enum.Font.Gotham
Box.TextSize = 16
Box.TextColor3 = Color3.fromRGB(255,255,255)
Box.BackgroundColor3 = Color3.fromRGB(35, 30, 55)
Box.BorderSizePixel = 0

Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 12)

-- Button
local Button = Instance.new("TextButton", Main)
Button.Position = UDim2.new(0.25, 0, 0.7, 0)
Button.Size = UDim2.new(0.5, 0, 0, 42)
Button.Text = "Unlock"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.TextColor3 = Color3.fromRGB(30, 20, 35)
Button.BackgroundColor3 = Color3.fromRGB(255, 160, 200)
Button.BorderSizePixel = 0

Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 14)

-- Status
local Status = Instance.new("TextLabel", Main)
Status.Position = UDim2.new(0, 0, 0.87, 0)
Status.Size = UDim2.new(1, 0, 0, 25)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.Font = Enum.Font.Gotham
Status.TextSize = 13
Status.TextColor3 = Color3.fromRGB(255, 120, 120)

-- ================== LOGIC ==================

local function unlock()
    local key = Box.Text
    if VALID_KEYS[key] then
        saveKey()
        Status.TextColor3 = Color3.fromRGB(150, 255, 180)
        Status.Text = "✔ Access granted"

        TweenService:Create(Main, TweenInfo.new(0.5), {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 460, 0, 280)
        }):Play()

        task.wait(0.6)
        ScreenGui:Destroy()

        -- >>> ICI TU LANCES TON SCRIPT PRINCIPAL <<<
        -- loadMainGUI()
    else
        Status.TextColor3 = Color3.fromRGB(255, 120, 120)
        Status.Text = "✖ Invalid key"
    end
end

Button.MouseButton1Click:Connect(unlock)
Box.FocusLost:Connect(function(enter)
    if enter then unlock() end
end)

-- Animation d'entrée
Main.Size = UDim2.new(0, 380, 0, 220)
TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {
    Size = UDim2.new(0, 420, 0, 260)
}):Play()
