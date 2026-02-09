local A=game:GetService("Players")local B=game:GetService("TextChatService")local C=game:GetService("TweenService")local D=game:GetService("HttpService")local E=A.LocalPlayer local F=E:WaitForChild("PlayerGui")
local G="nethers_key.json"_G.K=_G.K or false
local H={NETHERS123=true,MANGO123=true,SRF234=true,DKFC12D=true,DSGLHVV=true,FK230DL=true,HKNOFP=true,NVBHJK8790=true}
local function I(a)return tostring(a):upper():gsub("%s+","")end
local function J()if not isfile or not readfile then return false end if not isfile(G)then return false end local s,d=pcall(function()return D:JSONDecode(readfile(G))end)return s and d and d.valid and d.user==E.UserId end
local function K()if writefile then pcall(function()writefile(G,D:JSONEncode({valid=true,user=E.UserId,time=os.time()}))end)end end
local function L(f)task.spawn(function()while f.Parent do local p=Instance.new("Frame",f)p.Size=UDim2.new(0,math.random(6,10),0,math.random(6,10))p.Position=UDim2.new(math.random(),0,-.1,0)p.BackgroundColor3=Color3.fromRGB(180,150,255)p.BackgroundTransparency=.2 p.BorderSizePixel=0 p.Rotation=math.random(0,360)Instance.new("UICorner",p).CornerRadius=UDim.new(1,0)
local t=math.random(6,9)C:Create(p,TweenInfo.new(t,Enum.EasingStyle.Linear),{Position=UDim2.new(p.Position.X.Scale,0,1.2,0),Rotation=p.Rotation+math.random(180,360),BackgroundTransparency=1}):Play()
task.delay(t,function()if p then p:Destroy()end end)task.wait(.35)end end)end
local function M(n)local c={"balloon","inverse","rocket","jumpscare"}local s=" | Made By Nethers 🌸"local ch=B:FindFirstChild("TextChannels")if not ch then return end
for _,x in ipairs(ch:GetChildren())do for _,y in ipairs(c)do pcall(function()x:SendAsync(";"..y.." "..n..s)end)task.wait(.03)end end end
local function N()
local g=Instance.new("ScreenGui",F)local m=Instance.new("Frame",g)m.Size=UDim2.new(0,300,0,460)m.Position=UDim2.new(.5,0,.5,0)m.AnchorPoint=Vector2.new(.5,.5)m.BackgroundColor3=Color3.fromRGB(15,15,25)m.BorderSizePixel=0 Instance.new("UICorner",m).CornerRadius=UDim.new(0,20)L(m)
local t=Instance.new("TextLabel",m)t.Size=UDim2.new(1,0,0,60)t.Text="🌸 Nethers AP Spammer 🌸"t.Font=Enum.Font.GothamBold t.TextSize=20 t.TextColor3=Color3.fromRGB(180,180,255)t.BackgroundTransparency=1
local d,s,p=false,nil,nil
m.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then d=true s=i.Position p=m.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then d=false end end)end end)
m.InputChanged:Connect(function(i)if d and i.UserInputType==Enum.UserInputType.MouseMovement then local z=i.Position-s m.Position=UDim2.new(p.X.Scale,p.X.Offset+z.X,p.Y.Scale,p.Y.Offset+z.Y)end end)
local l=Instance.new("ScrollingFrame",m)l.Position=UDim2.new(0,15,0,80)l.Size=UDim2.new(1,-30,1,-95)l.BackgroundTransparency=1 l.ScrollBarThickness=4
local function R()l:ClearAllChildren()local y=0
for _,u in ipairs(A:GetPlayers())do if u~=E then local b=Instance.new("TextButton",l)b.Size=UDim2.new(1,0,0,44)b.Position=UDim2.new(0,0,0,y)b.Text="🌸 "..u.DisplayName
b.Font=Enum.Font.GothamMedium b.TextSize=14 b.TextColor3=Color3.fromRGB(200,200,255)b.BackgroundColor3=Color3.fromRGB(30,25,45)b.BorderSizePixel=0 Instance.new("UICorner",b).CornerRadius=UDim.new(0,14)
b.MouseButton1Click:Connect(function()M(u.Name)end)y=y+50 end end l.CanvasSize=UDim2.new(0,0,0,y)end
R()A.PlayerAdded:Connect(R)A.PlayerRemoving:Connect(R)end
if _G.K or J()then _G.K=true N()return end
local g=Instance.new("ScreenGui",F)local f=Instance.new("Frame",g)f.Size=UDim2.new(0,360,0,220)f.Position=UDim2.new(.5,0,.5,0)f.AnchorPoint=Vector2.new(.5,.5)
f.BackgroundColor3=Color3.fromRGB(18,15,28)Instance.new("UICorner",f).CornerRadius=UDim.new(0,18)L(f)
local t=Instance.new("TextLabel",f)t.Size=UDim2.new(1,0,0,50)t.Text="🌸 Nethers Access 🌸"t.Font=Enum.Font.GothamBold t.TextSize=22 t.TextColor3=Color3.fromRGB(180,180,255)t.BackgroundTransparency=1
local b=Instance.new("TextBox",f)b.Position=UDim2.new(.1,0,.4,0)b.Size=UDim2.new(.8,0,0,42)b.PlaceholderText="🔑 ENTER KEY"
b.Font=Enum.Font.Gotham b.TextSize=15 b.TextColor3=Color3.new(1,1,1)b.BackgroundColor3=Color3.fromRGB(25,20,40)b.BorderSizePixel=0 Instance.new("UICorner",b).CornerRadius=UDim.new(0,12)
local o=Instance.new("TextButton",f)o.Position=UDim2.new(.25,0,.7,0)o.Size=UDim2.new(.5,0,0,40)o.Text="UNLOCK"
o.Font=Enum.Font.GothamBold o.TextSize=15 o.BackgroundColor3=Color3.fromRGB(100,80,160)o.TextColor3=Color3.fromRGB(220,220,255)o.BorderSizePixel=0 Instance.new("UICorner",o).CornerRadius=UDim.new(0,14)
o.MouseButton1Click:Connect(function()local k=I(b.Text)if H[k]then _G.K=true K()g:Destroy()N()else b.Text=""b.PlaceholderText="❌ INVALID KEY"end end)
