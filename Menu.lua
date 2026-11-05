-- LocalScript đặt tại StarterPlayer -> StarterPlayerScripts
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

---------------------------------------------------------
-- 1. HIỆU ỨNG NHÒE MÀN HÌNH (BLUR EFFECT)
---------------------------------------------------------
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 16
blurEffect.Parent = Lighting

---------------------------------------------------------
-- 2. HỆ THỐNG ĐA NGÔN NGỮ & BÀI TEST
---------------------------------------------------------
local currentLang = "VN"

local I18N = {
	VN = {
		KeyTitle = "🛡️ CYBER SYSTEM TERMINAL v5.0 🛡️",
		Q1Text = "Câu 1: Quần đảo Hoàng Sa và Trường Sa thuộc chủ quyền của quốc gia nào?",
		Q2Text = "Câu 2: Bác Hồ ra đi tìm đường cứu nước vào năm bao nhiêu?",
		
		OptQ1_VN = "★ VIỆT NAM",
		OptQ1_CN = "🇨🇳 TRUNG QUỐC",
		
		OptQ2_1 = "1911",
		OptQ2_2 = "1830",
		OptQ2_3 = "2025",
		
		OkBtn = "XÁC NHẬN ➔",
		
		TabHome = "🏠 Trang Chủ",
		TabFly = "✈️ Bay",
		TabPEsp = "👁️ ESP Player",
		TabIEsp = "📦 ESP Item",
		TabFun = "🎭 Troll / Fun",
		TabScale = "📐 Cỡ Menu",
		TabLang = "🌐 Ngôn Ngữ",
		TabEscape = "🛡️ Anti Combo",
		TabLag = "⚡ Fix Lag",
		
		HomeContent = "📋 TÍNH NĂNG HỆ THỐNG:\n1. ✈️ Bay & Tốc Độ | 2. 👁️ ESP Player\n3. 📦 Radar Item | 4. 🎭 Lốc Xoáy Spin 80\n5. 🛡️ Anti Combo & Anti Runner (Speed 50)\n6. ⚡ Fix Lag Sắt Vụn",
		ThemeHeader = "🎨 ĐỔI HÌNH NỀN MENU (THEME ID):",
		ThemePlaceholder = "Nhập Asset ID hình...",
		ApplyThemeBtn = "✨ Áp Dụng Theme",
		ResetThemeBtn = "🗑️ Xóa Theme",
		
		FlyStatus = "Trạng Thái Bay",
		FlySpeed = "Tốc Độ Bay",
		MobileDown = "▼ XUỐNG",
		
		FilterPlayer = "Lọc Tên Player:",
		FilterPlaceholder = "Để trống = tất cả",
		
		ItemEspRow = "Bật/Tắt Radar Vật Phẩm",
		ItemRadarInfo = "👉 Bấm vào item để tự động bật chỉ đường!",
		ItemFinding = "Tìm thấy ",
		ItemStuds = " vật phẩm. Bấm để dẫn đường!",
		ItemTracerNav = "🎯 Đang dẫn đường: ",
		ItemArrived = "✅ Đã đến vị trí / Nhặt thành công!",
		
		FlingRow = "🌀 Lốc Xoáy Spin (Speed 80)",
		ScaleRow = "Chỉnh Kích Thước Menu",
		LangRow = "Chọn Ngôn Ngữ Hiển Thị",
		EscapeRow = "Anti Combo (Dịch phải 20 Studs)",
		RunnerHeader = "🏃‍♂️ Anti Runner (Bấm bật/tắt):",
		
		FixLagRow = "Fix Lag Sắt Vụn",
		FixLagNote = "• Bật: Đổi toàn bộ map thành màu xám sắt tối đa FPS.\n• Tắt: Khôi phục nguyên trạng màu sắc ban đầu của game.",
		
		ToggleOn = "BẬT",
		ToggleOff = "TẮT",
		ResetBtnText = "🎯 Quay Về"
	},
	EN = {
		KeyTitle = "🛡️ CYBER SYSTEM TERMINAL v5.0 🛡️",
		Q1Text = "Q1: Which country do Paracel & Spratly Islands belong to?",
		Q2Text = "Q2: In what year did President Ho Chi Minh leave to find a way to save the country?",
		
		OptQ1_VN = "★ VIETNAM",
		OptQ1_CN = "🇨🇳 CHINA",
		
		OptQ2_1 = "1911",
		OptQ2_2 = "1830",
		OptQ2_3 = "2025",
		
		OkBtn = "CONFIRM ➔",
		
		TabHome = "🏠 Home",
		TabFly = "✈️ Fly",
		TabPEsp = "👁️ Player ESP",
		TabIEsp = "📦 Item ESP",
		TabFun = "🎭 Troll / Fun",
		TabScale = "📐 Menu Size",
		TabLang = "🌐 Language",
		TabEscape = "🛡️ Anti Combo",
		TabLag = "⚡ Fix Lag",
		
		HomeContent = "📋 SYSTEM FEATURES:\n1. ✈️ Fly & Speed | 2. 👁️ Player ESP\n3. 📦 Item Radar | 4. 🎭 Tornado Spin 80\n5. 🛡️ Anti Combo & Anti Runner (Speed 50)\n6. ⚡ FPS Fix Lag",
		ThemeHeader = "🎨 MENU BACKGROUND THEME (IMAGE ID):",
		ThemePlaceholder = "Enter Image Asset ID...",
		ApplyThemeBtn = "✨ Apply Theme",
		ResetThemeBtn = "🗑️ Remove Theme",
		
		FlyStatus = "Fly Status",
		FlySpeed = "Fly Speed",
		MobileDown = "▼ DOWN",
		
		FilterPlayer = "Filter Player Name:",
		FilterPlaceholder = "Empty = All players",
		
		ItemEspRow = "Item Radar Toggle",
		ItemRadarInfo = "👉 Click an item to start tracking!",
		ItemFinding = "Found ",
		ItemStuds = " items. Click to navigate!",
		ItemTracerNav = "🎯 Navigating to: ",
		ItemArrived = "✅ Arrived / Picked up successfully!",
		
		FlingRow = "🌀 Tornado Spin (Speed 80)",
		ScaleRow = "Menu Scale Setting",
		LangRow = "Select Display Language",
		EscapeRow = "Anti Combo (Right 20 Studs)",
		RunnerHeader = "🏃‍♂️ Anti Runner (Click On/Off):",
		
		FixLagRow = "FPS Fix Lag Mode",
		FixLagNote = "• On: Converts map into smooth grey plastic for top FPS.\n• Off: Restores original map appearance.",
		
		ToggleOn = "ON",
		ToggleOff = "OFF",
		ResetBtnText = "🎯 Reset Pos"
	}
}

---------------------------------------------------------
-- 3. BIẾN TRẠNG THÁI RUNTIME
---------------------------------------------------------
local isFlying = false
local isPlayerEspActive = false
local itemRadarActive = false
local isFixLagActive = false
local isAutoEscapeActive = false
local isSpinFlingActive = false

local targetSearchName = ""
local flySpeed = 50
local itemRadarRange = 500

local moveUp = false
local moveDown = false
local bodyVel = nil
local bodyGyro = nil
local spinBodyGyro = nil

local playerEspElements = {}
local originalColors = {}

local activeTracerBeam = nil
local activeTracerTarget = nil
local activeTracerPos = nil
local activeItemName = ""
local tracerConnection = nil

local activeRunnerTarget = nil
local runnerTracerBeam = nil
local runnerConnection = nil
local defaultWalkSpeed = 16

local lastHealth = -1
local lastEscapeTick = 0

local currentStep = 1
local selectedQ1 = nil
local selectedQ2 = nil

local itemTranslations = {
	["pumpkin"] = {VN = "Bí Ngô 🎃", EN = "Pumpkin 🎃"},
	["candy"] = {VN = "Kẹo Ngọt 🍬", EN = "Candy 🍬"},
	["gift"] = {VN = "Hộp Quà 🎁", EN = "Gift Box 🎁"},
	["coin"] = {VN = "Đồng Tiền Vàng 🪙", EN = "Gold Coin 🪙"},
	["gold"] = {VN = "Vàng 💰", EN = "Gold 💰"},
	["sword"] = {VN = "Kiếm ⚔️", EN = "Sword ⚔️"},
	["chest"] = {VN = "Rương Kho Báu 📦", EN = "Treasure Chest 📦"},
	["potion"] = {VN = "Thuốc Phép 🧪", EN = "Potion 🧪"},
	["key"] = {VN = "Chìa Khóa 🔑", EN = "Key 🔑"},
	["gem"] = {VN = "Ngọc Quý 💎", EN = "Gem 💎"}
}

local function translateItemName(rawName)
	local lowerName = string.lower(rawName)
	for engKey, trans in pairs(itemTranslations) do
		if string.find(lowerName, engKey) then
			return trans[currentLang]
		end
	end
	return rawName
end

---------------------------------------------------------
-- 4. TẠO SCREEN GUI
---------------------------------------------------------
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("CyberBlueMenu") then
	playerGui.CyberBlueMenu:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CyberBlueMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

---------------------------------------------------------
-- 5. BẢNG XÁC NHẬN KEY (CODE DÀY ĐẶC TRÀN NGẬP & SIÊU TỐC)
---------------------------------------------------------
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Size = UDim2.new(0, 420, 0, 360)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -180)
keyFrame.BackgroundColor3 = Color3.fromRGB(6, 10, 16)
keyFrame.BorderSizePixel = 0
keyFrame.ClipsDescendants = true
keyFrame.ZIndex = 10
keyFrame.Parent = screenGui
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", keyFrame).Color = Color3.fromRGB(0, 255, 150)

-- TextLabel chứa toàn bộ code dày đặc ngập lụt màn hình
local codeBlockLabel = Instance.new("TextLabel")
codeBlockLabel.Name = "CodeBlock"
codeBlockLabel.Size = UDim2.new(1, -10, 0, 2000)
codeBlockLabel.Position = UDim2.new(0, 5, 0, 0)
codeBlockLabel.BackgroundTransparency = 1
codeBlockLabel.TextColor3 = Color3.fromRGB(0, 255, 80)
codeBlockLabel.TextTransparency = 0.25
codeBlockLabel.TextSize = 8
codeBlockLabel.Font = Enum.Font.Code
codeBlockLabel.TextXAlignment = Enum.TextXAlignment.Left
codeBlockLabel.TextYAlignment = Enum.TextYAlignment.Top
codeBlockLabel.TextWrapped = true
codeBlockLabel.ZIndex = 0
codeBlockLabel.Parent = keyFrame

local codeLines = {
	"01110100 01110010 01101111 01101100 01101100",
	"INIT_CYBER_CORE_MODULES...",
	"BYPASSING_CHECKSUM_TOKEN...",
	"MEM_ALLOC_0x88F92A...",
	"LINKING_USER_IDENTIFIER...",
	"LOAD_PLAYER: " .. player.Name,
	"INJECT_SECURITY_PATCH_v9.2",
	"SOCKET_OPEN: 127.0.0.1:443",
	"DECRYPTING_SECURE_ASSETS...",
	"KERNEL_OVERRIDE_ACTIVE"
}

local fullCodeString = ""
for i = 1, 120 do
	fullCodeString = fullCodeString .. codeLines[math.random(1, #codeLines)] .. " // SYNC_" .. i .. "\n"
end
fullCodeString = fullCodeString .. "tôi yêu nước vãi cả đạn"
codeBlockLabel.Text = fullCodeString

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 35)
keyTitle.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.TextSize = 11
keyTitle.Font = Enum.Font.GothamBold
keyTitle.Text = ""
keyTitle.Visible = false
keyTitle.ZIndex = 2
keyTitle.Parent = keyFrame
Instance.new("UICorner", keyTitle).CornerRadius = UDim.new(0, 12)

local langSelectRow = Instance.new("Frame")
langSelectRow.Size = UDim2.new(1, -30, 0, 24)
langSelectRow.Position = UDim2.new(0, 15, 0, 40)
langSelectRow.BackgroundTransparency = 1
langSelectRow.Visible = false
langSelectRow.ZIndex = 2
langSelectRow.Parent = keyFrame

local vnKeyLang = Instance.new("TextButton")
vnKeyLang.Size = UDim2.new(0.48, 0, 1, 0)
vnKeyLang.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
vnKeyLang.TextColor3 = Color3.fromRGB(255, 255, 255)
vnKeyLang.Font = Enum.Font.GothamBold
vnKeyLang.TextSize = 8
vnKeyLang.Text = "🇻🇳 Tiếng Việt"
vnKeyLang.ZIndex = 3
vnKeyLang.Parent = langSelectRow
Instance.new("UICorner", vnKeyLang).CornerRadius = UDim.new(0, 6)

local enKeyLang = Instance.new("TextButton")
enKeyLang.Size = UDim2.new(0.48, 0, 1, 0)
enKeyLang.Position = UDim2.new(0.52, 0, 0, 0)
enKeyLang.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
enKeyLang.TextColor3 = Color3.fromRGB(255, 255, 255)
enKeyLang.Font = Enum.Font.GothamBold
enKeyLang.TextSize = 8
enKeyLang.Text = "🇬🇧 English"
enKeyLang.ZIndex = 3
enKeyLang.Parent = langSelectRow
Instance.new("UICorner", enKeyLang).CornerRadius = UDim.new(0, 6)

local activeNotice = Instance.new("TextLabel")
activeNotice.Size = UDim2.new(1, -30, 0, 35)
activeNotice.Position = UDim2.new(0, 15, 0, 70)
activeNotice.BackgroundTransparency = 1
activeNotice.TextColor3 = Color3.fromRGB(0, 255, 180)
activeNotice.TextSize = 9
activeNotice.Font = Enum.Font.GothamMedium
activeNotice.TextWrapped = true
activeNotice.TextXAlignment = Enum.TextXAlignment.Left
activeNotice.Text = ""
activeNotice.Visible = false
activeNotice.ZIndex = 2
activeNotice.Parent = keyFrame

local questionContainer = Instance.new("Frame")
questionContainer.Size = UDim2.new(1, -30, 0, 105)
questionContainer.Position = UDim2.new(0, 15, 0, 110)
questionContainer.BackgroundTransparency = 1
questionContainer.Visible = false
questionContainer.ZIndex = 2
questionContainer.Parent = keyFrame

local qText = Instance.new("TextLabel")
qText.Size = UDim2.new(1, 0, 0, 35)
qText.BackgroundTransparency = 1
qText.TextColor3 = Color3.fromRGB(240, 240, 250)
qText.TextSize = 9
qText.Font = Enum.Font.GothamBold
qText.TextXAlignment = Enum.TextXAlignment.Left
qText.TextWrapped = true
qText.Text = ""
qText.ZIndex = 2
qText.Parent = questionContainer

local optBtn1 = Instance.new("TextButton")
optBtn1.Size = UDim2.new(0.48, 0, 0, 35)
optBtn1.Position = UDim2.new(0, 0, 0, 45)
optBtn1.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
optBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
optBtn1.Font = Enum.Font.GothamBold
optBtn1.TextSize = 9
optBtn1.Text = ""
optBtn1.Visible = false
optBtn1.ZIndex = 3
optBtn1.Parent = questionContainer
Instance.new("UICorner", optBtn1).CornerRadius = UDim.new(0, 6)

local optBtn2 = Instance.new("TextButton")
optBtn2.Size = UDim2.new(0.48, 0, 0, 35)
optBtn2.Position = UDim2.new(0.52, 0, 0, 45)
optBtn2.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
optBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
optBtn2.Font = Enum.Font.GothamBold
optBtn2.TextSize = 9
optBtn2.Text = ""
optBtn2.Visible = false
optBtn2.ZIndex = 3
optBtn2.Parent = questionContainer
Instance.new("UICorner", optBtn2).CornerRadius = UDim.new(0, 6)

local optBtn3 = Instance.new("TextButton")
optBtn3.Size = UDim2.new(0.31, 0, 0, 35)
optBtn3.Position = UDim2.new(0.69, 0, 0, 45)
optBtn3.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
optBtn3.TextColor3 = Color3.fromRGB(255, 255, 255)
optBtn3.Font = Enum.Font.GothamBold
optBtn3.TextSize = 9
optBtn3.Text = ""
optBtn3.Visible = false
optBtn3.ZIndex = 3
optBtn3.Parent = questionContainer
Instance.new("UICorner", optBtn3).CornerRadius = UDim.new(0, 6)

local submitKeyBtn = Instance.new("TextButton")
submitKeyBtn.Size = UDim2.new(1, -30, 0, 35)
submitKeyBtn.Position = UDim2.new(0, 15, 0, 310)
submitKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
submitKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitKeyBtn.Font = Enum.Font.GothamBold
submitKeyBtn.TextSize = 10
submitKeyBtn.Text = ""
submitKeyBtn.Visible = false
submitKeyBtn.ZIndex = 3
submitKeyBtn.Parent = keyFrame
Instance.new("UICorner", submitKeyBtn).CornerRadius = UDim.new(0, 6)

local function typeText(textLabel, fullText, speed)
	speed = speed or 0.01
	textLabel.Text = ""
	for i = 1, utf8.len(fullText) do
		local strIndex = utf8.offset(fullText, i + 1) - 1
		textLabel.Text = string.sub(fullText, 1, strIndex)
		task.wait(speed)
	end
end

-- Chạy hiệu ứng trượt code siêu tốc mượt mà
task.spawn(function()
	local startTime = tick()
	while tick() - startTime < 1.0 do
		codeBlockLabel.Position = UDim2.new(0, 5, 0, - (tick() - startTime) * 800)
		task.wait(0.01)
	end
	
	codeBlockLabel.Visible = false
	
	keyTitle.Visible = true
	keyTitle.Text = I18N[currentLang].KeyTitle
	
	langSelectRow.Visible = true
	
	activeNotice.Visible = true
	local targetMsg = "player: " .. player.Name .. " đã được liên kết với hệ thống cyber..."
	typeText(activeNotice, targetMsg, 0.01)
	
	task.wait(0.1)
	
	questionContainer.Visible = true
	typeText(qText, I18N[currentLang].Q1Text, 0.01)
	
	optBtn1.Visible = true
	typeText(optBtn1, I18N[currentLang].OptQ1_VN, 0.005)
	
	optBtn2.Visible = true
	typeText(optBtn2, I18N[currentLang].OptQ1_CN, 0.005)
	
	submitKeyBtn.Visible = true
	typeText(submitKeyBtn, I18N[currentLang].OkBtn, 0.005)
end)

vnKeyLang.MouseButton1Click:Connect(function()
	currentLang = "VN"
	vnKeyLang.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	enKeyLang.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
	qText.Text = I18N.VN.Q1Text
	optBtn1.Text = I18N.VN.OptQ1_VN
	optBtn2.Text = I18N.VN.OptQ1_CN
end)

enKeyLang.MouseButton1Click:Connect(function()
	currentLang = "EN"
	vnKeyLang.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
	enKeyLang.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	qText.Text = I18N.EN.Q1Text
	optBtn1.Text = I18N.EN.OptQ1_VN
	optBtn2.Text = I18N.EN.OptQ1_CN
end)

local function loadQuestionStep()
	local langData = I18N[currentLang]
	if currentStep == 1 then
		qText.Text = langData.Q1Text
		optBtn1.Text = langData.OptQ1_VN
		optBtn2.Text = langData.OptQ1_CN
		optBtn3.Visible = false
		optBtn1.Size = UDim2.new(0.48, 0, 0, 35)
		optBtn2.Size = UDim2.new(0.48, 0, 0, 35)
	elseif currentStep == 2 then
		typeText(qText, langData.Q2Text, 0.01)
		optBtn1.Text = ""
		optBtn2.Text = ""
		optBtn3.Text = ""
		
		optBtn1.Size = UDim2.new(0.31, 0, 0, 35)
		optBtn2.Size = UDim2.new(0.31, 0, 0, 35)
		optBtn2.Position = UDim2.new(0.34, 0, 0, 45)
		
		optBtn1.Visible = true
		typeText(optBtn1, langData.OptQ2_1, 0.005)
		
		optBtn2.Visible = true
		typeText(optBtn2, langData.OptQ2_2, 0.005)
		
		optBtn3.Visible = true
		typeText(optBtn3, langData.OptQ2_3, 0.005)
	end
end

---------------------------------------------------------
-- 6. GIAO DIỆN CHÍNH (70% ~ 420x300)
---------------------------------------------------------
local YOUR_IMAGE_ID = "123456789" 

local toggleMenuBtn = Instance.new("ImageButton")
toggleMenuBtn.Name = "ToggleMenuButton"
toggleMenuBtn.Size = UDim2.new(0, 45, 0, 45)
toggleMenuBtn.Position = UDim2.new(0, 15, 0.35, 0)
toggleMenuBtn.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
toggleMenuBtn.Image = "rbxassetid://" .. tostring(YOUR_IMAGE_ID)
toggleMenuBtn.ScaleType = Enum.ScaleType.Fit
toggleMenuBtn.Visible = false
toggleMenuBtn.Parent = screenGui
Instance.new("UICorner", toggleMenuBtn).CornerRadius = UDim.new(0, 10)

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(0, 255, 150)
btnStroke.Thickness = 2
btnStroke.Parent = toggleMenuBtn

local resetPosBtn = Instance.new("TextButton")
resetPosBtn.Name = "ResetPosButton"
resetPosBtn.Size = UDim2.new(0, 75, 0, 35)
resetPosBtn.Position = UDim2.new(1, -165, 1, -60)
resetPosBtn.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
resetPosBtn.BackgroundTransparency = 0.3
resetPosBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
resetPosBtn.Font = Enum.Font.GothamBold
resetPosBtn.TextSize = 10
resetPosBtn.Visible = false
resetPosBtn.Parent = screenGui
Instance.new("UICorner", resetPosBtn).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", resetPosBtn).Color = Color3.fromRGB(0, 255, 150)

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 300)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Visible = false
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", mainFrame).Color = Color3.fromRGB(0, 255, 150)

local bgThemeImage = Instance.new("ImageLabel")
bgThemeImage.Name = "BGThemeImage"
bgThemeImage.Size = UDim2.new(1, 0, 1, 0)
bgThemeImage.BackgroundTransparency = 1
bgThemeImage.ScaleType = Enum.ScaleType.Crop
bgThemeImage.ImageTransparency = 0.2
bgThemeImage.ZIndex = 0
bgThemeImage.Visible = false
bgThemeImage.Parent = mainFrame
Instance.new("UICorner", bgThemeImage).CornerRadius = UDim.new(0, 12)

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 28)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = mainFrame
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -30, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "🌐 CYBER SYSTEM MENU"
titleText.TextColor3 = Color3.fromRGB(0, 255, 150)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 10
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 2
titleText.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.ZIndex = 2
closeBtn.Parent = titleBar

---------------------------------------------------------
-- 7. HỆ THỐNG TAB & THƯ MỤC NỘI DUNG
---------------------------------------------------------
local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(0, 100, 1, -28)
sidebar.Position = UDim2.new(0, 0, 0, 28)
sidebar.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
sidebar.BorderSizePixel = 0
sidebar.CanvasSize = UDim2.new(0, 0, 0, 280)
sidebar.ScrollBarThickness = 2
sidebar.ZIndex = 2
sidebar.Parent = mainFrame

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -105, 1, -35)
contentArea.Position = UDim2.new(0, 105, 0, 32)
contentArea.BackgroundTransparency = 1
contentArea.ZIndex = 2
contentArea.Parent = mainFrame

local tabs = {
	Home = Instance.new("ScrollingFrame"),
	Fly = Instance.new("ScrollingFrame"),
	PlayerEsp = Instance.new("ScrollingFrame"),
	ItemEsp = Instance.new("ScrollingFrame"),
	Fun = Instance.new("ScrollingFrame"),
	ScaleMenu = Instance.new("ScrollingFrame"),
	LangMenu = Instance.new("ScrollingFrame"),
	EscapeMenu = Instance.new("ScrollingFrame"),
	FixLag = Instance.new("ScrollingFrame")
}

for _, frame in pairs(tabs) do
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.CanvasSize = UDim2.new(0, 0, 0, 350)
	frame.ScrollBarThickness = 3
	frame.Visible = false
	frame.ZIndex = 2
	frame.Parent = contentArea
end
tabs.Home.Visible = true

local tabButtons = {}

local function switchTab(tabName)
	for name, frame in pairs(tabs) do
		frame.Visible = (name == tabName)
	end
end

local function createTabButton(posY, targetTab)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -8, 0, 26)
	btn.Position = UDim2.new(0, 4, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
	btn.TextColor3 = Color3.fromRGB(200, 220, 240)
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 9
	btn.ZIndex = 2
	btn.Parent = sidebar

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
	btn.MouseButton1Click:Connect(function() switchTab(targetTab) end)
	tabButtons[targetTab] = btn
end

createTabButton(4, "Home")
createTabButton(32, "Fly")
createTabButton(60, "PlayerEsp")
createTabButton(88, "ItemEsp")
createTabButton(116, "Fun")
createTabButton(144, "ScaleMenu")
createTabButton(172, "LangMenu")
createTabButton(200, "EscapeMenu")
createTabButton(228, "FixLag")

local function createControlRow(parentTab, posY)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -8, 0, 34)
	row.Position = UDim2.new(0, 0, 0, posY)
	row.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
	row.ZIndex = 2
	row.Parent = parentTab
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0.55, 0, 1, 0)
	lbl.Position = UDim2.new(0, 8, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = Color3.fromRGB(220, 230, 250)
	lbl.Font = Enum.Font.GothamMedium
	lbl.TextSize = 9
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.ZIndex = 2
	lbl.Parent = row
	return row, lbl
end

-- TAB HOME & THEME
local homeText = Instance.new("TextLabel")
homeText.Size = UDim2.new(1, -8, 0, 110)
homeText.BackgroundTransparency = 1
homeText.TextColor3 = Color3.fromRGB(190, 210, 230)
homeText.TextSize = 9
homeText.Font = Enum.Font.Gotham
homeText.TextWrapped = true
homeText.TextYAlignment = Enum.TextYAlignment.Top
homeText.ZIndex = 2
homeText.Parent = tabs.Home

local themeHeader = Instance.new("TextLabel")
themeHeader.Size = UDim2.new(1, -8, 0, 18)
themeHeader.Position = UDim2.new(0, 0, 0, 115)
themeHeader.BackgroundTransparency = 1
themeHeader.TextColor3 = Color3.fromRGB(0, 255, 150)
themeHeader.Font = Enum.Font.GothamBold
themeHeader.TextSize = 9
themeHeader.TextXAlignment = Enum.TextXAlignment.Left
themeHeader.ZIndex = 2
themeHeader.Parent = tabs.Home

local themeBox = Instance.new("TextBox")
themeBox.Size = UDim2.new(1, -8, 0, 26)
themeBox.Position = UDim2.new(0, 0, 0, 136)
themeBox.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
themeBox.TextColor3 = Color3.fromRGB(0, 255, 150)
themeBox.Font = Enum.Font.Gotham
themeBox.TextSize = 9
themeBox.ZIndex = 2
themeBox.Parent = tabs.Home
Instance.new("UICorner", themeBox).CornerRadius = UDim.new(0, 4)

local applyThemeBtn = Instance.new("TextButton")
applyThemeBtn.Size = UDim2.new(0.48, 0, 0, 26)
applyThemeBtn.Position = UDim2.new(0, 0, 0, 168)
applyThemeBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
applyThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applyThemeBtn.Font = Enum.Font.GothamBold
applyThemeBtn.TextSize = 9
applyThemeBtn.ZIndex = 2
applyThemeBtn.Parent = tabs.Home
Instance.new("UICorner", applyThemeBtn).CornerRadius = UDim.new(0, 4)

local resetThemeBtn = Instance.new("TextButton")
resetThemeBtn.Size = UDim2.new(0.48, 0, 0, 26)
resetThemeBtn.Position = UDim2.new(0.52, 0, 0, 168)
resetThemeBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
resetThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
resetThemeBtn.Font = Enum.Font.GothamBold
resetThemeBtn.TextSize = 9
resetThemeBtn.ZIndex = 2
resetThemeBtn.Parent = tabs.Home
Instance.new("UICorner", resetThemeBtn).CornerRadius = UDim.new(0, 4)

applyThemeBtn.MouseButton1Click:Connect(function()
	local inputId = string.match(themeBox.Text, "%d+")
	if inputId then
		bgThemeImage.Image = "rbxassetid://" .. inputId
		bgThemeImage.Visible = true
		mainFrame.BackgroundTransparency = 0.5
	end
end)

resetThemeBtn.MouseButton1Click:Connect(function()
	bgThemeImage.Visible = false
	bgThemeImage.Image = ""
	themeBox.Text = ""
	mainFrame.BackgroundTransparency = 0.05
end)

-- TAB FLY
local flyRow, flyLbl = createControlRow(tabs.Fly, 5)
local flyToggle = Instance.new("TextButton")
flyToggle.Size = UDim2.new(0, 65, 0, 24)
flyToggle.Position = UDim2.new(1, -70, 0.5, -12)
flyToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
flyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flyToggle.Font = Enum.Font.GothamBold
flyToggle.TextSize = 9
flyToggle.ZIndex = 2
flyToggle.Parent = flyRow
Instance.new("UICorner", flyToggle).CornerRadius = UDim.new(0, 4)

local speedRow, speedLbl = createControlRow(tabs.Fly, 44)
local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 24, 0, 24)
minusBtn.Position = UDim2.new(1, -85, 0.5, -12)
minusBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
minusBtn.Text = "-"
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.Font = Enum.Font.GothamBold
minusBtn.ZIndex = 2
minusBtn.Parent = speedRow

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0, 40, 0, 24)
speedBox.Position = UDim2.new(1, -58, 0.5, -12)
speedBox.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
speedBox.Text = tostring(flySpeed)
speedBox.TextColor3 = Color3.fromRGB(0, 255, 150)
speedBox.Font = Enum.Font.GothamBold
speedBox.TextSize = 10
speedBox.ZIndex = 2
speedBox.Parent = speedRow

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 24, 0, 24)
plusBtn.Position = UDim2.new(1, -14, 0.5, -12)
plusBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.Font = Enum.Font.GothamBold
plusBtn.ZIndex = 2
plusBtn.Parent = speedRow

local mobileDownBtn = Instance.new("TextButton")
mobileDownBtn.Size = UDim2.new(0, 45, 0, 45)
mobileDownBtn.Position = UDim2.new(1, -70, 0.62, 0)
mobileDownBtn.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
mobileDownBtn.BackgroundTransparency = 0.3
mobileDownBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
mobileDownBtn.Font = Enum.Font.GothamBold
mobileDownBtn.TextSize = 9
mobileDownBtn.Visible = false
mobileDownBtn.Parent = screenGui
Instance.new("UICorner", mobileDownBtn).CornerRadius = UDim.new(0, 8)

-- TAB PLAYER ESP
local pEspRow, pEspLbl = createControlRow(tabs.PlayerEsp, 5)
local pEspToggle = Instance.new("TextButton")
pEspToggle.Size = UDim2.new(0, 65, 0, 24)
pEspToggle.Position = UDim2.new(1, -70, 0.5, -12)
pEspToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
pEspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
pEspToggle.Font = Enum.Font.GothamBold
pEspToggle.TextSize = 9
pEspToggle.ZIndex = 2
pEspToggle.Parent = pEspRow
Instance.new("UICorner", pEspToggle).CornerRadius = UDim.new(0, 4)

local inputRow = Instance.new("Frame")
inputRow.Size = UDim2.new(1, -8, 0, 36)
inputRow.Position = UDim2.new(0, 0, 0, 44)
inputRow.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
inputRow.ZIndex = 2
inputRow.Parent = tabs.PlayerEsp
Instance.new("UICorner", inputRow).CornerRadius = UDim.new(0, 4)

local inputLbl = Instance.new("TextLabel")
inputLbl.Size = UDim2.new(0.4, 0, 1, 0)
inputLbl.Position = UDim2.new(0, 8, 0, 0)
inputLbl.BackgroundTransparency = 1
inputLbl.TextColor3 = Color3.fromRGB(220, 230, 250)
inputLbl.Font = Enum.Font.GothamMedium
inputLbl.TextSize = 9
inputLbl.TextXAlignment = Enum.TextXAlignment.Left
inputLbl.ZIndex = 2
inputLbl.Parent = inputRow

local nameBox = Instance.new("TextBox")
nameBox.Size = UDim2.new(0.55, 0, 0, 24)
nameBox.Position = UDim2.new(0.42, 0, 0.5, -12)
nameBox.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
nameBox.Text = ""
nameBox.TextColor3 = Color3.fromRGB(0, 255, 150)
nameBox.Font = Enum.Font.Gotham
nameBox.TextSize = 9
nameBox.ZIndex = 2
nameBox.Parent = inputRow
Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 4)

nameBox.FocusLost:Connect(function()
	targetSearchName = string.lower(nameBox.Text):gsub("^%s+", ""):gsub("%s+$", "")
end)

-- TAB ITEM ESP
local iEspRow, iEspLbl = createControlRow(tabs.ItemEsp, 5)
local iEspToggle = Instance.new("TextButton")
iEspToggle.Size = UDim2.new(0, 65, 0, 24)
iEspToggle.Position = UDim2.new(1, -70, 0.5, -12)
iEspToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
iEspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
iEspToggle.Font = Enum.Font.GothamBold
iEspToggle.TextSize = 9
iEspToggle.ZIndex = 2
iEspToggle.Parent = iEspRow
Instance.new("UICorner", iEspToggle).CornerRadius = UDim.new(0, 4)

local radarInfo = Instance.new("TextLabel")
radarInfo.Size = UDim2.new(1, -8, 0, 22)
radarInfo.Position = UDim2.new(0, 0, 0, 44)
radarInfo.BackgroundTransparency = 1
radarInfo.TextColor3 = Color3.fromRGB(0, 255, 150)
radarInfo.Font = Enum.Font.GothamBold
radarInfo.TextSize = 9
radarInfo.ZIndex = 2
radarInfo.Parent = tabs.ItemEsp

local radarContainer = Instance.new("ScrollingFrame")
radarContainer.Size = UDim2.new(1, -8, 1, -70)
radarContainer.Position = UDim2.new(0, 0, 0, 70)
radarContainer.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
radarContainer.BorderSizePixel = 0
radarContainer.ScrollBarThickness = 3
radarContainer.ZIndex = 2
radarContainer.Parent = tabs.ItemEsp
Instance.new("UICorner", radarContainer).CornerRadius = UDim.new(0, 4)

local radarLayout = Instance.new("UIListLayout")
radarLayout.SortOrder = Enum.SortOrder.LayoutOrder
radarLayout.Padding = UDim.new(0, 3)
radarLayout.Parent = radarContainer

-- TAB TROLL / FUN
local flingRow, flingLbl = createControlRow(tabs.Fun, 5)
local flingToggle = Instance.new("TextButton")
flingToggle.Size = UDim2.new(0, 65, 0, 24)
flingToggle.Position = UDim2.new(1, -70, 0.5, -12)
flingToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
flingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
flingToggle.Font = Enum.Font.GothamBold
flingToggle.TextSize = 9
flingToggle.ZIndex = 2
flingToggle.Parent = flingRow
Instance.new("UICorner", flingToggle).CornerRadius = UDim.new(0, 4)

-- TAB SCALE MENU
local scaleRow, scaleLbl = createControlRow(tabs.ScaleMenu, 5)

local function applyScale(w, h)
	mainFrame.Size = UDim2.new(0, w, 0, h)
	mainFrame.Position = UDim2.new(0.5, -w/2, 0.5, -h/2)
end

local btn50 = Instance.new("TextButton")
btn50.Size = UDim2.new(0, 50, 0, 24)
btn50.Position = UDim2.new(1, -160, 0.5, -12)
btn50.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
btn50.TextColor3 = Color3.fromRGB(255, 255, 255)
btn50.Font = Enum.Font.GothamBold
btn50.TextSize = 9
btn50.Text = "50%"
btn50.ZIndex = 2
btn50.Parent = scaleRow
Instance.new("UICorner", btn50).CornerRadius = UDim.new(0, 4)

local btn70 = Instance.new("TextButton")
btn70.Size = UDim2.new(0, 50, 0, 24)
btn70.Position = UDim2.new(1, -105, 0.5, -12)
btn70.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
btn70.TextColor3 = Color3.fromRGB(255, 255, 255)
btn70.Font = Enum.Font.GothamBold
btn70.TextSize = 9
btn70.Text = "70%"
btn70.ZIndex = 2
btn70.Parent = scaleRow
Instance.new("UICorner", btn70).CornerRadius = UDim.new(0, 4)

local btn100 = Instance.new("TextButton")
btn100.Size = UDim2.new(0, 50, 0, 24)
btn100.Position = UDim2.new(1, -50, 0.5, -12)
btn100.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
btn100.TextColor3 = Color3.fromRGB(255, 255, 255)
btn100.Font = Enum.Font.GothamBold
btn100.TextSize = 9
btn100.Text = "100%"
btn100.ZIndex = 2
btn100.Parent = scaleRow
Instance.new("UICorner", btn100).CornerRadius = UDim.new(0, 4)

btn50.MouseButton1Click:Connect(function()
	applyScale(300, 210)
	btn50.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	btn70.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
	btn100.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
end)

btn70.MouseButton1Click:Connect(function()
	applyScale(420, 300)
	btn50.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
	btn70.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	btn100.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
end)

btn100.MouseButton1Click:Connect(function()
	applyScale(540, 380)
	btn50.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
	btn70.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
	btn100.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
end)

-- TAB LANG MENU
local langRowTab, langLblTab = createControlRow(tabs.LangMenu, 5)

local vnLangBtnTab = Instance.new("TextButton")
vnLangBtnTab.Size = UDim2.new(0, 75, 0, 24)
vnLangBtnTab.Position = UDim2.new(1, -150, 0.5, -12)
vnLangBtnTab.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
vnLangBtnTab.TextColor3 = Color3.fromRGB(255, 255, 255)
vnLangBtnTab.Font = Enum.Font.GothamBold
vnLangBtnTab.TextSize = 9
vnLangBtnTab.Text = "🇻🇳 Tiếng Việt"
vnLangBtnTab.ZIndex = 2
vnLangBtnTab.Parent = langRowTab
Instance.new("UICorner", vnLangBtnTab).CornerRadius = UDim.new(0, 4)

local enLangBtnTab = Instance.new("TextButton")
enLangBtnTab.Size = UDim2.new(0, 70, 0, 24)
enLangBtnTab.Position = UDim2.new(1, -72, 0.5, -12)
enLangBtnTab.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
enLangBtnTab.TextColor3 = Color3.fromRGB(255, 255, 255)
enLangBtnTab.Font = Enum.Font.GothamBold
enLangBtnTab.TextSize = 9
enLangBtnTab.Text = "🇬🇧 English"
enLangBtnTab.ZIndex = 2
enLangBtnTab.Parent = langRowTab
Instance.new("UICorner", enLangBtnTab).CornerRadius = UDim.new(0, 4)

-- TAB ESCAPE / ANTI RUNNER
local escapeRow, escapeLbl = createControlRow(tabs.EscapeMenu, 5)
local escapeToggle = Instance.new("TextButton")
escapeToggle.Size = UDim2.new(0, 65, 0, 24)
escapeToggle.Position = UDim2.new(1, -70, 0.5, -12)
escapeToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
escapeToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
escapeToggle.Font = Enum.Font.GothamBold
escapeToggle.TextSize = 9
escapeToggle.ZIndex = 2
escapeToggle.Parent = escapeRow
Instance.new("UICorner", escapeToggle).CornerRadius = UDim.new(0, 4)

local runnerHeaderLbl = Instance.new("TextLabel")
runnerHeaderLbl.Size = UDim2.new(1, -8, 0, 22)
runnerHeaderLbl.Position = UDim2.new(0, 0, 0, 44)
runnerHeaderLbl.BackgroundTransparency = 1
runnerHeaderLbl.TextColor3 = Color3.fromRGB(0, 255, 150)
runnerHeaderLbl.Font = Enum.Font.GothamBold
runnerHeaderLbl.TextSize = 9
runnerHeaderLbl.TextXAlignment = Enum.TextXAlignment.Left
runnerHeaderLbl.ZIndex = 2
runnerHeaderLbl.Parent = tabs.EscapeMenu

local runnerContainer = Instance.new("ScrollingFrame")
runnerContainer.Size = UDim2.new(1, -8, 0, 95)
runnerContainer.Position = UDim2.new(0, 0, 0, 68)
runnerContainer.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
runnerContainer.BorderSizePixel = 0
runnerContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
runnerContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
runnerContainer.ScrollBarThickness = 3
runnerContainer.ZIndex = 2
runnerContainer.Parent = tabs.EscapeMenu
Instance.new("UICorner", runnerContainer).CornerRadius = UDim.new(0, 4)

local runnerLayout = Instance.new("UIListLayout")
runnerLayout.SortOrder = Enum.SortOrder.LayoutOrder
runnerLayout.Padding = UDim.new(0, 3)
runnerLayout.Parent = runnerContainer

-- TAB FIX LAG
local lagRow, lagLbl = createControlRow(tabs.FixLag, 5)
local lagToggle = Instance.new("TextButton")
lagToggle.Size = UDim2.new(0, 65, 0, 24)
lagToggle.Position = UDim2.new(1, -70, 0.5, -12)
lagToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
lagToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
lagToggle.Font = Enum.Font.GothamBold
lagToggle.TextSize = 9
lagToggle.ZIndex = 2
lagToggle.Parent = lagRow
Instance.new("UICorner", lagToggle).CornerRadius = UDim.new(0, 4)

local lagNote = Instance.new("TextLabel")
lagNote.Size = UDim2.new(1, -8, 0, 60)
lagNote.Position = UDim2.new(0, 0, 0, 44)
lagNote.BackgroundTransparency = 1
lagNote.TextColor3 = Color3.fromRGB(150, 160, 180)
lagNote.TextSize = 9
lagNote.Font = Enum.Font.Gotham
lagNote.TextWrapped = true
lagNote.TextXAlignment = Enum.TextXAlignment.Left
lagNote.ZIndex = 2
lagNote.Parent = tabs.FixLag

---------------------------------------------------------
-- 8. CẬP NHẬT TIÊU ĐỀ UI TĨNH
---------------------------------------------------------
local function updateUIStaticTexts()
	local langData = I18N[currentLang]
	
	tabButtons.Home.Text = langData.TabHome
	tabButtons.Fly.Text = langData.TabFly
	tabButtons.PlayerEsp.Text = langData.TabPEsp
	tabButtons.ItemEsp.Text = langData.TabIEsp
	tabButtons.Fun.Text = langData.TabFun
	tabButtons.ScaleMenu.Text = langData.TabScale
	tabButtons.LangMenu.Text = langData.TabLang
	tabButtons.EscapeMenu.Text = langData.TabEscape
	tabButtons.FixLag.Text = langData.TabFixLag
	
	homeText.Text = langData.HomeContent
	themeHeader.Text = langData.ThemeHeader
	themeBox.PlaceholderText = langData.ThemePlaceholder
	applyThemeBtn.Text = langData.ApplyThemeBtn
	resetThemeBtn.Text = langData.ResetThemeBtn
	
	flyLbl.Text = langData.FlyStatus
	speedLbl.Text = langData.FlySpeed
	mobileDownBtn.Text = langData.MobileDown
	
	pEspLbl.Text = langData.TabPEsp
	inputLbl.Text = langData.FilterPlayer
	nameBox.PlaceholderText = langData.FilterPlaceholder
	
	iEspLbl.Text = langData.ItemEspRow
	if not activeTracerBeam then radarInfo.Text = langData.ItemRadarInfo end
	
	flingLbl.Text = langData.FlingRow
	scaleLbl.Text = langData.ScaleRow
	langLblTab.Text = langData.LangRow
	escapeLbl.Text = langData.EscapeRow
	runnerHeaderLbl.Text = langData.RunnerHeader
	resetPosBtn.Text = langData.ResetBtnText
	
	lagLbl.Text = langData.FixLagRow
	lagNote.Text = langData.FixLagNote
	
	flyToggle.Text = isFlying and langData.ToggleOn or langData.ToggleOff
	pEspToggle.Text = isPlayerEspActive and langData.ToggleOn or langData.ToggleOff
	iEspToggle.Text = itemRadarActive and langData.ToggleOn or langData.ToggleOff
	flingToggle.Text = isSpinFlingActive and langData.ToggleOn or langData.ToggleOff
	escapeToggle.Text = isAutoEscapeActive and langData.ToggleOn or langData.ToggleOff
	lagToggle.Text = isFixLagActive and langData.ToggleOn or langData.ToggleOff
	
	if currentLang == "VN" then
		vnLangBtnTab.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
		enLangBtnTab.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
	else
		vnLangBtnTab.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
		enLangBtnTab.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	end
end

vnLangBtnTab.MouseButton1Click:Connect(function() currentLang = "VN" updateUIStaticTexts() end)
enLangBtnTab.MouseButton1Click:Connect(function() currentLang = "EN" updateUIStaticTexts() end)

updateUIStaticTexts()

---------------------------------------------------------
-- 9. LỰA CHỌN CÂU HỎI & LOADING (TO HƠN + THANH TIẾN TRÌNH)
---------------------------------------------------------
optBtn1.MouseButton1Click:Connect(function()
	optBtn1.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	optBtn2.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	optBtn3.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	if currentStep == 1 then selectedQ1 = "VN" else selectedQ2 = "1911" end
end)

optBtn2.MouseButton1Click:Connect(function()
	optBtn2.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	optBtn1.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	optBtn3.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	if currentStep == 1 then selectedQ1 = "CN" else selectedQ2 = "1830" end
end)

optBtn3.MouseButton1Click:Connect(function()
	optBtn3.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
	optBtn1.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	optBtn2.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	selectedQ2 = "2025"
end)

submitKeyBtn.MouseButton1Click:Connect(function()
	if currentStep == 1 then
		if selectedQ1 == "CN" then
			player:Kick("Dân ta phải biết sử ta, lo học bài đi còn chơi game gì!?[span_0](start_span)[span_0](end_span)")
		elseif selectedQ1 == "VN" then
			currentStep = 2
			loadQuestionStep()
			optBtn1.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
			optBtn2.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
			optBtn3.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
		else
			submitKeyBtn.Text = "⚠️ VUI LÒNG CHỌN ĐÁP ÁN!"
			task.delay(1.5, function() submitKeyBtn.Text = I18N[currentLang].OkBtn end)
		end
	elseif currentStep == 2 then
		if selectedQ2 == "1830" or selectedQ2 == "2025" then
			player:Kick("Dân ta phải biết sử ta, lo học bài đi còn chơi game gì!?[span_1](start_span)[span_1](end_span)")
		elseif selectedQ2 == "1911" then
			questionContainer.Visible = false
			codeBlockLabel.Visible = false
			langSelectRow.Visible = false
			
			activeNotice.Size = UDim2.new(1, -30, 0, 70)
			activeNotice.Position = UDim2.new(0, 15, 0, 90)
			activeNotice.TextSize = 15
			submitKeyBtn.Visible = false
			
			local progressBg = Instance.new("Frame")
			progressBg.Size = UDim2.new(1, -40, 0, 16)
			progressBg.Position = UDim2.new(0, 20, 0, 180)
			progressBg.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
			progressBg.BorderSizePixel = 0
			progressBg.ZIndex = 12
			progressBg.Parent = keyFrame
			Instance.new("UICorner", progressBg).CornerRadius = UDim.new(1, 0)
			Instance.new("UIStroke", progressBg).Color = Color3.fromRGB(0, 255, 150)

			local progressBar = Instance.new("Frame")
			progressBar.Size = UDim2.new(0, 0, 1, 0)
			progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
			progressBar.BorderSizePixel = 0
			progressBar.ZIndex = 13
			progressBar.Parent = progressBg
			Instance.new("UICorner", progressBar).CornerRadius = UDim.new(1, 0)

			task.spawn(function()
				for pct = 1, 100 do
					activeNotice.Text = "⚡ INITIALIZING CYBER MENU...\n[ " .. pct .. "% ]"
					progressBar.Size = UDim2.new(pct / 100, 0, 1, 0)
					task.wait(2 / 100)
				end
				
				keyFrame:Destroy()
				blurEffect:Destroy()
				
				toggleMenuBtn.Visible = true
				resetPosBtn.Visible = true
				mainFrame.Visible = true
			end)
		else
			submitKeyBtn.Text = "⚠️ VUI LÒNG CHỌN ĐÁP ÁN!"
			task.delay(1.5, function() submitKeyBtn.Text = I18N[currentLang].OkBtn end)
		end
	end
end)

resetPosBtn.MouseButton1Click:Connect(function()
	toggleMenuBtn.Position = UDim2.new(0.5, -22, 0.5, -22)
end)

local function makeDraggable(gui)
	local dragging, dragStart, startPos
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

makeDraggable(toggleMenuBtn)
makeDraggable(mainFrame)

toggleMenuBtn.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)
closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)

---------------------------------------------------------
-- 10. TÍNH NĂNG SPIN 80
---------------------------------------------------------
flingToggle.MouseButton1Click:Connect(function()
	isSpinFlingActive = not isSpinFlingActive
	flingToggle.Text = isSpinFlingActive and I18N[currentLang].ToggleOn or I18N[currentLang].ToggleOff
	flingToggle.BackgroundColor3 = isSpinFlingActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 60, 80)
end)

RunService.RenderStepped:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local hrp = char.HumanoidRootPart
		local hum = char:FindFirstChildOfClass("Humanoid")
		
		if isSpinFlingActive and hum then
			local isMoving = hum.MoveDirection.Magnitude > 0.1
			if not isMoving then
				if not spinBodyGyro then
					spinBodyGyro = Instance.new("BodyAngularVelocity")
					spinBodyGyro.MaxTorque = Vector3.new(0, math.huge, 0)
					spinBodyGyro.AngularVelocity = Vector3.new(0, 80, 0)
					spinBodyGyro.Parent = hrp
				end
			else
				if spinBodyGyro then spinBodyGyro:Destroy() spinBodyGyro = nil end
			end
		else
			if spinBodyGyro then spinBodyGyro:Destroy() spinBodyGyro = nil end
		end
	end
end)

---------------------------------------------------------
-- 11. CÁC TÍNH NĂNG KHÁC (FLY, ESP, RADAR, ANTI RUNNER, FIX LAG)
---------------------------------------------------------
escapeToggle.MouseButton1Click:Connect(function()
	isAutoEscapeActive = not isAutoEscapeActive
	escapeToggle.Text = isAutoEscapeActive and I18N[currentLang].ToggleOn or I18N[currentLang].ToggleOff
	escapeToggle.BackgroundColor3 = isAutoEscapeActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 60, 80)
end)

RunService.RenderStepped:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local hrp = char.HumanoidRootPart
		local hum = char:FindFirstChildOfClass("Humanoid")
		
		if isAutoEscapeActive and hum then
			local currentHP = hum.Health
			if lastHealth == -1 then lastHealth = currentHP end
			if currentHP < lastHealth then
				local now = tick()
				if now - lastEscapeTick > 0.4 then
					lastEscapeTick = now
					hrp.CFrame = hrp.CFrame + (hrp.CFrame.RightVector * 20)
				end
			end
			lastHealth = currentHP
		elseif hum then
			lastHealth = hum.Health
		end
	end
end)

local function stopRunnerTracer()
	if runnerConnection then runnerConnection:Disconnect() runnerConnection = nil end
	if runnerTracerBeam then runnerTracerBeam:Destroy() runnerTracerBeam = nil end
	activeRunnerTarget = nil
	local char = player.Character
	if char and char:FindFirstChildOfClass("Humanoid") then
		char:FindFirstChildOfClass("Humanoid").WalkSpeed = defaultWalkSpeed
	end
end

local function clearRunnerRows()
	for _, child in pairs(runnerContainer:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
end

local function addRunnerRow(targetPlayer)
	local isSelected = (activeRunnerTarget == targetPlayer)
	local row = Instance.new("TextButton")
	row.Size = UDim2.new(1, -6, 0, 26)
	row.BackgroundColor3 = isSelected and Color3.fromRGB(200, 100, 0) or Color3.fromRGB(22, 28, 42)
	row.Text = ""
	row.ZIndex = 2
	row.Parent = runnerContainer
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)

	local nameLbl = Instance.new("TextLabel")
	nameLbl.Size = UDim2.new(1, -10, 1, 0)
	nameLbl.Position = UDim2.new(0, 8, 0, 0)
	nameLbl.BackgroundTransparency = 1
	nameLbl.Text = (isSelected and "⚡ " or "🏃 ") .. targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")"
	nameLbl.TextColor3 = isSelected and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 255, 150)
	nameLbl.Font = Enum.Font.GothamMedium
	nameLbl.TextSize = 9
	nameLbl.TextXAlignment = Enum.TextXAlignment.Left
	nameLbl.ZIndex = 2
	nameLbl.Parent = row

	row.MouseButton1Click:Connect(function()
		if activeRunnerTarget == targetPlayer then
			stopRunnerTracer()
			row.BackgroundColor3 = Color3.fromRGB(22, 28, 42)
			nameLbl.Text = "🏃 " .. targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")"
			nameLbl.TextColor3 = Color3.fromRGB(0, 255, 150)
			return
		end

		stopRunnerTracer()
		activeRunnerTarget = targetPlayer
		row.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
		nameLbl.Text = "⚡ " .. targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")"
		nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)

		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			local hrp = char.HumanoidRootPart
			local p1 = Instance.new("Part") p1.Size = Vector3.new(0.2, 0.2, 0.2) p1.Transparency = 1 p1.Anchored = true p1.CanCollide = false p1.CFrame = hrp.CFrame p1.Parent = workspace
			local tChar = targetPlayer.Character
			local tHrp = tChar and tChar:FindFirstChild("HumanoidRootPart")
			local p2 = Instance.new("Part") p2.Size = Vector3.new(0.2, 0.2, 0.2) p2.Transparency = 1 p2.Anchored = true p2.CanCollide = false p2.CFrame = tHrp and tHrp.CFrame or hrp.CFrame p2.Parent = workspace

			local att1 = Instance.new("Attachment", p1) local att2 = Instance.new("Attachment", p2)
			local beam = Instance.new("Beam") beam.Attachment0 = att1 beam.Attachment1 = att2 beam.Color = ColorSequence.new(Color3.fromRGB(255, 100, 0)) beam.Width0 = 0.6 beam.Width1 = 0.6 beam.FaceCamera = true beam.Parent = p1
			runnerTracerBeam = p1

			runnerConnection = RunService.RenderStepped:Connect(function()
				if not activeRunnerTarget or not activeRunnerTarget.Parent then stopRunnerTracer() return end
				local myChar = player.Character
				local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
				local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
				local targetHrp = activeRunnerTarget.Character and activeRunnerTarget.Character:FindFirstChild("HumanoidRootPart")

				if targetHrp and myHrp and myHum then
					p1.CFrame = myHrp.CFrame
					p2.CFrame = targetHrp.CFrame
					local distance = (myHrp.Position - targetHrp.Position).Magnitude
					if distance > 10 then myHum.WalkSpeed = 50 else myHum.WalkSpeed = defaultWalkSpeed end
				else
					stopRunnerTracer()
				end
			end)
		end
	end)
end

task.spawn(function()
	while screenGui.Parent do
		task.wait(2)
		clearRunnerRows()
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player then addRunnerRow(p) end
		end
	end
end)

pEspToggle.MouseButton1Click:Connect(function()
	isPlayerEspActive = not isPlayerEspActive
	pEspToggle.Text = isPlayerEspActive and I18N[currentLang].ToggleOn or I18N[currentLang].ToggleOff
	pEspToggle.BackgroundColor3 = isPlayerEspActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 60, 80)
	if not isPlayerEspActive then
		for _, el in pairs(playerEspElements) do
			if el.Highlight then el.Highlight:Destroy() end
			if el.Billboard then el.Billboard:Destroy() end
		end
		playerEspElements = {}
	end
end)

RunService.RenderStepped:Connect(function()
	if isPlayerEspActive then
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				local char = p.Character
				local head = char:FindFirstChild("Head")
				local hum = char:FindFirstChildOfClass("Humanoid")
				local matchesFilter = (targetSearchName == "" or string.lower(p.Name):find(targetSearchName) or string.lower(p.DisplayName):find(targetSearchName))

				if matchesFilter then
					if not playerEspElements[p] and head then
						local hl = Instance.new("Highlight") hl.FillColor = Color3.fromRGB(0, 255, 150) hl.OutlineColor = Color3.fromRGB(255, 255, 255) hl.Adornee = char hl.Parent = char
						local bb = Instance.new("BillboardGui") bb.Adornee = head bb.Size = UDim2.new(0, 150, 0, 45) bb.StudsOffset = Vector3.new(0, 2.5, 0) bb.AlwaysOnTop = true bb.Parent = char
						local lbl = Instance.new("TextLabel") lbl.Size = UDim2.new(1, 0, 1, 0) lbl.BackgroundTransparency = 1 lbl.TextColor3 = Color3.fromRGB(0, 255, 150) lbl.Font = Enum.Font.GothamBold lbl.TextSize = 10 lbl.Parent = bb
						playerEspElements[p] = {Highlight = hl, Billboard = bb, Label = lbl}
					else
						local el = playerEspElements[p]
						if el and el.Label and hum then el.Label.Text = p.DisplayName .. "\nHP: " .. math.floor(hum.Health) end
					end
				else
					if playerEspElements[p] then
						if playerEspElements[p].Highlight then playerEspElements[p].Highlight:Destroy() end
						if playerEspElements[p].Billboard then playerEspElements[p].Billboard:Destroy() end
						playerEspElements[p] = nil
					end
				end
			end
		end
	end
end)

local function stopCurrentTracer()
	if tracerConnection then tracerConnection:Disconnect() tracerConnection = nil end
	if activeTracerBeam then activeTracerBeam:Destroy() activeTracerBeam = nil end
	activeTracerTarget = nil activeTracerPos = nil activeItemName = ""
end

local function clearRadarRows()
	for _, child in pairs(radarContainer:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
end

local function addRadarRow(itemName, dist, targetObj, targetPos)
	local translatedName = translateItemName(itemName)
	local row = Instance.new("TextButton")
	row.Size = UDim2.new(1, -6, 0, 24) row.BackgroundColor3 = Color3.fromRGB(22, 28, 42) row.Text = "" row.ZIndex = 2 row.Parent = radarContainer
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 4)

	local nameLbl = Instance.new("TextLabel")
	nameLbl.Size = UDim2.new(0.7, -6, 1, 0) nameLbl.Position = UDim2.new(0, 6, 0, 0) nameLbl.BackgroundTransparency = 1 nameLbl.Text = "📦 " .. translatedName nameLbl.TextColor3 = Color3.fromRGB(255, 215, 0) nameLbl.Font = Enum.Font.GothamMedium nameLbl.TextSize = 9 nameLbl.TextXAlignment = Enum.TextXAlignment.Left nameLbl.ZIndex = 2 nameLbl.Parent = row

	local distLbl = Instance.new("TextLabel")
	distLbl.Size = UDim2.new(0.3, -6, 1, 0) distLbl.Position = UDim2.new(0.7, 0, 0, 0) distLbl.BackgroundTransparency = 1 distLbl.Text = dist .. " studs" distLbl.TextColor3 = Color3.fromRGB(0, 255, 150) distLbl.Font = Enum.Font.GothamBold distLbl.TextSize = 9 distLbl.TextXAlignment = Enum.TextXAlignment.Right distLbl.ZIndex = 2 distLbl.Parent = row

	row.MouseButton1Click:Connect(function()
		stopCurrentTracer()
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			local hrp = char.HumanoidRootPart
			activeTracerTarget = targetObj activeTracerPos = targetPos activeItemName = translatedName

			local p1 = Instance.new("Part") p1.Size = Vector3.new(0.2, 0.2, 0.2) p1.Transparency = 1 p1.Anchored = true p1.CanCollide = false p1.CFrame = hrp.CFrame p1.Parent = workspace
			local p2 = Instance.new("Part") p2.Size = Vector3.new(0.2, 0.2, 0.2) p2.Transparency = 1 p2.Anchored = true p2.CanCollide = false p2.CFrame = CFrame.new(targetPos) p2.Parent = workspace

			local att1 = Instance.new("Attachment", p1) local att2 = Instance.new("Attachment", p2)
			local beam = Instance.new("Beam") beam.Attachment0 = att1 beam.Attachment1 = att2 beam.Color = ColorSequence.new(Color3.fromRGB(0, 255, 150)) beam.Width0 = 0.5 beam.Width1 = 0.5 beam.FaceCamera = true beam.Parent = p1
			activeTracerBeam = p1

			tracerConnection = RunService.RenderStepped:Connect(function()
				if not activeTracerBeam or not hrp or not hrp.Parent then stopCurrentTracer() return end
				p1.CFrame = hrp.CFrame
				local currentDist = (hrp.Position - activeTracerPos).Magnitude
				radarInfo.Text = I18N[currentLang].ItemTracerNav .. activeItemName .. " (" .. math.floor(currentDist) .. "m)"
				if (activeTracerTarget and not activeTracerTarget.Parent) or currentDist <= 6 then
					stopCurrentTracer()
					radarInfo.Text = I18N[currentLang].ItemArrived
				end
			end)
		end
	end)
end

local function isCharacterPart(obj)
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and obj:IsDescendantOf(p.Character) then return true end
	end
	return false
end

local function getItemPosition(obj)
	if obj:IsA("Tool") then
		local part = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.Position end
	elseif obj:IsA("Model") then
		local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
		if part then return part.Position end
	elseif obj:IsA("BasePart") then
		return obj.Position
	end
	return nil
end

local function isWorldItem(obj)
	if not obj:IsDescendantOf(workspace) or isCharacterPart(obj) then return false end
	if obj:IsA("Tool") then return true end
	if obj:IsA("Model") or obj:IsA("BasePart") then
		return obj:FindFirstChildWhichIsA("ProximityPrompt", true) ~= nil
	end
	return false
end

iEspToggle.MouseButton1Click:Connect(function()
	itemRadarActive = not itemRadarActive
	iEspToggle.Text = itemRadarActive and I18N[currentLang].ToggleOn or I18N[currentLang].ToggleOff
	iEspToggle.BackgroundColor3 = itemRadarActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 60, 80)
	if not itemRadarActive then clearRadarRows() stopCurrentTracer() radarInfo.Text = I18N[currentLang].ItemRadarInfo end
end)

task.spawn(function()
	while screenGui.Parent do
		task.wait(1.5)
		if itemRadarActive then
			clearRadarRows()
			local char = player.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp then
				local foundItems = {}
				local seen = {}
				for _, obj in ipairs(workspace:GetDescendants()) do
					if isWorldItem(obj) then
						local pos = getItemPosition(obj)
						if pos and not seen[obj] then
							local distance = (hrp.Position - pos).Magnitude
							if distance <= itemRadarRange then
								seen[obj] = true
								table.insert(foundItems, {Name = obj.Name, Distance = math.floor(distance), Position = pos, Instance = obj})
							end
						end
					end
				end
				table.sort(foundItems, function(a, b) return a.Distance < b.Distance end)
				for i = 1, math.min(#foundItems, 40) do
					addRadarRow(foundItems[i].Name, foundItems[i].Distance, foundItems[i].Instance, foundItems[i].Position)
				end
				if not activeTracerBeam then radarInfo.Text = I18N[currentLang].ItemFinding .. #foundItems .. I18N[currentLang].ItemStuds end
			end
		end
	end
end)

lagToggle.MouseButton1Click:Connect(function()
	isFixLagActive = not isFixLagActive
	lagToggle.Text = isFixLagActive and I18N[currentLang].ToggleOn or I18N[currentLang].ToggleOff
	lagToggle.BackgroundColor3 = isFixLagActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 60, 80)
	if isFixLagActive then
		for _, obj in pairs(workspace:GetDescendants()) do
			if obj:IsA("BasePart") then originalColors[obj] = obj.Color obj.Color = Color3.fromRGB(100, 100, 100) obj.Material = Enum.Material.SmoothPlastic end
		end
	else
		for obj, origColor in pairs(originalColors) do
			if obj and obj.Parent then obj.Color = origColor end
		end
		originalColors = {}
	end
end)

plusBtn.MouseButton1Click:Connect(function() flySpeed = math.clamp(flySpeed + 10, 10, 300) speedBox.Text = tostring(flySpeed) end)
minusBtn.MouseButton1Click:Connect(function() flySpeed = math.clamp(flySpeed - 10, 10, 300) speedBox.Text = tostring(flySpeed) end)

local function startFlying()
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart local hum = char:FindFirstChildOfClass("Humanoid") if not hum then return end
	hum.PlatformStand = true
	bodyVel = Instance.new("BodyVelocity") bodyVel.MaxForce = Vector3.new(1e9, 1e9, 1e9) bodyVel.Velocity = Vector3.zero bodyVel.Parent = hrp
	bodyGyro = Instance.new("BodyGyro") bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9) bodyGyro.CFrame = hrp.CFrame bodyGyro.Parent = hrp
	mobileDownBtn.Visible = true
end

local function stopFlying()
	local char = player.Character
	if char and char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid").PlatformStand = false end
	if bodyVel then bodyVel:Destroy() bodyVel = nil end
	if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
	mobileDownBtn.Visible = false moveUp = false moveDown = false
end

flyToggle.MouseButton1Click:Connect(function()
	isFlying = not isFlying
	flyToggle.Text = isFlying and I18N[currentLang].ToggleOn or I18N[currentLang].ToggleOff
	flyToggle.BackgroundColor3 = isFlying and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 60, 80)
	if isFlying then startFlying() else stopFlying() end
end)

UserInputService.JumpRequest:Connect(function() if isFlying then moveUp = true task.delay(0.2, function() moveUp = false end) end end)
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Space then moveUp = true elseif input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.E then moveDown = true end
end)
UserInputService.InputEnded:Connect(function(input, gpe)
	if input.KeyCode == Enum.KeyCode.Space then moveUp = false elseif input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.E then moveDown = false end
end)

mobileDownBtn.MouseButton1Down:Connect(function() moveDown = true end)
mobileDownBtn.MouseButton1Up:Connect(function() moveDown = false end)

RunService.RenderStepped:Connect(function()
	if isFlying and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = player.Character.HumanoidRootPart local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if bodyVel and bodyGyro then
			bodyGyro.CFrame = camera.CFrame
			local moveDir = hum and hum.MoveDirection or Vector3.zero
			local velocity = moveDir * flySpeed local verticalY = 0
			if moveUp then verticalY = flySpeed end if moveDown then verticalY = -flySpeed end
			bodyVel.Velocity = Vector3.new(velocity.X, verticalY, velocity.Z)
		end
	end
end)

player.CharacterAdded:Connect(function()
	isFlying = false stopFlying() stopCurrentTracer() stopRunnerTracer() lastHealth = -1
	flyToggle.Text = I18N[currentLang].ToggleOff flyToggle.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
end)
