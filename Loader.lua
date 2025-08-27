local scripts = {
    [2753915549]      = "blox-fruits.lua",        -- first sea
    [4442272183]      = "blox-fruits.lua",        -- second sea
    [7449423635]      = "blox-fruits.lua",        -- third sea

    [12355337193]     = "mvsd-loader.lua",        -- normal lobby
    [13771457545]     = "mvsd-loader.lua",        -- pro lobby

    [1240123653]      = "zombie-attack.lua",      -- easy mode
    [1632210982]      = "zombie-attack.lua",      -- hard mode

    [126884695634066] = "grow-a-garden.lua",
    [83942919686609]  = "build-a-scam-empire.lua",
    [89343390950953]  = "my-singing-brainrot.lua",
    [9865958871]      = "big-paintball-2.lua",
    [17625359962]     = "rivals.lua",
    [537413528]       = "babft.lua"
}

local placeId = game.PlaceId
local v = "https://raw.githubusercontent.com/evelynnscripts/Scripts/refs/heads/main/Loader/"

local function found(id)
    return scripts[id] ~= nil
end

local function load(id)
    if not found(id) then
        game.Players.LocalPlayer:Kick("Game is not supported!")
        return
    end
    local url = v .. scripts[id]
    local ok, _ = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
end

load(placeId)
