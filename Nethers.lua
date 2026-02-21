local A=game:GetService("Players")
local B=game:GetService("TextChatService")
local D=game:GetService("HttpService")
local UIS=game:GetService("UserInputService")

local E=A.LocalPlayer
local F=E:WaitForChild("PlayerGui")

local G="nethers_key.json"
_G.K=_G.K or false

local H={
NETHERS123=true,
MANGO123=true,
SRF234=true,
DKFC12D=true,
DSGLHVV=true,
FK230DL=true,
HKNOFP=true,
NVBHJK8790=true
}

local function I(a)
    return tostring(a):upper():gsub("%s+","")
end

local function J()
    if not isfile or not readfile then return false end
    if not isfile(G) then return false end
    local s,d=pcall(function()
        return D:JSONDecode(readfile(G))
    end)
    return s and d and d.valid and d.user==E.UserId
end

local function K()
    if writefile then
        pcall(function()
            writefile(G,D:JSONEncode({
                valid=true,
                user=E.UserId,
                time=os.time()
            }))
        end)
    end
end

-- RGB BORDER
local function RGBStroke(obj)
    local stroke=Instance.new("UIStroke",obj)
    stroke.Thickness=2
    stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border

    task.spawn(function()
        local h=0
        while obj.Parent do
            stroke.Color=Color3.fromHSV(h,1,1)
            h=(h+0.01)%1
            task.wait()
        end
    end)
end

-- DRAG SYSTEM
local function MakeDraggable(frame,dragBar)
    local dragging=false
    local dragInput,startPos,startFramePos

    dragBar.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=true
            startPos=input.Position
            startFramePos=frame.Position
            input.Changed:Connect(function()
                if input.UserInputState==Enum.UserInputState.End then
                    dragging=false
                end
            end)
        end
    end)

    dragBar.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement then
            dragInput=input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input==dragInput and dragging then
            local delta=input.Position-startPos
            frame.Position=UDim2.new(
                startFramePos.X.Scale,
                startFramePos.X.Offset+delta.X,
                startFramePos.Y.Scale,
                startFramePos.Y.Offset+delta.Y
            )
        end
    end)
end

-- SPAM (NO DELAY / NO INVERSE)
local function M(n)
    local cmds={"balloon","rocket","jumpscare","morph"}
    local suffix=" | Made By Nethers 🔥"

    local ch=B:FindFirstChild("TextChannels")
    if not ch then return end

    for _,x in ipairs(ch:GetChildren()) do
        for _,y in ipairs(cmds) do
            pcall(function()
                x:SendAsync(";"..y.." "..n..suffix)
            end)
        end
    end
end

-- PLAYER BUTTON
local function PlayerButton(parent,player,y)

    local frame=Instance.new("Frame",parent)
    frame.Size=UDim2.new(1,0,0,50)
    frame.Position=UDim2.new(0,0,0,y)
    frame.BackgroundColor3=Color3.fromRGB(15,15,20)
    frame.BorderSizePixel=0
    Instance.new("UICorner",frame).CornerRadius=UDim.new(0,10)

    local img=Instance.new("ImageLabel",frame)
    img.Size=UDim2.new(0,36,0,36)
    img.Position=UDim2.new(0,8,0.5,-18)
    img.BackgroundTransparency=1

    local thumb=A:GetUserThumbnailAsync(
        player.UserId,
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size420x420
    )
    img.Image=thumb

    local txt=Instance.new("TextButton",frame)
    txt.Size=UDim2.new(1,-60,1,0)
    txt.Position=UDim2.new(0,50,0,0)
    txt.BackgroundTransparency=1
    txt.Text=player.DisplayName
    txt.Font=Enum.Font.GothamMedium
    txt.TextSize=15
    txt.TextColor3=Color3.new(1,1,1)
    txt.TextXAlignment=Enum.TextXAlignment.Left

    txt.MouseButton1Click:Connect(function()
        M(player.Name)
    end)
end

-- MAIN MENU
local function N()

    local g=Instance.new("ScreenGui",F)

    local m=Instance.new("Frame",g)
    m.Size=UDim2.new(0,320,0,480)
    m.Position=UDim2.new(.5,0,.5,0)
    m.AnchorPoint=Vector2.new(.5,.5)
    m.BackgroundColor3=Color3.fromRGB(10,10,10)
    m.BorderSizePixel=0
    Instance.new("UICorner",m).CornerRadius=UDim.new(0,14)
    RGBStroke(m)

    local top=Instance.new("Frame",m)
    top.Size=UDim2.new(1,0,0,40)
    top.BackgroundTransparency=1

    local title=Instance.new("TextLabel",top)
    title.Size=UDim2.new(1,-40,1,0)
    title.Position=UDim2.new(0,10,0,0)
    title.Text="Nethers AP Spammer"
    title.Font=Enum.Font.GothamBold
    title.TextSize=16
    title.TextColor3=Color3.new(1,1,1)
    title.BackgroundTransparency=1
    title.TextXAlignment=Enum.TextXAlignment.Left

    local min=Instance.new("TextButton",top)
    min.Size=UDim2.new(0,30,0,30)
    min.Position=UDim2.new(1,-35,0,5)
    min.Text="—"
    min.Font=Enum.Font.GothamBold
    min.TextSize=18
    min.TextColor3=Color3.new(1,1,1)
    min.BackgroundColor3=Color3.fromRGB(20,20,20)
    min.BorderSizePixel=0
    Instance.new("UICorner",min).CornerRadius=UDim.new(0,6)

    local list=Instance.new("ScrollingFrame",m)
    list.Position=UDim2.new(0,10,0,50)
    list.Size=UDim2.new(1,-20,1,-60)
    list.BackgroundTransparency=1
    list.ScrollBarThickness=4

    local minimized=false

    min.MouseButton1Click:Connect(function()
        minimized=not minimized
        list.Visible=not minimized
        m.Size=minimized and UDim2.new(0,320,0,40) or UDim2.new(0,320,0,480)
    end)

    MakeDraggable(m,top)

    local function Refresh()
        list:ClearAllChildren()
        local y=0

        for _,u in ipairs(A:GetPlayers()) do
            if u~=E then
                PlayerButton(list,u,y)
                y=y+60
            end
        end

        list.CanvasSize=UDim2.new(0,0,0,y)
    end

    Refresh()
    A.PlayerAdded:Connect(Refresh)
    A.PlayerRemoving:Connect(Refresh)

end

-- AUTO LOGIN
if _G.K or J() then
    _G.K=true
    N()
    return
end

-- KEY UI
local g=Instance.new("ScreenGui",F)

local f=Instance.new("Frame",g)
f.Size=UDim2.new(0,360,0,220)
f.Position=UDim2.new(.5,0,.5,0)
f.AnchorPoint=Vector2.new(.5,.5)
f.BackgroundColor3=Color3.fromRGB(10,10,10)
f.BorderSizePixel=0
Instance.new("UICorner",f).CornerRadius=UDim.new(0,14)
RGBStroke(f)

local title=Instance.new("TextLabel",f)
title.Size=UDim2.new(1,0,0,50)
title.Text="Nethers Access"
title.Font=Enum.Font.GothamBold
title.TextSize=20
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1

local box=Instance.new("TextBox",f)
box.Position=UDim2.new(.1,0,.4,0)
box.Size=UDim2.new(.8,0,0,40)
box.PlaceholderText="ENTER KEY"
box.Font=Enum.Font.Gotham
box.TextSize=15
box.TextColor3=Color3.new(1,1,1)
box.BackgroundColor3=Color3.fromRGB(20,20,20)
box.BorderSizePixel=0
Instance.new("UICorner",box).CornerRadius=UDim.new(0,10)

local btn=Instance.new("TextButton",f)
btn.Position=UDim2.new(.25,0,.7,0)
btn.Size=UDim2.new(.5,0,0,40)
btn.Text="UNLOCK"
btn.Font=Enum.Font.GothamBold
btn.TextSize=15
btn.TextColor3=Color3.new(1,1,1)
btn.BackgroundColor3=Color3.fromRGB(20,20,20)
btn.BorderSizePixel=0
Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)

btn.MouseButton1Click:Connect(function()
    local k=I(box.Text)
    if H[k] then
        _G.K=true
        K()
        g:Destroy()
        N()
    else
        box.Text=""
        box.PlaceholderText="INVALID KEY"
    end
end)
