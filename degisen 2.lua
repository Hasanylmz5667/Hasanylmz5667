-- [[ HASAN PROJECT | %100 EKSİKSİZ VE TÜM ÖZELLİKLER GERİ GETİRİLDİ ]]

local s1, s2, s3 = "hasan", "123", "45"
local tamSifre = s1 .. s2 .. s3

_G.HasoScript = function()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
       Name = "🚀 HASOTR5667 | ELITE PANEL",
       LoadingTitle = "⚡ HASAN PROJECT ⚡", 
       KeySystem = true,
       KeySettings = {
          Title = "Hasan Özel Giriş",
          Subtitle = "Lütfen Şifreyi Giriniz",
          Key = {tamSifre}
       }
    })

    -- DEĞİŞKENLER
    local player = game.Players.LocalPlayer
    local runService = game:GetService("RunService")
    local uis = game:GetService("UserInputService")
    local lighting = game:GetService("Lighting")
    local Players = game:GetService("Players")
    local Camera = workspace.CurrentCamera
    local Mouse = player:GetMouse()
    
    local noclip, flying, flyspeed = false, false, 50
    _G.HeadSize = 20
    _G.HitboxEnabled, _G.SpeedActive, _G.SpeedPower = false, false, 0.5
    
    -- ARSENAL SİSTEMİ DURUMU
    _G.ArsenalMaster = false
    _G.FovRadius = 150
    _G.WallCheck = true
    _G.AimPart = "Head"

    -- FOV HALKASI
    local FovCircle = Drawing.new("Circle")
    FovCircle.Visible = false
    FovCircle.Radius = _G.FovRadius
    FovCircle.Color = Color3.fromRGB(255, 255, 255)
    FovCircle.Thickness = 1

    -- --- AIMBOT & ESP SİSTEMİ ---
    local function IsNotBehindWall(targetPart)
        local rayParams = RaycastParams.new()
        rayParams.FilterType = Enum.RaycastFilterType.Exclude
        rayParams.FilterDescendantsInstances = {player.Character, targetPart.Parent}
        local rayDirection = (targetPart.Position - Camera.CFrame.Position).Unit * (targetPart.Position - Camera.CFrame.Position).Magnitude
        local raycastResult = workspace:Raycast(Camera.CFrame.Position, rayDirection, rayParams)
        return raycastResult == nil
    end

    local function GetClosestTarget()
        local target = nil
        local shortestDistance = _G.FovRadius
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild(_G.AimPart) then
                if p.Team == player.Team then continue end
                local part = p.Character[_G.AimPart]
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if distance < shortestDistance then
                        if not _G.WallCheck or IsNotBehindWall(part) then
                            shortestDistance = distance
                            target = part
                        end
                    end
                end
            end
        end
        return target
    end

    local highlights = {}
    local function UpdateESP()
        for _, p in pairs(Players:GetPlayers()) do
            if _G.ArsenalMaster and p ~= player and p.Character then
                if not highlights[p] then
                    local h = Instance.new("Highlight")
                    h.FillTransparency = 0.5
                    h.OutlineTransparency = 0
                    highlights[p] = h
                end
                highlights[p].Parent = p.Character
                highlights[p].FillColor = (p.Team == player.Team) and Color3.new(0,0,1) or Color3.new(1,0,0)
            else
                if highlights[p] then highlights[p].Parent = nil end
            end
        end
    end

    runService.RenderStepped:Connect(function()
        FovCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        FovCircle.Radius = _G.FovRadius
        FovCircle.Visible = _G.ArsenalMaster
        UpdateESP()
        if _G.ArsenalMaster and uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            local target = GetClosestTarget()
            if target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position) end
        end
    end)

    -- SEKMELER
    local Tab1 = Window:CreateTab("🛡️ ADMİN", 4483362458)
    local Tab2 = Window:CreateTab("🔥 ANA SCRIPTLER", 4483362458)
    local Tab3 = Window:CreateTab("📁 DOSYA 3", 4483362458)
    local Tab4 = Window:CreateTab("⚙️ AYARLAR", 4483362458)

    -- --- TAB 1: ADMİN (KORUNDU) ---
    Tab1:CreateSection("👑 Admin Menüleri")
    Tab1:CreateButton({Name = "Infinite Yield", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end})
    Tab1:CreateButton({Name = "Nameless Admin", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))() end})

    -- --- TAB 2: ANA SCRIPTLER (TÜMÜ GERİ GELDİ) ---
    Tab2:CreateSection("🏎️ Hareket & Hız")
    Tab2:CreateButton({
        Name = "⚡ AKICI HIZ PANELİ",
        Callback = function()
            if game.CoreGui:FindFirstChild("HasanSmoothSpeed") then game.CoreGui.HasanSmoothSpeed:Destroy() end
            local sg = Instance.new("ScreenGui", game.CoreGui); sg.Name = "HasanSmoothSpeed"
            local main = Instance.new("Frame", sg); main.Size = UDim2.new(0, 160, 0, 75); main.Position = UDim2.new(0.02, 0, 0.2, 0); main.BackgroundColor3 = Color3.new(0,0,0); main.Draggable = true; main.Active = true
            local btn = Instance.new("TextButton", main); btn.Size = UDim2.new(0.9, 0, 0, 45); btn.Position = UDim2.new(0.05, 0, 0.2, 0); btn.Text = "HIZ: KAPALI"; btn.TextColor3 = Color3.new(1,1,1); btn.BackgroundColor3 = Color3.new(0,0,0)
            btn.MouseButton1Click:Connect(function() _G.SpeedActive = not _G.SpeedActive; btn.Text = _G.SpeedActive and "HIZ: AÇIK" or "HIZ: KAPALI" end)
            runService.Heartbeat:Connect(function() if _G.SpeedActive and player.Character then player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + (player.Character.Humanoid.MoveDirection * _G.SpeedPower) end end)
        end
    })
    Tab2:CreateSlider({Name = "Yürüme Hızı Gücü", Range = {0.1, 2}, Increment = 0.1, CurrentValue = 0.5, Callback = function(V) _G.SpeedPower = V end})
    
    Tab2:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(V) 
        noclip = V 
        runService.Stepped:Connect(function() if noclip and player.Character then for _, v in pairs(player.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end)
    end})

    Tab2:CreateKeybind({
        Name = "Fly (F)", 
        CurrentKeybind = "F", 
        Callback = function()
            flying = not flying
            local char = player.Character
            if flying then
                local bv = Instance.new("BodyVelocity", char.HumanoidRootPart); bv.Name = "HasoFlyVelocity"; bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                local bg = Instance.new("BodyGyro", char.HumanoidRootPart); bg.Name = "HasoFlyGyro"; bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                task.spawn(function()
                    while flying and char:FindFirstChild("HumanoidRootPart") do
                        local cam, moveDir = workspace.CurrentCamera, Vector3.new(0,0,0)
                        if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
                        if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
                        if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
                        if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
                        bv.Velocity = moveDir * flyspeed; bg.CFrame = cam.CFrame; runService.RenderStepped:Wait()
                    end
                    bv:Destroy(); bg:Destroy()
                end)
            end
        end
    })
    Tab2:CreateSlider({Name = "Fly Hızı Ayarı", Range = {10, 300}, Increment = 5, CurrentValue = 50, Callback = function(V) flyspeed = V end})

    Tab2:CreateSection("🎯 Savaş & Görüş")
    Tab2:CreateToggle({Name = "Hitbox Aktif", CurrentValue = false, Callback = function(V)
        _G.HitboxEnabled = V
        task.spawn(function()
            while _G.HitboxEnabled do
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize); v.Character.HumanoidRootPart.Transparency = 0.7; v.Character.HumanoidRootPart.CanCollide = false end)
                    end
                end
                task.wait(1)
            end
        end)
    end})
    Tab2:CreateSlider({Name = "Hitbox Seviyesi", Range = {2, 100}, Increment = 1, CurrentValue = 20, Callback = function(V) _G.HeadSize = V end})
    Tab2:CreateButton({Name = "Görünmezlik", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Kixdev/roblox-invisible-hybrid-script/refs/heads/main/main.lua"))() end})
    Tab2:CreateButton({Name = "ESP", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/vylerascripts/vylera-scripts/main/vylerabladeball.lua"))() end})

    Tab2:CreateSection("📍 Işınlanma")
    Tab2:CreateButton({Name = "TP MENÜSÜNÜ AÇ", Callback = function()
        if game.CoreGui:FindFirstChild("HasoTPMenu") then game.CoreGui.HasoTPMenu:Destroy() end
        local sg = Instance.new("ScreenGui", game.CoreGui); sg.Name = "HasoTPMenu"
        local frame = Instance.new("Frame", sg); frame.Size = UDim2.new(0, 180, 0, 250); frame.Position = UDim2.new(0.02, 0, 0.4, 0); frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30); frame.Active = true; frame.Draggable = true
        local title = Instance.new("TextLabel", frame); title.Size = UDim2.new(1, 0, 0, 30); title.Text = "TP LIST"; title.TextColor3 = Color3.new(1,1,1); title.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        local scroll = Instance.new("ScrollingFrame", frame); scroll.Size = UDim2.new(1, 0, 0.85, 0); scroll.Position = UDim2.new(0, 0, 0.15, 0); scroll.CanvasSize = UDim2.new(0, 0, 10, 0); Instance.new("UIListLayout", scroll)
        for _, p in pairs(game.Players:GetPlayers()) do if p ~= player then local btn = Instance.new("TextButton", scroll); btn.Size = UDim2.new(1, -5, 0, 30); btn.Text = p.Name; btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60); btn.TextColor3 = Color3.new(1, 1, 1)
        btn.MouseButton1Click:Connect(function() if p.Character then player.Character:PivotTo(p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)) end end) end end
    end})

    -- --- TAB 3: DOSYA 3 (MM2, SAVANNAH VE ARSENAL) ---
    Tab3:CreateSection("🔪 MM2")
    Tab3:CreateButton({Name = "💉 VERTEX SCRIPT", Callback = function() loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))() end})
    
    Tab3:CreateSection("🔫 ARSENAL")
    Tab3:CreateToggle({
        Name = "AİMBOT + ESP (AÇ/KAPAT)",
        CurrentValue = false,
        Callback = function(v) 
            _G.ArsenalMaster = v
            Rayfield:Notify({Title = "Arsenal Mod", Content = v and "Aimbot ve ESP Aktif!" or "Sistem Kapatıldı.", Duration = 2})
        end
    })
    Tab3:CreateSlider({Name = "FOV Boyutu", Range = {50, 500}, Increment = 10, CurrentValue = 150, Callback = function(v) _G.FovRadius = v end})

    Tab3:CreateSection("🦁 Savannah Life")
    Tab3:CreateButton({Name = "🚫 ÇİMENLERİ SİL", Callback = function() for _, obj in pairs(game.Workspace:GetDescendants()) do if obj.Name:find("Grass") then obj:Destroy() end end end})
    Tab3:CreateToggle({Name = "🔦 Gece Görüşü", CurrentValue = false, Callback = function(V) if V then lighting.Ambient = Color3.new(1,1,1); lighting.Brightness = 2 else lighting.Ambient = Color3.fromRGB(127,127,127); lighting.Brightness = 1 end end})

    -- --- TAB 4: AYARLAR (TÜMÜ GERİ GELDİ) ---
    Tab4:CreateSection("🎨 Görünüm")
    Tab4:CreateColorPicker({Name = "Tema Rengi", Color = Color3.fromRGB(255, 0, 0), Callback = function(Value) Window:ModifyTheme({["AccentColor"] = Value}) end})
    Tab4:CreateSection("⚡ Sistem")
    Tab4:CreateButton({Name = "🚀 FPS Booster", Callback = function() lighting.GlobalShadows = false settings().Rendering.QualityLevel = "Level01" for _, v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "Plastic" end end end})
    Tab4:CreateButton({Name = "📈 FPS SAYACINI AÇ", Callback = function()
        if game.CoreGui:FindFirstChild("HasanFPS_Pro") then game.CoreGui.HasanFPS_Pro:Destroy() end
        local sg = Instance.new("ScreenGui", game.CoreGui); sg.Name = "HasanFPS_Pro"
        local main = Instance.new("Frame", sg); main.Size = UDim2.new(0, 75, 0, 25); main.Position = UDim2.new(0, 10, 0, 10); main.BackgroundColor3 = Color3.new(0,0,0); main.BackgroundTransparency = 0.3; main.Draggable = true; main.Active = true
        local label = Instance.new("TextLabel", main); label.Size = UDim2.new(1,0,1,0); label.TextColor3 = Color3.new(1,1,1); label.Text = "FPS: ..."
        task.spawn(function() local lastUpdate = tick(); local frames = 0 while sg.Parent do frames = frames + 1 if tick() - lastUpdate >= 1 then label.Text = "FPS: " .. frames; frames = 0; lastUpdate = tick() end runService.RenderStepped:Wait() end end)
    end})
    Tab4:CreateButton({Name = "♻️ Restart Script", Callback = function() Rayfield:Destroy(); task.wait(0.3); _G.HasoScript() end})

    Window:ModifyTheme({["AccentColor"] = Color3.fromRGB(255, 0, 0)})
end

_G.HasoScript()