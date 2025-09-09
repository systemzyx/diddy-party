local sounds = {
    {"espresso macchiato", 133101411205559},
    {"furry tik tok sound", 72075853222295},
    {"chinise song", 134713831368801},
    {"chicken dih", 132734127940213},
    {"idk what to say w", 117035648141045},
    {"krabs meme", 113460632982556},
    {"snickers meme", 87702011064488},
    {"snickers v2", 95414645600785},
    {"slave loud meme", 118240228297368},
    {"meow meow", 93196133444345},
    {"chill af music", 137155874195108},
    {"viral song", 75918642767991},
    {"neyga song", 94625860335523},
    {"alvin hitler", 105518265476544},
    {"hitler speech", 122325391756999},
    {"again idk", 127877705375546},
    {"ishoot so far", 117499468703291},
    {"quiet", 109024895932241},
    {"quiet alt", 93184625436134},
    {"funny pitch", 114730045175047},
    {"asgore new song | pitch 0.2", 133952144902631, 0.2},
    {"chipmunk beat dick | pitch 0.17", 72241143781220, 0.17},
    {"italian brainrot", 137774485302251},
    {"idk fire", 122721621515336},
    {"n word fire spam", 84013056797620},
    {"pilipinos", 7732207884},
    {"can you hear me", 4769589095},
    {"mincraft ransom", 107042626686342},
    {"funi musiek", 137925923193604},
    {"crying goblin", 82299572312177},
    {"yapping royale", 128801234616968},
    {"quagmire", 9369228943340}
}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = gethui()
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 450)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.TextColor3 = Color3.new(1,1,1)
title.Text = "Diddy Audios"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, -70)
scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #sounds * 35)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Parent = frame

local uiList = Instance.new("UIListLayout")
uiList.Parent = scrollingFrame
uiList.Padding = UDim.new(0, 4)

local currentSound

for _, data in ipairs(sounds) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansItalic
    btn.TextSize = 18
    btn.Text = data[1]
    btn.Parent = scrollingFrame

    btn.MouseButton1Click:Connect(function()
        if setclipboard then
            if data[3] then
                setclipboard(tostring(data[2]) .. " | pitch " .. tostring(data[3]))
            else
                setclipboard(tostring(data[2]))
            end
        end
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
            currentSound = nil
        end
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. data[2]
        sound.Volume = 1
        if data[3] then
            sound.PlaybackSpeed = data[3]
        end
        sound.Parent = workspace
        sound:Play()
        currentSound = sound
        sound.Ended:Connect(function()
            if sound == currentSound then
                currentSound = nil
            end
            sound:Destroy()
        end)
    end)
end

local stopBtn = Instance.new("TextButton")
stopBtn.Size = UDim2.new(1, -20, 0, 30)
stopBtn.Position = UDim2.new(0, 10, 1, -35)
stopBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
stopBtn.TextColor3 = Color3.new(1,1,1)
stopBtn.Font = Enum.Font.SourceSansItalic
stopBtn.TextSize = 18
stopBtn.Text = "Stop Audio"
stopBtn.Parent = frame

stopBtn.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Stop()
        currentSound:Destroy()
        currentSound = nil
    end
end)
