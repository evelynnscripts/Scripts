local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Evelynn Scripts",
    Icon = "door-open",
    Author = "Murder vs Sheriff Duels",
    Folder = "",
    Size = UDim2.fromOffset(500, 300),
    Transparent = true,
    Theme = "Dark",
    Resizable = false,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false
})
local Tab1 = Window:Tab({
    Title = "Mvsd Main Script",
    Icon = "sword",
    Locked = false
})
local Tab2 = Window:Tab({
    Title = "Mvsd Project Autoshoot",
    Icon = "bird",
    Locked = false
})
local Tab3 = Window:Tab({
    Title = "Mvsd Autofarm",
    Icon = "bird",
    Locked = false
})
Window:SelectTab(1)
Tab1:Paragraph({
    Title = "Main Script V10",
    Desc = "Keyless Mvsd Script made by Evelynn Scripts",
    Color = "White",
    Image = "",
    ImageSize = 0,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "check",
            Title = "Load Script",
            Callback = function()
                loadstring(game:HttpGet("https://avianhub.netlify.app/scripts/mvsd/killing.lua", true))()
                loadstring(game:HttpGet("https://avianhub.netlify.app/scripts/mvsd/v10.lua", true))()
            end
        }
    }
})
Tab2:Paragraph({
    Title = "Project Autoshoot",
    Desc = "Script based on Smart Autoshooting. Keyless",
    Color = "White",
    Image = "",
    ImageSize = 0,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "check",
            Title = "Load Script",
            Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Project-Autoshoot/main.lua", true))()
            end
        }
    }
})
Tab3:Paragraph({
    Title = "Mvsd Autofarm",
    Desc = "Autofarms Wins, Gems, Cases, Legendaries. Keyless",
    Color = "White",
    Image = "",
    ImageSize = 0,
    Thumbnail = "",
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "check",
            Title = "Load Script",
            Callback = function()
                loadstring(game:HttpGet("https://avianhub.netlify.app/scripts/mvsd/auto-win.lua", true))()
            end
        }
    }
})
