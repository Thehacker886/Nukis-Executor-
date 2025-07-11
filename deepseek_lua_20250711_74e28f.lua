-- Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- Configurações
local player = Players.LocalPlayer
local guiName = "NUKIS Executor"
local savedScriptsData = "NUKIS_SavedScripts"

-- Criar a GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Mini bola para reabrir
local MiniBall = Instance.new("TextButton")
MiniBall.Name = "MiniBall"
MiniBall.Size = UDim2.new(0, 30, 0, 30)
MiniBall.Position = UDim2.new(0, 10, 0.5, -15)
MiniBall.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
MiniBall.Text = "+"
MiniBall.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniBall.Font = Enum.Font.Cartoon
MiniBall.TextSize = 20
MiniBall.Visible = false
MiniBall.Active = true
MiniBall.Draggable = true

local UICornerBall = Instance.new("UICorner")
UICornerBall.CornerRadius = UDim.new(1, 0)
UICornerBall.Parent = MiniBall

MiniBall.Parent = ScreenGui

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 300)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true

-- Arredondar bordas
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

MainFrame.Parent = ScreenGui

-- Barra de título
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NUKIS Executor"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Cartoon
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.Cartoon
CloseButton.TextSize = 16
CloseButton.Parent = TitleBar

-- Barra de opções
local OptionsBar = Instance.new("Frame")
OptionsBar.Name = "OptionsBar"
OptionsBar.Size = UDim2.new(1, 0, 0, 30)
OptionsBar.Position = UDim2.new(0, 0, 0, 30)
OptionsBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OptionsBar.BorderSizePixel = 0
OptionsBar.Parent = MainFrame

local ExecutorButton = Instance.new("TextButton")
ExecutorButton.Name = "ExecutorButton"
ExecutorButton.Size = UDim2.new(0.33, 0, 1, 0)
ExecutorButton.Position = UDim2.new(0, 0, 0, 0)
ExecutorButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ExecutorButton.BorderSizePixel = 0
ExecutorButton.Text = "Executor"
ExecutorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecutorButton.Font = Enum.Font.Cartoon
ExecutorButton.TextSize = 14
ExecutorButton.Parent = OptionsBar

local ScriptsButton = Instance.new("TextButton")
ScriptsButton.Name = "ScriptsButton"
ScriptsButton.Size = UDim2.new(0.33, 0, 1, 0)
ScriptsButton.Position = UDim2.new(0.33, 0, 0, 0)
ScriptsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ScriptsButton.BorderSizePixel = 0
ScriptsButton.Text = "Scripts"
ScriptsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptsButton.Font = Enum.Font.Cartoon
ScriptsButton.TextSize = 14
ScriptsButton.Parent = OptionsBar

local SavedButton = Instance.new("TextButton")
SavedButton.Name = "SavedButton"
SavedButton.Size = UDim2.new(0.34, 0, 1, 0)
SavedButton.Position = UDim2.new(0.66, 0, 0, 0)
SavedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SavedButton.BorderSizePixel = 0
SavedButton.Text = "Saved"
SavedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SavedButton.Font = Enum.Font.Cartoon
SavedButton.TextSize = 14
SavedButton.Parent = OptionsBar

-- Conteúdo
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -60)
ContentFrame.Position = UDim2.new(0, 0, 0, 60)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Página Executor
local ExecutorPage = Instance.new("Frame")
ExecutorPage.Name = "ExecutorPage"
ExecutorPage.Size = UDim2.new(1, 0, 1, 0)
ExecutorPage.BackgroundTransparency = 1
ExecutorPage.Visible = true
ExecutorPage.Parent = ContentFrame

local ScriptBox = Instance.new("TextBox")
ScriptBox.Name = "ScriptBox"
ScriptBox.Size = UDim2.new(1, -40, 0, 180)
ScriptBox.Position = UDim2.new(0, 20, 0, 20)
ScriptBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptBox.BorderSizePixel = 0
ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptBox.Font = Enum.Font.Code
ScriptBox.TextSize = 14
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.MultiLine = true
ScriptBox.ClearTextOnFocus = false
ScriptBox.Text = "Cole seu script aqui..."
ScriptBox.Parent = ExecutorPage

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 4)
UICorner2.Parent = ScriptBox

local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Size = UDim2.new(0, 100, 0, 30)
ExecuteButton.Position = UDim2.new(0.5, -110, 1, -40)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.Font = Enum.Font.Cartoon
ExecuteButton.TextSize = 14
ExecuteButton.Parent = ExecutorPage

local UICornerExecute = Instance.new("UICorner")
UICornerExecute.CornerRadius = UDim.new(0, 8)
UICornerExecute.Parent = ExecuteButton

local ClearButton = Instance.new("TextButton")
ClearButton.Name = "ClearButton"
ClearButton.Size = UDim2.new(0, 100, 0, 30)
ClearButton.Position = UDim2.new(0.5, 10, 1, -40)
ClearButton.BackgroundColor3 = Color3.fromRGB(215, 50, 50)
ClearButton.BorderSizePixel = 0
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.Cartoon
ClearButton.TextSize = 14
ClearButton.Parent = ExecutorPage

local UICornerClear = Instance.new("UICorner")
UICornerClear.CornerRadius = UDim.new(0, 8)
UICornerClear.Parent = ClearButton

-- Página Scripts
local ScriptsPage = Instance.new("Frame")
ScriptsPage.Name = "ScriptsPage"
ScriptsPage.Size = UDim2.new(1, 0, 1, 0)
ScriptsPage.BackgroundTransparency = 1
ScriptsPage.Visible = false
ScriptsPage.Parent = ContentFrame

local ScriptsList = Instance.new("ScrollingFrame")
ScriptsList.Name = "ScriptsList"
ScriptsList.Size = UDim2.new(1, -20, 1, -20)
ScriptsList.Position = UDim2.new(0, 10, 0, 10)
ScriptsList.BackgroundTransparency = 1
ScriptsList.ScrollBarThickness = 5
ScriptsList.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptsList.Parent = ScriptsPage

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ScriptsList

-- Página Saved
local SavedPage = Instance.new("Frame")
SavedPage.Name = "SavedPage"
SavedPage.Size = UDim2.new(1, 0, 1, 0)
SavedPage.BackgroundTransparency = 1
SavedPage.Visible = false
SavedPage.Parent = ContentFrame

local SavedScriptBox = Instance.new("TextBox")
SavedScriptBox.Name = "SavedScriptBox"
SavedScriptBox.Size = UDim2.new(1, -40, 0, 180)
SavedScriptBox.Position = UDim2.new(0, 20, 0, 20)
SavedScriptBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SavedScriptBox.BorderSizePixel = 0
SavedScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SavedScriptBox.Font = Enum.Font.Code
SavedScriptBox.TextSize = 14
SavedScriptBox.TextXAlignment = Enum.TextXAlignment.Left
SavedScriptBox.TextYAlignment = Enum.TextYAlignment.Top
SavedScriptBox.MultiLine = true
SavedScriptBox.ClearTextOnFocus = false
SavedScriptBox.Text = "Cole seu script aqui para salvar..."
SavedScriptBox.Parent = SavedPage

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 4)
UICorner3.Parent = SavedScriptBox

local ScriptNameBox = Instance.new("TextBox")
ScriptNameBox.Name = "ScriptNameBox"
ScriptNameBox.Size = UDim2.new(1, -40, 0, 30)
ScriptNameBox.Position = UDim2.new(0, 20, 0, 210)
ScriptNameBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptNameBox.BorderSizePixel = 0
ScriptNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptNameBox.Font = Enum.Font.Cartoon
ScriptNameBox.TextSize = 14
ScriptNameBox.PlaceholderText = "Nome do script"
ScriptNameBox.ClearTextOnFocus = false
ScriptNameBox.Parent = SavedPage

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 4)
UICorner4.Parent = ScriptNameBox

local SaveButton = Instance.new("TextButton")
SaveButton.Name = "SaveButton"
SaveButton.Size = UDim2.new(0, 100, 0, 30)
SaveButton.Position = UDim2.new(0.5, -50, 1, -40)
SaveButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
SaveButton.BorderSizePixel = 0
SaveButton.Text = "Save"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.Font = Enum.Font.Cartoon
SaveButton.TextSize = 14
SaveButton.Parent = SavedPage

local UICornerSave = Instance.new("UICorner")
UICornerSave.CornerRadius = UDim.new(0, 8)
UICornerSave.Parent = SaveButton

-- Variável para scripts salvos
local savedScripts = {}

-- Carregar scripts salvos
local function loadSavedScripts()
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:GetService("HttpService"):GetAsync(savedScriptsData) or {}
    end)
    
    if success then
        savedScripts = result
    else
        savedScripts = {}
    end
end

-- Salvar scripts
local function saveScriptsToDataStore()
    pcall(function()
        game:GetService("HttpService"):SetAsync(savedScriptsData, HttpService:JSONEncode(savedScripts))
    end)
end

-- Atualizar lista de scripts
local function updateScriptsList()
    -- Limpar lista
    for _, child in ipairs(ScriptsList:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    -- Adicionar scripts salvos
    for i, scriptData in ipairs(savedScripts) do
        local scriptFrame = Instance.new("Frame")
        scriptFrame.Name = "ScriptFrame_"..i
        scriptFrame.Size = UDim2.new(1, 0, 0, 80)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        scriptFrame.Parent = ScriptsList
        
        local UICornerScript = Instance.new("UICorner")
        UICornerScript.CornerRadius = UDim.new(0, 8)
        UICornerScript.Parent = scriptFrame
        
        local scriptIcon = Instance.new("ImageLabel")
        scriptIcon.Name = "Icon"
        scriptIcon.Size = UDim2.new(0, 50, 0, 50)
        scriptIcon.Position = UDim2.new(0, 10, 0, 10)
        scriptIcon.BackgroundTransparency = 1
        scriptIcon.Image = "rbxassetid://3944680095" -- Ícone de script genérico
        scriptIcon.Parent = scriptFrame
        
        local scriptName = Instance.new("TextLabel")
        scriptName.Name = "Name"
        scriptName.Size = UDim2.new(1, -70, 0, 20)
        scriptName.Position = UDim2.new(0, 70, 0, 10)
        scriptName.BackgroundTransparency = 1
        scriptName.Text = scriptData.Name
        scriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptName.Font = Enum.Font.Cartoon
        scriptName.TextSize = 14
        scriptName.TextXAlignment = Enum.TextXAlignment.Left
        scriptName.Parent = scriptFrame
        
        local executeBtn = Instance.new("TextButton")
        executeBtn.Name = "ExecuteBtn"
        executeBtn.Size = UDim2.new(0, 80, 0, 25)
        executeBtn.Position = UDim2.new(0, 70, 0, 40)
        executeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        executeBtn.Text = "Execute"
        executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        executeBtn.Font = Enum.Font.Cartoon
        executeBtn.TextSize = 12
        executeBtn.Parent = scriptFrame
        
        local UICornerExec = Instance.new("UICorner")
        UICornerExec.CornerRadius = UDim.new(0, 8)
        UICornerExec.Parent = executeBtn
        
        local deleteBtn = Instance.new("TextButton")
        deleteBtn.Name = "DeleteBtn"
        deleteBtn.Size = UDim2.new(0, 80, 0, 25)
        deleteBtn.Position = UDim2.new(1, -90, 0, 40)
        deleteBtn.BackgroundColor3 = Color3.fromRGB(215, 50, 50)
        deleteBtn.Text = "Delete"
        deleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        deleteBtn.Font = Enum.Font.Cartoon
        deleteBtn.TextSize = 12
        deleteBtn.Parent = scriptFrame
        
        local UICornerDel = Instance.new("UICorner")
        UICornerDel.CornerRadius = UDim.new(0, 8)
        UICornerDel.Parent = deleteBtn
        
        -- Eventos
        executeBtn.MouseButton1Click:Connect(function()
            ScriptBox.Text = scriptData.Script
            switchToPage("Executor")
        end)
        
        deleteBtn.MouseButton1Click:Connect(function()
            table.remove(savedScripts, i)
            saveScriptsToDataStore()
            updateScriptsList()
        end)
        
        scriptFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                ScriptBox.Text = scriptData.Script
                switchToPage("Executor")
            end
        end)
    end
    
    ScriptsList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end

-- Funções
local function switchToPage(page)
    ExecutorPage.Visible = false
    ScriptsPage.Visible = false
    SavedPage.Visible = false
    
    ExecutorButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ScriptsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SavedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    
    if page == "Executor" then
        ExecutorPage.Visible = true
        ExecutorButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    elseif page == "Scripts" then
        ScriptsPage.Visible = true
        ScriptsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        updateScriptsList()
    elseif page == "Saved" then
        SavedPage.Visible = true
        SavedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end

local function executeScript(scriptText)
    local success, errorMsg = pcall(function()
        loadstring(scriptText)()
    end)
    
    if not success then
        warn("Error executing script: " .. errorMsg)
    end
end

-- Eventos
ExecutorButton.MouseButton1Click:Connect(function()
    switchToPage("Executor")
end)

ScriptsButton.MouseButton1Click:Connect(function()
    switchToPage("Scripts")
end)

SavedButton.MouseButton1Click:Connect(function()
    switchToPage("Saved")
end)

ExecuteButton.MouseButton1Click:Connect(function()
    executeScript(ScriptBox.Text)
end)

ClearButton.MouseButton1Click:Connect(function()
    ScriptBox.Text = ""
end)

SaveButton.MouseButton1Click:Connect(function()
    local scriptText = SavedScriptBox.Text
    local scriptName = ScriptNameBox.Text
    
    if scriptText ~= "" and scriptName ~= "" then
        table.insert(savedScripts, {
            Name = scriptName,
            Script = scriptText
        })
        
        saveScriptsToDataStore()
        
        -- Mostrar mensagem de sucesso
        local message = Instance.new("TextLabel")
        message.Name = "SuccessMessage"
        message.Size = UDim2.new(1, -40, 0, 30)
        message.Position = UDim2.new(0, 20, 0, 250)
        message.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        message.Text = "Script salvo com sucesso! Vá para Scripts para vê-lo."
        message.TextColor3 = Color3.fromRGB(255, 255, 255)
        message.Font = Enum.Font.Cartoon
        message.TextSize = 12
        message.Parent = SavedPage
        
        local UICornerMsg = Instance.new("UICorner")
        UICornerMsg.CornerRadius = UDim.new(0, 4)
        UICornerMsg.Parent = message
        
        delay(3, function()
            if message and message.Parent then
                message:Destroy()
            end
        end)
        
        -- Limpar campos
        SavedScriptBox.Text = ""
        ScriptNameBox.Text = ""
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniBall.Visible = true
end)

MiniBall.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniBall.Visible = false
end)

-- Inicializar
loadSavedScripts()
switchToPage("Executor")