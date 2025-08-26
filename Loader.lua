local players = game:GetService("Players")
local player  = players.LocalPlayer
local run     = game:GetService("RunService")
local place   = tostring(game.PlaceId)
local games = {
    ["2753915549"]      = { name = "bloxfruits_sea1", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/blox-fruits.lua" },
    ["4442272183"]      = { name = "bloxfruits_sea2", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/blox-fruits-sea2.lua" },
    ["7449423635"]      = { name = "bloxfruits_sea3", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/blox-fruits-sea3.lua" },

    ["12355337193"]     = { name = "mvsd", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/mvsd-loader.lua" },
    ["13771457545"]     = { name = "mvsd_pro", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/mvsd-loader.lua" },

    ["1240123653"]      = { name = "zombieattack", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/zombie-attack.lua" },
    ["1632210982"]      = { name = "zombieattack_pro", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/zombie-attack.lua" },

    ["126884695634066"] = { name = "growagarden", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/grow-a-garden.lua" },
    ["83942919686609"]  = { name = "buildascamempire", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/build-a-scam-empire.lua" },
    ["89343390950953"]  = { name = "mysingingbrainrot", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/my-singing-brainrot.lua" },
    ["9865958871"]      = { name = "bigpaintball2", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/big-paintball-2.lua" },
    ["17625359962"]     = { name = "rivals", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/rivals.lua" },
    ["537413528"]       = { name = "buildaboatfortreasure", url = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/babft.lua" }
}
local function supported(id)
    return games[id] ~= nil
end
local function data(id)
    return games[id]
end
local function script(url)
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    if not ok then
        player:Kick("Script Failed To Load!\nPlease Report This!")
    end
end
local function not_supported()
    pcall(function()
        player:Kick("Game is not supported!")
    end)
end
local function loader()
    if supported(place) then
        local g = data(place)
        script(g.url)
    else
        not_supported()
    end
end
run.Heartbeat:Wait()
loader()
