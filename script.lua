-- xuvuguMM2 :: FULL MENU (DIRECT EXECUTE)
local L,P,RS,UIS,Cam,Plr=game:GetService("Lighting"),game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),workspace.CurrentCamera,Players.LocalPlayer
local Mouse=Plr:GetMouse()
local GUI=Instance.new("ScreenGui")
GUI.Name="xuvuguMM2"
GUI.ResetOnSpawn=false
GUI.Parent=Plr.PlayerGui
local M=Instance.new("Frame")
M.Size=UDim2.new(0,320,0,480)
M.Position=UDim2.new(0.5,-160,0.5,-240)
M.BackgroundColor3=Color3.fromRGB(25,25,30)
M.BorderSizePixel=0
M.Active=true
M.Draggable=true
M.Parent=GUI
local T=Instance.new("TextLabel")
T.Size=UDim2.new(1,0,0,36)
T.BackgroundColor3=Color3.fromRGB(40,40,45)
T.Text="xuvuguMM2"
T.TextColor3=Color3.new(1,1,1)
T.TextScaled=true
T.Font=Enum.Font.SourceSansBold
T.Parent=M
local S=Instance.new("ScrollingFrame")
S.Size=UDim2.new(1,0,1,-36)
S.Position=UDim2.new(0,0,0,36)
S.BackgroundTransparency=1
S.CanvasSize=UDim2.new(0,0,0,600)
S.ScrollBarThickness=4
S.Parent=M
local LAY=Instance.new("UIListLayout")
LAY.Padding=UDim.new(0,4)
LAY.SortOrder=Enum.SortOrder.LayoutOrder
LAY.Parent=S
local function sec(t)local a=Instance.new("TextLabel")a.Size=UDim2.new(1,-8,0,20)a.BackgroundTransparency=1 a.Text="  "..t a.TextColor3=Color3.fromRGB(180,180,180)a.TextXAlignment=Enum.TextXAlignment.Left a.Font=Enum.Font.SourceSansBold a.TextScaled=true a.Parent=S end
local function tog(l,d)local f=Instance.new("Frame")f.Size=UDim2.new(1,-8,0,28)f.BackgroundColor3=Color3.fromRGB(40,40,45)f.BorderSizePixel=0 f.Parent=S local lb=Instance.new("TextLabel")lb.Size=UDim2.new(0.7,0,1,0)lb.BackgroundTransparency=1 lb.Text=l lb.TextColor3=Color3.fromRGB(210,210,210)lb.TextXAlignment=Enum.TextXAlignment.Left lb.Font=Enum.Font.SourceSans lb.TextScaled=true lb.Parent=f local ch=Instance.new("TextButton")ch.Size=UDim2.new(0,26,0,22)ch.Position=UDim2.new(0.92,0,0.5,-11)ch.BackgroundColor3=d and Color3.fromRGB(0,200,80)or Color3.fromRGB(70,70,70)ch.BorderSizePixel=0 ch.Text=d and"✔"or""ch.TextColor3=Color3.new(1,1,1)ch.Font=Enum.Font.SourceSansBold ch.TextScaled=true ch.Parent=f local v=d ch.MouseButton1Click:Connect(function()v=not v ch.BackgroundColor3=v and Color3.fromRGB(0,200,80)or Color3.fromRGB(70,70,70)ch.Text=v and"✔"or""end)return f,function()return v end end
local function sld(l,min,max,def,suf)local f=Instance.new("Frame")f.Size=UDim2.new(1,-8,0,44)f.BackgroundColor3=Color3.fromRGB(40,40,45)f.BorderSizePixel=0 f.Parent=S local lb=Instance.new("TextLabel")lb.Size=UDim2.new(0.6,0,0.4,0)lb.BackgroundTransparency=1 lb.Text=l lb.TextColor3=Color3.fromRGB(210,210,210)lb.TextXAlignment=Enum.TextXAlignment.Left lb.Font=Enum.Font.SourceSans lb.TextScaled=true lb.Parent=f local vl=Instance.new("TextLabel")vl.Size=UDim2.new(0.35,0,0.4,0)vl.Position=UDim2.new(0.65,0,0,0)vl.BackgroundTransparency=1 vl.Text=tostring(def)..(suf or"")vl.TextColor3=Color3.new(1,1,1)vl.Font=Enum.Font.SourceSansBold vl.TextScaled=true vl.TextXAlignment=Enum.TextXAlignment.Right vl.Parent=f local sl=Instance.new("Frame")sl.Size=UDim2.new(1,0,0.35,0)sl.Position=UDim2.new(0,0,0.6,0)sl.BackgroundColor3=Color3.fromRGB(55,55,65)sl.BorderSizePixel=0 sl.Parent=f local fl=Instance.new("Frame")fl.Size=UDim2.new((def-min)/(max-min),0,1,0)fl.BackgroundColor3=Color3.fromRGB(0,150,255)fl.BorderSizePixel=0 fl.Parent=sl local drag=false local cur=def sl.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true end end)sl.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)sl.InputChanged:Connect(function(i)if drag and i.UserInputType==Enum.UserInputType.MouseMovement then local x=math.clamp((i.Position.X-sl.AbsolutePosition.X)/sl.AbsoluteSize.X,0,1)cur=math.round(min+(max-min)*x)fl.Size=UDim2.new(x,0,1,0)vl.Text=tostring(cur)..(suf or"")end end)return f,function()return cur end end
sec("Movement")
local wsF,getWS=sld("Walkspeed",0,80,16,"")
local fovF,getFOV=sld("FOV",1,120,70,"°")
local tpL=Instance.new("TextLabel")tpL.Size=UDim2.new(1,-8,0,22)tpL.BackgroundColor3=Color3.fromRGB(40,40,45)tpL.Text="  CTRL+Click TP"tpL.TextColor3=Color3.fromRGB(210,210,210)tpL.TextXAlignment=Enum.TextXAlignment.Left tpL.Font=Enum.Font.SourceSans tpL.TextScaled=true tpL.Parent=S
sec("Fly")
local flyT,getFly=tog("Fly",false)
local opFlyT,getOpFly=tog("OP Fly",false)
local flySpdF,getFlySpd=sld("Fly Speed",1,150,50,"")
sec("Combat")
local shootM,getShootM=tog("Shoot Murder",true)
local throwK,getThrowK=tog("Throw Knife",true)
local aimK,getAimK=tog("Knife Aim",true)
local knifeAuraF,getKnifeAura=sld("Knife Aura",1,10,3,"x")
sec("Teleport")
local tpF=Instance.new("Frame")tpF.Size=UDim2.new(1,-8,0,28)tpF.BackgroundColor3=Color3.fromRGB(40,40,45)tpF.BorderSizePixel=0 tpF.Parent=S
local tpI=Instance.new("TextBox")tpI.Size=UDim2.new(0.7,0,1,0)tpI.BackgroundColor3=Color3.fromRGB(55,55,65)tpI.BorderSizePixel=0 tpI.Text="Player..."tpI.TextColor3=Color3.fromRGB(200,200,200)tpI.Font=Enum.Font.SourceSans tpI.TextScaled=true tpI.Parent=tpF
local tpB=Instance.new("TextButton")tpB.Size=UDim2.new(0.25,0,1,0)tpB.Position=UDim2.new(0.75,0,0,0)tpB.BackgroundColor3=Color3.fromRGB(0,150,200)tpB.BorderSizePixel=0 tpB.Text="TP"tpB.TextColor3=Color3.new(1,1,1)tpB.Font=Enum.Font.SourceSansBold tpB.TextScaled=true tpB.Parent=tpF
tpB.MouseButton1Click:Connect(function()local t=Players:FindFirstChild(tpI.Text)if t and t.Character and t.Character:FindFirstChild("Head")then Plr.Character:SetPrimaryPartCFrame(t.Character.Head.CFrame+Vector3.new(0,2,0))end end)
sec("Misc")
local fpsT,getFPS=tog("FPS Boost",false)
local pingB=Instance.new("TextButton")pingB.Size=UDim2.new(1,-8,0,26)pingB.BackgroundColor3=Color3.fromRGB(40,40,45)pingB.BorderSizePixel=0 pingB.Text="Get Ping"pingB.TextColor3=Color3.fromRGB(210,210,210)pingB.Font=Enum.Font.SourceSans pingB.TextScaled=true pingB.Parent=S
pingB.MouseButton1Click:Connect(function()local p=game:GetService("Stats").Network and game:GetService("Stats").Network.Ping or"N/A"Plr:Chat("Ping: "..tostring(p))end)
local rejB=Instance.new("TextButton")rejB.Size=UDim2.new(1,-8,0,26)rejB.BackgroundColor3=Color3.fromRGB(40,40,45)rejB.BorderSizePixel=0 rejB.Text="Rejoin"rejB.TextColor3=Color3.fromRGB(210,210,210)rejB.Font=Enum.Font.SourceSans rejB.TextScaled=true rejB.Parent=S
rejB.MouseButton1Click:Connect(function()game:GetService("TeleportService"):Teleport(game.PlaceId)end)
local antiF,getAnti=tog("AntiFling",false)
local ghostF,getGhost=tog("Client Ghost",false)
RS.RenderStepped:Connect(function()
local ws=getWS()if Plr.Character and Plr.Character:FindFirstChild("Humanoid")then Plr.Character.Humanoid.WalkSpeed=ws end
Cam.FieldOfView=getFOV()
if getFly()or getOpFly()then local spd=getFlySpd()/50 local dir=Vector3.new(0,0,0)if UIS:IsKeyDown(Enum.KeyCode.W)then dir=dir+Cam.CFrame.LookVector*spd end if UIS:IsKeyDown(Enum.KeyCode.S)then dir=dir-Cam.CFrame.LookVector*spd end if UIS:IsKeyDown(Enum.KeyCode.A)then dir=dir-Cam.CFrame.RightVector*spd end if UIS:IsKeyDown(Enum.KeyCode.D)then dir=dir+Cam.CFrame.RightVector*spd end if UIS:IsKeyDown(Enum.KeyCode.Space)then dir=dir+Vector3.new(0,spd,0)end if UIS:IsKeyDown(Enum.KeyCode.LeftShift)then dir=dir-Vector3.new(0,spd,0)end if Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")then Plr.Character.HumanoidRootPart.CFrame=Plr.Character.HumanoidRootPart.CFrame+dir end if Plr.Character and Plr.Character:FindFirstChild("Humanoid")then Plr.Character.Humanoid.PlatformStand=true end else if Plr.Character and Plr.Character:FindFirstChild("Humanoid")then Plr.Character.Humanoid.PlatformStand=false end end
if getFPS()then L.GlobalShadows=false L.Brightness=1.5 settings().Rendering.QualityLevel=1 else L.GlobalShadows=true L.Brightness=1 settings().Rendering.QualityLevel=4 end
if getGhost()and Plr.Character then for _,p in pairs(Plr.Character:GetChildren())do if p:IsA("BasePart")and p.Name~="Head"then p.Transparency=0.9 end end else if Plr.Character then for _,p in pairs(Plr.Character:GetChildren())do if p:IsA("BasePart")and p.Name~="Head"then p.Transparency=0 end end end
if getAnti()and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")then local r=Plr.Character.HumanoidRootPart if r.Velocity.Y<-80 or r.Velocity.Y>80 then r.Velocity=Vector3.new(r.Velocity.X,0,r.Velocity.Z)end end
end)
local function GetRole(p)if p.Character and p.Character:FindFirstChild("Head")then local h=p.Character.Head if h:FindFirstChild("BillboardGui")then local g=h.BillboardGui if g:FindFirstChild("Role")then local t=g.Role.Text if t:lower():find("murderer")then return"Убийца"elseif t:lower():find("sheriff")then return"Шериф"else return"Невинный"end end end end return"Невинный"end
RS.RenderStepped:Connect(function()
if not getShootM()then return end
local target=nil local dist=math.huge
for _,plr in pairs(Players:GetPlayers())do if plr~=Plr and plr.Character and plr.Character:FindFirstChild("Head")then local r=GetRole(plr)if r=="Убийца"then local d=(plr.Character.Head.Position-Cam.CFrame.Position).Magnitude if d<dist then dist=d target=plr end end end end
if target and target.Character and target.Character:FindFirstChild("Head")then Cam.CFrame=CFrame.new(Cam.CFrame.Position,target.Character.Head.Position)if Mouse then Mouse.Button1Down:Fire()task.wait(0.03)Mouse.Button1Up:Fire()end end
end)
RS.RenderStepped:Connect(function()
if not getThrowK()then return end
local target=nil local dist=math.huge
for _,plr in pairs(Players:GetPlayers())do if plr~=Plr and plr.Character and plr.Character:FindFirstChild("Head")then local d=(plr.Character.Head.Position-Cam.CFrame.Position).Magnitude if d<dist then dist=d target=plr end end end
if target and target.Character and target.Character:FindFirstChild("Head")then Cam.CFrame=CFrame.new(Cam.CFrame.Position,target.Character.Head.Position)if Mouse then Mouse.Button2Down:Fire()task.wait(0.03)Mouse.Button2Up:Fire()end end
end)
RS.RenderStepped:Connect(function()
if not getAimK()then return end
local target=nil local dist=math.huge
for _,plr in pairs(Players:GetPlayers())do if plr~=Plr and plr.Character and plr.Character:FindFirstChild("Head")then local d=(plr.Character.Head.Position-Cam.CFrame.Position).Magnitude if d<dist then dist=d target=plr end end end
if target and target.Character and target.Character:FindFirstChild("Head")then Cam.CFrame=CFrame.new(Cam.CFrame.Position,target.Character.Head.Position)end
local aura=getKnifeAura()
for _,v in pairs(workspace:GetChildren())do if v:IsA("Tool")and v.Name:lower():find("knife")then for _,p in pairs(v:GetDescendants())do if p:IsA("BasePart")then p.Size=p.Size*aura end end end end
end)
UIS.InputBegan:Connect(function(i,g)if g then return end if i.UserInputType==Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl)then local pos=Mouse.Hit.Position if Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")then Plr.Character.HumanoidRootPart.CFrame=CFrame.new(pos)end end end)
Plr:Chat("xuvuguMM2 LOADED | DIRECT EXECUTE")
