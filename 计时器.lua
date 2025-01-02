local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- 检查是否已存在名为“TimerGui”的界面，如果存在则销毁它
local existingGui = playerGui:FindFirstChild("TimerGui")
if existingGui then
existingGui:Destroy()
end

-- 创建一个新的屏幕界面（ScreenGui），并设置相关属性
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TimerGui"
screenGui.Parent = playerGui

-- 创建主框架（Frame），设置其大小、位置、背景颜色等属性
local FramMain = Instance.new("Frame")
FramMain.Name = "FrameMain"
FramMain.Size = UDim2.new(0, 500, 0, 250)
FramMain.Position = UDim2.new(0, 50, 0, 50)
FramMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FramMain.Active = true
FramMain.Draggable = true
FramMain.Visible = false
FramMain.Parent = screenGui

-- 创建一个文本标签（TextLabel）用于显示“Settings”字样，设置其相关属性
local settingsLabel = Instance.new("TextLabel")
settingsLabel.Name = "SettingsLabel"
settingsLabel.Size = UDim2.new(1, 0, 0, 50)
settingsLabel.Position = UDim2.new(0, 0, 0, 0)
settingsLabel.Text = "Settings"
settingsLabel.TextScaled = true
settingsLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
settingsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsLabel.Parent = FramMain

-- 创建一个滚动框架（ScrollingFrame），用于添加功能，设置其相关属性
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ScrollingFrame"
scrollingFrame.Size = UDim2.new(1, 0, 0.7, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0.2, 0)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scrollingFrame.BorderSizePixel = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0) -- 调整画布大小以允许滚动
scrollingFrame.ScrollBarThickness = 5
scrollingFrame.Parent = FramMain

-- 创建一个框架（Frame），用于放置所有功能相关元素，设置其属性
local FrameAllFeatures = Instance.new("Frame")
FrameAllFeatures.Name = "FrameAllFeatures"
FrameAllFeatures.Size = UDim2.new(1, 0, 0, 50)
FrameAllFeatures.Position = UDim2.new(0, 0, 0, 100)
FrameAllFeatures.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FrameAllFeatures.Active = true
FrameAllFeatures.Visible = true
FrameAllFeatures.BackgroundTransparency = 1
FrameAllFeatures.Parent = FramMain

-- 创建一个UI列表布局（UIListLayout），设置其排序顺序等属性
local uiLayout = Instance.new("UIListLayout")
-- 列数
uiLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiLayout.Parent = FrameAllFeatures

-- 创建一个文本按钮（TextButton），用于“定时器设置”功能，设置其属性
local ButtonGame = Instance.new("TextButton")
ButtonGame.Name = "TimerSetting"
ButtonGame.Size = UDim2.new(1, 0, 0, 50)
ButtonGame.Position = UDim2.new(0, 0, 0, 0)
ButtonGame.Text = "定时器设置"
ButtonGame.TextScaled = true
ButtonGame.BackgroundColor3 = Color3.fromRGB(233, 233, 233)
ButtonGame.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonGame.Parent = FrameAllFeatures

-- 创建一个文本按钮，用于“自定义定时器”功能，设置属性
local ButtonCustomTimer = Instance.new("TextButton")
ButtonCustomTimer.Name = "CustomTimer"
ButtonCustomTimer.Size = UDim2.new(1, 0, 0, 50)
ButtonCustomTimer.Position = UDim2.new(0, 0, 0, 0)
ButtonCustomTimer.Text = "自定义定时器"
ButtonCustomTimer.TextScaled = true
ButtonCustomTimer.BackgroundColor3 = Color3.fromRGB(233, 233, 233)
ButtonCustomTimer.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonCustomTimer.Parent = FrameAllFeatures

-- 创建一个文本标签，用于显示定时器版本信息，设置属性
local ButtonVersion = Instance.new("TextLabel")
ButtonVersion.Name = "TimerVersion"
ButtonVersion.Size = UDim2.new(1, 0, 0, 50)
ButtonVersion.Position = UDim2.new(0, 0, 0, 0)
ButtonVersion.Text = "定时器版本:1.31"
ButtonVersion.TextScaled = true
ButtonVersion.BackgroundColor3 = Color3.fromRGB(233, 233, 233)
ButtonVersion.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonVersion.Parent = FrameAllFeatures

-- 定义两个变量，用于记录界面是否锁定以及是否可见的状态，初始化为false
local isLocked = false
local isVisible = false

-- 创建一个文本按钮，用于锁定框架功能，设置属性
local lockButton = Instance.new("TextButton")
lockButton.Name = "LockButton"
lockButton.Size = UDim2.new(0, 50, 0, 50)
lockButton.Position = UDim2.new(0, 0, 0.45, 0)
lockButton.Text = "锁定框架"
lockButton.TextScaled = true
lockButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
lockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
lockButton.Parent = screenGui

-- 创建一个文本按钮，用于控制框架的可见性，设置属性
local VisibleFrameButton = Instance.new("TextButton")
VisibleFrameButton.Name = "VisibleFrameButton"
VisibleFrameButton.Size = UDim2.new(0, 50, 0, 50)
VisibleFrameButton.Position = UDim2.new(0, 60, 0.45, 0)
VisibleFrameButton.Text = "关闭框架"
VisibleFrameButton.TextScaled = true
VisibleFrameButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
VisibleFrameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VisibleFrameButton.Parent = screenGui

-- 定义一个函数，用于切换框架的锁定状态
local function toggleLock()
isLocked = not isLocked
if isLocked then
FramMain.Draggable = false
lockButton.Text = "解锁框架"
else
FramMain.Draggable = true
lockButton.Text = "锁定框架"
end
end

-- 定义一个函数，用于切换框架的可见性
local function toggleVisible()
isVisible = not isVisible
if isVisible then
FramMain.Visible = false
VisibleFrameButton.Text = "打开框架"
else
FramMain.Visible = true
VisibleFrameButton.Text = "关闭框架"
end
end

-- 将锁定按钮的鼠标左键点击事件连接到toggleLock函数
lockButton.MouseButton1Click:Connect(toggleLock)
-- 将可见性控制按钮的鼠标左键点击事件连接到toggleVisible函数
VisibleFrameButton.MouseButton1Click:Connect(toggleVisible)

-- 创建一个文本标签，用于显示定时器时间，设置属性
local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "TimerLabel"
timerLabel.Size = UDim2.new(0, 150, 0, 50)
timerLabel.Position = UDim2.new(0, 0, 0.2, -25)
timerLabel.Text = "00:00:00:000"
timerLabel.TextScaled = true
timerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timerLabel.Parent = screenGui

-- 定义一个函数，实现彩虹特效，改变文本标签的颜色
local function rainbowEffect(label)
local hue = 0
local runService = game:GetService("RunService")

runService.Heartbeat:Connect(function()
hue = hue + 1
if hue > 360 then
hue = 0
end
local color = Color3.fromHSV(hue / 360, 1, 1)
label.TextColor3 = color
end)
end

-- 创建一个文本标签，用于显示作者相关信息，设置属性并应用彩虹特效
local ByIlianLabel = Instance.new("TextLabel")
ByIlianLabel.Name = "ByIlian"
ByIlianLabel.Size = UDim2.new(1, 0, 0, 15)
ByIlianLabel.Position = UDim2.new(0, 0, 0.95, 0)
ByIlianLabel.Text = "由AlexPT汉化的最佳定时器"
ByIlianLabel.TextScaled = true
ByIlianLabel.BackgroundTransparency = 1
ByIlianLabel.Parent = timerLabel

rainbowEffect(ByIlianLabel)

-- 创建一个文本按钮，用于停止定时器，设置属性
local stopButton = Instance.new("TextButton")
stopButton.Name = "StopButton"
stopButton.Size = UDim2.new(0, 50, 0, 50)
stopButton.Position = UDim2.new(0, 0, 0.3, 0)
stopButton.Text = "停止定时器"
stopButton.TextScaled = true
stopButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stopButton.Parent = screenGui

-- 创建一个文本按钮，用于启动或重置定时器，设置属性
local resumeButton = Instance.new("TextButton")
resumeButton.Name = "ResumeButton"
resumeButton.Size = UDim2.new(0, 50, 0, 50)
resumeButton.Position = UDim2.new(0, 60, 0.3, 0)
resumeButton.Text = "启动定时器"
resumeButton.TextScaled = true
resumeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
resumeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
resumeButton.Parent = screenGui

-- 创建一个文本按钮，用于移除定时器界面，设置属性
local RemoveGuiButton = Instance.new("TextButton")
RemoveGuiButton.Name = "RemoveTimerGui"
RemoveGuiButton.Size = UDim2.new(0, 50, 0, 50)
RemoveGuiButton.Position = UDim2.new(0, 120, 0.3, 0)
RemoveGuiButton.Text = "移除定时器"
RemoveGuiButton.TextScaled = true
RemoveGuiButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
RemoveGuiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoveGuiButton.Parent = screenGui

-- 定义几个变量，用于记录定时器运行的时间信息，初始化为0
local runningTimer = false
local hour = 0
local minutes = 0
local seconds = 0
local milliseconds = 0

-- 定义一个函数，用于格式化时间，将时间数据格式化为指定的字符串格式
local function formatTime(hour, mins, secs, millis)
return string.format("%02d:%02d:%02d:%02d", hour, mins, secs, millis)
end

local runService = game:GetService("RunService")

-- 定义一个函数，用于更新定时器显示的时间
local function updateTimer(deltaTime)
if runningTimer then
milliseconds = milliseconds + deltaTime * 1000

if milliseconds >= 1000 then
milliseconds = 0
seconds = seconds + 1
local SoundsTimer = Instance.new("Sound")
SoundsTimer.SoundId = "rbxassetid://144368233"
SoundsTimer.Parent = timerLabel
SoundsTimer.Volume = 5
SoundsTimer:Play()
task.wait()
if seconds >= 60 then
seconds = 0
minutes = minutes + 1
if minutes >= 60 then
minutes = 0
hour = hour + 1
end
end
end

timerLabel.Text = formatTime(hour, minutes, seconds, milliseconds)
end
end

-- 将更新定时器的函数连接到游戏运行的心跳事件（Heartbeat）上
runService.Heartbeat:Connect(updateTimer)

-- 定义一个函数，用于启动或重置定时器
local function startOrResetTimer()
if runningTimer then
runningTimer = false
minutes = 0
seconds = 0
milliseconds = 0
hour = 0
timerLabel.Text = formatTime(hour, minutes, seconds, milliseconds)
resumeButton.Text = "启动定时器"
stopButton.Text = "定时器已停止!"
else
runningTimer = true
resumeButton.Text = "重置定时器或继续"
stopButton.Text = "停止定时器"
end
end

-- 定义一个函数，用于停止定时器
local function stopTimer()
if runningTimer then
runningTimer = false
stopButton.Text = "定时器已停止!"
end
end

-- 定义一个函数，用于移除定时器界面
local function RemoveUi()
playerGui:FindFirstChild("TimerGui"):Destroy()
end

-- 将角色死亡事件连接到停止定时器的函数上
humanoid.Died:Connect(stopTimer)

-- 将停止按钮的鼠标左键点击事件连接到停止定时器的函数上
stopButton.MouseButton1Click:Connect(stopTimer)
-- 将启动/重置按钮的鼠标左键点击事件连接到对应的函数上
resumeButton.MouseButton1Click:Connect(startOrResetTimer)
-- 将移除定时器界面按钮的鼠标左键点击事件连接到移除界面的函数上
RemoveGuiButton.MouseButton1Click:Connect(RemoveUi)