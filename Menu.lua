-- [[ CYBER SYSTEM TERMINAL - STABLE FIX VERSION ]] --
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Xóa menu cũ nếu đang chạy kẹt
if CoreGui:FindFirstChild("CyberMenuGui") then
    CoreGui.CyberMenuGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CyberMenuGui"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Tạo khung chính chống đen màn hình
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 128)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

-- Tiêu đề Menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "⚡ CYBER SYSTEM MENU ⚡"
Title.TextColor3 = Color3.fromRGB(0, 255, 128)
Title.TextSize = 18

-- Nút Đóng (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Khung nội dung danh sách tính năng
local ContentBox = Instance.new("ScrollingFrame")
ContentBox.Parent = MainFrame
ContentBox.BackgroundTransparency = 1
ContentBox.Position = UDim2.new(0, 10, 0, 50)
ContentBox.Size = UDim2.new(1, -20, 1, -60)
ContentBox.CanvasSize = UDim2.new(0, 0, 0, 300)

-- Nút tính năng mẫu 1: Fix Lag
local FixLagBtn = Instance.new("TextButton")
FixLagBtn.Parent = ContentBox
FixLagBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
FixLagBtn.Position = UDim2.new(0, 0, 0, 10)
FixLagBtn.Size = UDim2.new(1, 0, 0, 45)
FixLagBtn.Font = Enum.Font.SourceSansBold
FixLagBtn.Text = "🚀 Fix Lag Siêu Cấp Bá Khí"
FixLagBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FixLagBtn.TextSize = 14

FixLagBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
    print("Đã tối ưu hóa đồ họa thành công!")
end)

print("Menu Cyber System đã load thành công không lỗi khung đen!")
