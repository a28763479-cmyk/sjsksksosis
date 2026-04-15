local plrs = game:GetService("Players")
local run = game:GetService("RunService")
local camera = workspace.CurrentCamera
local lp = plrs.LocalPlayer
local rp = game:GetService("ReplicatedStorage") -- this is a project that i have worked for a while

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local window = Library:CreateWindow({
  Title = "transsense",
  Footer = "version: v1.0"
})

local Watermark = Library:AddDraggableLabel("transsense | Criminality")
local WatermarkIsVisible = true

local tabs = {
  rage = window:AddTab("Rage", "angry"),
  aimbot = window:AddTab("Legitbot", "crosshair"),
  anti = window:AddTab("Anti-aim", "crosshair"),
  visuals = window:AddTab("Visuals", "eye"),
  misc = window:AddTab("Misc", "wrench"),
  config = window:AddTab("Settings", "settings")
}

local tab1 = tabs.aimbot:AddLeftTabbox()
local aimsec = tab1:AddTab("Aimbot")
local tab3 = tabs.rage:AddRightTabbox()
local silent = tab3:AddTab("Silent aim")
local tab4 = tabs.rage:AddLeftTabbox()
local ragebot = tab4:AddTab("Ragebot")
local tab5 = tabs.aimbot:AddRightTabbox()
local trigger = tab5:AddTab("Triggerbot")
local tab6 = tabs.aimbot:AddRightTabbox()
local recoil = tab5:AddTab("Other")
local tab7 = tabs.visuals:AddLeftTabbox()
local enemys = tab7:AddTab("Enemy")
local localplayer = tab7:AddTab("Player")

local esp = loadstring(game:HttpGet("https://pastebin.com/raw/ZqUaqzgU"))()
local arrow = loadstring(game:HttpGet("https://pastebin.com/raw/kpejN66K"))()

local aimbots = {
  enabled = false,
  smooth = true,
  smoothamount = 1,
  hitbox = {"Head"},
  wallcheck = false,
  teamcheck = false,
  downedcheck = true,
  fovcircle = false,
  fovsize = 300,
  fovoutline = true,
  fovoutlinetype = {"Outline"},
  fovcolor = Color3.new(1, 1, 1),
  fovfill = false,
  fovfilltrans = 0.8
}

local settings = {
  enabled = false,
  wallcheck = false,
  teamcheck = false,
  holdclick = false,
  downedcheck = false,
  hitbox = {"Head"}
}

local rcs = {
  recoilc = false,
  cre = false,
  recoil = 0,
  recoilxmin = 0,
  recoilxmax = 0,
  recoilymin = 0,
  recoilymax = 0,
  recoilzmin = 0,
  recoilzmax = 0
}

local function downedcheck(p)
  if not p or not p.Character then return false end
  local hum = p.Character:FindFirstChild("Humanoid")
  if hum and hum.Health <= 15 then return true end
  local cs = p.Character:FindFirstChild("Charstats")
  if cs then
    local downed = cs:FindFirstChild("Downed")
    if downed and typeof(downed.Value) == "boolean" then
      return downed.Value
    end
  end
  return false
end

local fov = Drawing.new("Circle")
fov.NumSides = 128
fov.Visible = false
fov.Filled = false
fov.Thickness = 2

local fovo1 = Drawing.new("Circle")
fovo1.NumSides = 128
fovo1.Visible = false
fovo1.Filled = false
fovo1.Thickness = 3

local fovo2 = Drawing.new("Circle")
fovo2.NumSides = 128
fovo2.Visible = false
fovo2.Filled = false
fovo2.Thickness = 3

local fovfill = Drawing.new("Circle")
fovfill.NumSides = 128
fovfill.Visible = false
fovfill.Filled = true
fovfill.Thickness = 2

fov.ZIndex = 3
fovo1.ZIndex = 2
fovo2.ZIndex = 1
fovfill.ZIndex = 0

run.RenderStepped:Connect(function()
  local pos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
  fov.Position = pos
  fov.Visible = aimbots.fovcircle
  fov.Radius = aimbots.fovsize
  fov.Color = aimbots.fovcolor
  
  fovo1.Position = pos
  fovo1.Visible = aimbots.fovcircle and aimbots.fovoutline and (aimbots.fovoutlinetype[1] == "Inline" or aimbots.fovoutlinetype[1] == "Outline and inline")
  fovo1.Radius = aimbots.fovsize
  fovo1.Color = Color3.new(0, 0, 0)
  
  fovo2.Position = pos
  fovo2.Visible = aimbots.fovcircle and aimbots.fovoutline and (aimbots.fovoutlinetype[1] == "Outline" or aimbots.fovoutlinetype[1] == "Outline and inline")
  fovo2.Radius = aimbots.fovsize + 1
  fovo2.Color = Color3.new(0, 0, 0)
  
  fovfill.Position = pos
  fovfill.Visible = aimbots.fovfill
  fovfill.Radius = aimbots.fovsize
  fovfill.Transparency = aimbots.fovfilltrans
  fovfill.Color = aimbots.fovcolor
end)

local function aimbotfunc()
  while true do
    if aimbots.enabled then
      local character = lp.Character
      if character and character:FindFirstChild("Head") then
        local targetpart = nil
        local shortest = aimbots.fovsize
        local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        for _, p in pairs(plrs:GetPlayers()) do
          if aimbots.teamcheck and p.Team == lp.Team then continue end
          if aimbots.downedcheck and downedcheck(p) then continue end
          if p ~= lp and p.Character and p.Character:FindFirstChild("Head") then
            local pos, onscreen = camera:WorldToViewportPoint(p.Character.Head.Position)
            if onscreen then
              local mousedistance = (Vector2.new(pos.X, pos.Y) - center).Magnitude
              if mousedistance <= aimbots.fovsize then
                local cansee = true
                if aimbots.wallcheck then
                  local rayParams = RaycastParams.new()
                  rayParams.FilterDescendantsInstances = {character, camera}
                  rayParams.FilterType = Enum.RaycastFilterType.Exclude
                  local rayResult = workspace:Raycast(camera.CFrame.Position, (p.Character.Head.Position - camera.CFrame.Position), rayParams)
                  if rayResult and not rayResult.Instance:IsDescendantOf(p.Character) then cansee = false end
                end
                if cansee and mousedistance < shortest then
                  shortest = mousedistance
                  targetpart = p.Character.Head
                end
              end
            end
          end
        end
        if targetpart then
          local goal = CFrame.new(camera.CFrame.Position, targetpart.Position)
          camera.CFrame = aimbots.smooth and camera.CFrame:Lerp(goal, aimbots.smoothamount/100) or goal
        end
      end
    end
    task.wait()
  end
end
task.spawn(aimbotfunc)

local players = game:GetService('Players')
local runservice = game:GetService('RunService')

local localplayer = players.LocalPlayer
local mouse = localplayer:GetMouse()

local currentlypressed = false

local function wallcheck(target)
	if not settings.wallcheck then return true end
	local character = localplayer.Character
	if not character then return false end
	local head = character:FindFirstChild('Head')
	if not head then return false end

	local origin = head.Position
	local direction = (target.Position - origin)
	local rayparams = RaycastParams.new()
	rayparams.FilterDescendantsInstances = {character, target.Parent}
	rayparams.FilterType = Enum.RaycastFilterType.Exclude

	local result = workspace:Raycast(origin, direction, rayparams)
	return result == nil
end

local function teamcheck(target)
	if not settings.teamcheck then return true end
	local targetplayer = players:GetPlayerFromCharacter(target.Parent)
	if not targetplayer then return true end
	return targetplayer.Team ~= localplayer.Team
end

runservice.RenderStepped:Connect(function()
 if settings.enabled then
  if mouse.Target then
   local humanoid = mouse.Target.Parent:FindFirstChild(settings.hitbox[1])
   local targetplayer = players:GetPlayerFromCharacter(mouse.Target.Parent)
   if humanoid and wallcheck(mouse.Target) and teamcheck(mouse.Target) and (not settings.downedcheck or not downedcheck(targetplayer)) then
    if settings.holdclick then
     if not currentlypressed then
      currentlypressed = true
      mouse1press()
     end
    else
     mouse1click()
    end
   else
    if settings.holdclick then
     currentlypressed = false
     mouse1release()
    end
   end
  end
 end
end)

aimsec:AddToggle("aimbot_enabled", {
 Text = "Enabled",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
   aimbots.enabled = Value
 end,
}):AddKeyPicker("silentkey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Aimbot",
    NoUI = false,
})

aimsec:AddToggle("aimbot_smooth", {
 Text = "Smooth",
 Default = true,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.smooth = Value
 end,
})

aimsec:AddSlider("aimbot_smoothamount", {
 Text = "Smooth amount",
 Default = 1,
 Min = 0,
 Max = 20,
 Rounding = 1,
 Compact = false,
 Callback = function(Value)
  aimbots.smoothamount = Value
 end,
 Disabled = false,
 Visible = true,
})

aimsec:AddDropdown("aimbot_hitbox", {
 Values = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
 Default = nil,
 Multi = false,
 Text = "Hitbox",
 Searchable = false,
 Callback = function(Value)
  aimbots.hitbox = { Value }
 end,
 Disabled = false,
 Visible = true,
})

aimsec:AddToggle("aimbot_wallcheck", {
 Text = "Wall check",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.wallcheck = Value
 end,
})

aimsec:AddToggle("aimbot_teamcheck", {
 Text = "Team check",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.teamcheck = Value
 end,
})

aimsec:AddToggle("aimbot_downedcheck", {
 Text = "Downed check",
 Default = true,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.downedcheck = Value
 end,
})

aimsec:AddToggle("aimbot_fovcircle", {
 Text = "Fov circle",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.fovcircle = Value
 end,
}):AddColorPicker("ColorPicker1", {
  Default = Color3.new(1, 1, 1),
  Title = "Fov circle color",
  Transparency = 0,
  Callback = function(Value)
    aimbots.fovcolor = Value
  end,
})

aimsec:AddSlider("aimbot_fovsize", {
 Text = "Fov circle size",
 Default = 300,
 Min = 1,
 Max = 500,
 Rounding = 1,
 Compact = false,
 Callback = function(Value)
  aimbots.fovsize = Value
 end,
 Disabled = false,
 Visible = true,
})

aimsec:AddToggle("aimbot_fovoutline", {
 Text = "Fov circle outline",
 Default = true,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.fovoutline = Value
 end,
})

aimsec:AddDropdown("aimbot_fovoutlinetype", {
 Values = { "Outline", "Inline", "Outline and inline" },
 Default = 1,
 Multi = false,
 Text = "Fov circle outline type",
 Searchable = false,
 Callback = function(Value)
  aimbots.fovoutlinetype = { Value }
 end,
 Disabled = false,
 Visible = true,
})

aimsec:AddToggle("aimbot_fovfill", {
 Text = "Fov circle fill",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  aimbots.fovfill = Value
 end,
})

aimsec:AddSlider("aimbot_fovsize", {
 Text = "Fov fill transparency",
 Default = 0.8,
 Min = 0,
 Max = 1,
 Rounding = 2,
 Compact = false,
 Callback = function(Value)
  aimbots.fovfilltrans = Value
 end,
 Disabled = false,
 Visible = true,
})

trigger:AddToggle("aimbot_enabled", {
 Text = "Enabled",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
   settings.enabled = Value
 end,
}):AddKeyPicker("silentkey", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Triggerbot",
    NoUI = false,
})

trigger:AddToggle("aimbot_enabled", {
 Text = "Wall check",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
   trigger.wallcheck = Value
 end,
})

trigger:AddToggle("aimbot_enabled", {
 Text = "Team check",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
   trigger.teamcheck = Value
 end,
})

trigger:AddToggle("aimbot_enabled", {
 Text = "Downed check",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
   settings.downedcheck = Value
 end,
})

trigger:AddToggle("aimbot_enabled", {
 Text = "Hold click",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
   settings.holdclick = Value
 end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Enabled",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.Enabled = Value
 end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Bounding box",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.Box.Enabled = Value
 end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Box fill",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.BoxFill.Enabled = Value
 end,
})

enemys:AddDropdown("aimbot_fovoutlinetype", {
 Values = { "Gradient", "Solid" },
 Default = 1,
 Multi = false,
 Text = "Box fill type",
 Searchable = false,
 Callback = function(Value)
  esp.BoxFill.FillType = Value
 end,
 Disabled = false,
 Visible = true,
})

enemys:AddLabel("Solid color"):AddColorPicker("ColorPicker1", {
  Default = Color3.fromRGB(0, 255, 80),
  Title = "Solid color",
  Transparency = 0,
  Callback = function(Value)
    esp.BoxFill.Color = Value
  end,
})

enemys:AddLabel("Gradient color"):AddColorPicker("ColorPicker1", {
  Default = Color3.fromRGB(0, 255, 80),
  Title = "Gradient color",
  Transparency = 0,
  Callback = function(Value)
    esp.BoxFill.Gradient.From = Value
    esp.BoxFill.Gradient.To = Value
  end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Health bar",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.HealthBar.Enabled = Value
 end,
})

enemys:AddDropdown("aimbot_fovoutlinetype", {
 Values = { "Gradient", "Solid" },
 Default = 1,
 Multi = false,
 Text = "Health bar fill type",
 Searchable = false,
 Callback = function(Value)
  esp.HealthBar.FillType = Value
 end,
 Disabled = false,
 Visible = true,
})

enemys:AddLabel("Solid color"):AddColorPicker("ColorPicker1", {
  Default = Color3.fromRGB(0, 255, 80),
  Title = "Solid color",
  Transparency = 0,
  Callback = function(Value)
    esp.HealthBar.Color = Value
  end,
})

local top_color = Color3.fromRGB(0, 255, 80)
local mid_color = Color3.fromRGB(255, 200, 0)
local bottom_color = Color3.fromRGB(255, 30, 30)

local function update_health_gradient()
    if esp and esp.HealthBar and esp.HealthBar.Gradient then
        esp.HealthBar.Gradient.Keys = {
            ColorSequenceKeypoint.new(0, top_color),
            ColorSequenceKeypoint.new(0.5, mid_color),
            ColorSequenceKeypoint.new(1, bottom_color)
        }
    end
end

enemys:AddLabel("Gradient color"):AddColorPicker("colorpicker1", {
  Default = top_color,
  Title = "Top color",
  Transparency = 0,
  Callback = function(value)
    top_color = value
    update_health_gradient()
  end,
}):AddColorPicker("colorpicker2", {
  Default = mid_color,
  Title = "Middle color",
  Transparency = 0,
  Callback = function(value)
    mid_color = value
    update_health_gradient()
  end,
}):AddColorPicker("colorpicker3", {
  Default = bottom_color,
  Title = "Bottom color",
  Transparency = 0,
  Callback = function(value)
    bottom_color = value
    update_health_gradient()
  end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Name",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.Name.Enabled = Value
 end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Weapon",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.ToolESP.Enabled = Value
 end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Health text",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  esp.HealthText.Enabled = Value
 end,
})

enemys:AddToggle("aimbot_fovfill", {
 Text = "Offscreen arrow",
 Default = false,
 Disabled = false,
 Visible = true,
 Risky = false,
 Callback = function(Value)
  arrow.Arrow.Enabled = Value
 end,
})

enemys:AddSlider("aimbot_fovsize", {
 Text = "Arrow Radius",
 Default = 150,
 Min = 1,
 Max = 500,
 Rounding = 1,
 Compact = false,
 Callback = function(Value)
  arrow.Arrow.Radius = Value
 end,
 Disabled = false,
 Visible = true,
})