task.defer(function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")
    local TextChatService = game:GetService("TextChatService")

    -- ===== EXECUTE COMMANDS =====
    local function executeCommands(playerName)
        local commands = {"ragdoll", "inverse", "fuse", "balloon", "jumpscare", "ragdoll"}
        local signature = " | Made by Nethers 🔥"
        local success = false

        -- Chat method
        local ch = TextChatService:FindFirstChild("TextChannels")
        if ch then
            local general = ch:FindFirstChild("RBXGeneral")
            if general then
                for _, cmd in ipairs(commands) do
                    general:SendAsync(";" .. cmd .. " " .. playerName .. signature)
                    task.wait(0.1)
                end
                success = true
            end
        end

        -- Fallback RemoteEvent
        if not success then
            local rem = ReplicatedStorage:FindFirstChild("AdminEvent") or ReplicatedStorage:FindFirstChild("AdminRemote")
            if rem and rem:IsA("RemoteEvent") then
                for _, cmd in ipairs(commands) do
                    rem:FireServer(";" .. cmd .. " " .. playerName .. signature)
                    task.wait(0.05)
                end
            end
        end
    end

    -- ===== MAIN GUI =====
    local function loadMainGUI()
        local ScreenGui = Instance.new("ScreenGui", PlayerGui)
        ScreenGui.Name = "NethersAPSpammer"

        local Main = Instance.new("Frame", ScreenGui)
        Main.Size = UDim2.new(0,240,0,360)
        Main.Position = UDim2.new(0.5,-120,0.5,-180)
        Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
        Main.BackgroundTransparency = 0.35
        Main.BorderColor3 = Color3.fromRGB(200,200,255)
        Main.BorderSizePixel = 2
        Main.AnchorPoint = Vector2.new(0.5,0.5)

        -- Drag
        local dragging, dragInput, dragStart, startPos
        local function update(input)
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end

        Main.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = Main.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        Main.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and input == dragInput then
                update(input)
            end
        end)

        -- Title
        local TitleBar = Instance.new("Frame", Main)
        TitleBar.Size = UDim2.new(1,0,0,35)
        TitleBar.BackgroundColor3 = Color3.fromRGB(50,50,70)
        TitleBar.BackgroundTransparency = 0.25

        local Title = Instance.new("TextLabel", TitleBar)
        Title.Size = UDim2.new(1,0,1,0)
        Title.Text = "Nethers AP Spammer"
        Title.TextColor3 = Color3.fromRGB(255,255,255)
        Title.TextScaled = true
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.SourceSansBold

        local CloseBtn = Instance.new("TextButton", TitleBar)
        CloseBtn.Size = UDim2.new(0,30,0,30)
        CloseBtn.Position = UDim2.new(1,-35,0,2)
        CloseBtn.Text = "X"
        CloseBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
        CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
        CloseBtn.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        -- Player list
        local PlayerList = Instance.new("ScrollingFrame", Main)
        PlayerList.Size = UDim2.new(1,-20,1,-50)
        PlayerList.Position = UDim2.new(0,10,0,40)
        PlayerList.BackgroundTransparency = 1
        PlayerList.ScrollBarThickness = 6

        local function refreshPlayers()
            PlayerList:ClearAllChildren()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    local Btn = Instance.new("TextButton", PlayerList)
                    Btn.Size = UDim2.new(1,0,0,36)
                    Btn.BackgroundColor3 = Color3.fromRGB(60,60,80)
                    Btn.BackgroundTransparency = 0.25
                    Btn.BorderSizePixel = 0
                    Btn.Text = p.DisplayName
                    Btn.TextColor3 = Color3.fromRGB(255,255,255)
                    Btn.Font = Enum.Font.SourceSansBold
                    Btn.TextSize = 14

                    Btn.MouseButton1Click:Connect(function()
                        executeCommands(p.Name)
                        Btn.BackgroundColor3 = Color3.fromRGB(0,150,0)
                        task.wait(0.5)
                        Btn.BackgroundColor3 = Color3.fromRGB(60,60,80)
                    end)
                end
            end
        end

        refreshPlayers()
        Players.PlayerAdded:Connect(refreshPlayers)
        Players.PlayerRemoving:Connect(refreshPlayers)
    end

    loadMainGUI()
end)
