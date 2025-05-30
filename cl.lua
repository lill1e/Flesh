local menu = RageUI.CreateMenu("Character", "~d~New Character")
local heritageMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Heritage")
local featuresMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Features")
local appearanceMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Appearance")
local apparelMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Apparel")

featuresMenu:ToggleMouse()
appearanceMenu:ToggleMouse()

--[
-- Feature ::= { [-1, 1] }
-- Overlay ::= { Number, [0.0, 1.0]?, Colour? }
-- Component ::= { Drawable, Texture }
-- Prop ::= { Drawable, Texture }
--]
function RandomSex()
    return math.random(2)
end

function RandomFeature()
    return (math.random(0, 20) - 10) / 10
end

local nTbl = {}
local noneTbl = {}

function nTable(n, none)
    if nTbl[n] then return (none and noneTbl[n] or nTbl[n]) end
    local t = (none and { "None" } or {})
    for i = 0, n - 1 do
        table.insert(t, i)
    end
    nTbl[n] = t
    return t
end

local mothers = {}
local fathers = {}
local mothersRev = {}
local fathersRev = {}
local heritageMother = {}
local heritageFather = {}

for k, _ in pairs(Config.Parents.Mom) do
    table.insert(mothers, k)
end
for k, _ in pairs(Config.Parents.Dad) do
    table.insert(fathers, k)
end
for i, v in ipairs(mothers) do
    mothersRev[v] = i
end
for i, v in ipairs(fathers) do
    fathersRev[v] = i
end
for i, v in ipairs(Config.Parents.OrderMom) do
    heritageMother[v] = i
end
for i, v in ipairs(Config.Parents.OrderDad) do
    heritageFather[v] = i
end

local state = {
    Sex = RandomSex(),
    Parents = {
        Mother = -1,
        Father = -1,
        MixChar = 0.5,
        MixSkin = 0.5,
    },
    Features = {
        [0] = (math.random(0, 20) - 10) / 10,
        [1] = (math.random(0, 20) - 10) / 10,
        [2] = (math.random(0, 20) - 10) / 10,
        [3] = (math.random(0, 20) - 10) / 10,
        [4] = (math.random(0, 20) - 10) / 10,
        [5] = (math.random(0, 20) - 10) / 10,
        [6] = (math.random(0, 20) - 10) / 10,
        [7] = (math.random(0, 20) - 10) / 10,
        [8] = (math.random(0, 20) - 10) / 10,
        [9] = (math.random(0, 20) - 10) / 10,
        [10] = (math.random(0, 20) - 10) / 10,
        [11] = (math.random(0, 20) - 10) / 10,
        [12] = (math.random(0, 20) - 10) / 10,
        [13] = (math.random(0, 20) - 10) / 10,
        [14] = (math.random(0, 20) - 10) / 10,
        [15] = (math.random(0, 20) - 10) / 10,
        [16] = (math.random(0, 20) - 10) / 10,
        [17] = (math.random(0, 20) - 10) / 10,
        [18] = (math.random(0, 20) - 10) / 10
    },
    Overlays = {
        Blemishes = {
            overlay = 0,
            opacity = math.random(0, 10) / 10
        },
        FacialHair = {
            overlay = 1,
            colour = math.random(GetPedHeadOverlayNum(1) + 1) - 1,
            opacity = math.random(0, 10) / 10
        },
        Eyebrows = {
            overlay = 2,
            colour = math.random(GetPedHeadOverlayNum(2) + 1) - 1,
            opacity = math.random(0, 10) / 10
        },
        Ageing = {
            overlay = 3,
            opacity = math.random(0, 10) / 10
        },
        Makeup = {
            overlay = 4,
            colour = math.random(GetPedHeadOverlayNum(4) + 1) - 1,
            opacity = math.random(0, 10) / 10
        },
        Blush = {
            overlay = 5,
            opacity = math.random(0, 10) / 10
        },
        Complexion = {
            overlay = 6,
            opacity = math.random(0, 10) / 10
        },
        SunDamage = {
            overlay = 7
        },
        Lipstick = {
            overlay = 8,
            colour = math.random(GetPedHeadOverlayNum(8) + 1) - 1,
            opacity = math.random(0, 10) / 10
        },
        MolesFreckles = {
            overlay = 9,
            opacity = math.random(0, 10) / 10
        },
        ChestHair = {
            overlay = 10
        },
        BodyBlemishes = {
            overlay = 11
        },
        AddBodyBlemishes = {
            overlay = 12
        }
    },
    Components = {
        Head = { 0, 0 },
        Mask = { 0, 0 },
    },
    Props = {}
}

function RandomizeAppearance()
    local mom = mothers[math.random(#mothers)]
    local dad = fathers[math.random(#fathers)]
    state = {
        Sex = state.Sex,
        Parents = {
            Mother = Config.Parents.Mom[mom],
            MotherIndex = mothersRev[mom],
            Father = Config.Parents.Dad[dad],
            FatherIndex = fathersRev[dad],
            MixChar = math.random(0, 10) / 10,
            MixSkin = math.random(0, 10) / 10,
        },
        Features = {
            [0] = (math.random(0, 10) - 1) / 10,
            [1] = (math.random(0, 10) - 1) / 10,
            [2] = (math.random(0, 10) - 1) / 10,
            [3] = (math.random(0, 10) - 1) / 10,
            [4] = (math.random(0, 10) - 1) / 10,
            [5] = (math.random(0, 10) - 1) / 10,
            [6] = (math.random(0, 10) - 1) / 10,
            [7] = (math.random(0, 10) - 1) / 10,
            [8] = (math.random(0, 10) - 1) / 10,
            [9] = (math.random(0, 10) - 1) / 10,
            [10] = (math.random(0, 10) - 1) / 10,
            [11] = (math.random(0, 10) - 1) / 10,
            [12] = (math.random(0, 10) - 1) / 10,
            [13] = (math.random(0, 10) - 1) / 10,
            [14] = (math.random(0, 10) - 1) / 10,
            [15] = (math.random(0, 10) - 1) / 10,
            [16] = (math.random(0, 10) - 1) / 10,
            [17] = (math.random(0, 10) - 1) / 10,
            [18] = (math.random(0, 10) - 1) / 10
        },
        Overlays = {
            Blemishes = {
                overlay = 0,
                opacity = math.random(0, 10) / 10
            },
            FacialHair = {
                overlay = 1,
                colour = math.random(GetPedHeadOverlayNum(1) + 1) - 1,
                opacity = math.random(0, 10) / 10
            },
            Eyebrows = {
                overlay = 2,
                colour = math.random(GetPedHeadOverlayNum(2) + 1) - 1,
                opacity = math.random(0, 10) / 10
            },
            Ageing = {
                overlay = 3,
                opacity = math.random(0, 10) / 10
            },
            Makeup = {
                overlay = 4,
                colour = math.random(GetPedHeadOverlayNum(4) + 1) - 1,
                opacity = math.random(0, 10) / 10
            },
            Blush = {
                overlay = 5,
                opacity = math.random(0, 10) / 10
            },
            Complexion = {
                overlay = 6,
                opacity = math.random(0, 10) / 10
            },
            SunDamage = {
                overlay = 7
            },
            Lipstick = {
                overlay = 8,
                colour = math.random(GetPedHeadOverlayNum(8) + 1) - 1,
                opacity = math.random(0, 10) / 10
            },
            MolesFreckles = {
                overlay = 9,
                opacity = math.random(0, 10) / 10
            },
            ChestHair = {
                overlay = 10
            },
            BodyBlemishes = {
                overlay = 11
            },
            AddBodyBlemishes = {
                overlay = 12
            }
        },
        Components = {
            Head = { 0, 0 },
            Mask = { 0, 0 },
        },
        Props = {}
    }
end

function GetFeatureValue(value, inverseHuh)
    return (value * 2 - 1) * (inverseHuh and -1 or 1)
end

function RageUI.PoolMenus:Skin()
    menu:IsVisible(function(Items)
        Items:AddList("Sex", { "Male", "Female" }, state.Sex, "", {}, function(Index, onSelected, onListChange)
            if onListChange then
                state.Sex = Index
                local model = Config.Models[state.Sex]
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
                SetPedDefaultComponentVariation(PlayerPedId())

                -- change model
            end
        end)
        Items:AddButton("Heritage", "", { RightLabel = "→→→" }, function(onSelected) end, heritageMenu)
        Items:AddButton("Features", "", { RightLabel = "→→→" }, function(onSelected) end, featuresMenu)
        Items:AddButton("Appearance", "", { RightLabel = "→→→" }, function(onSelected) end, appearanceMenu)
        Items:AddButton("Apparel", "", { RightLabel = "→→→" }, function(onSelected) end, apparelMenu)
    end, function(Panels)

    heritageMenu:IsVisible(function(Items)
        Items:Heritage(heritageMother[mothers[state.Parents.MotherIndex]] - 1, heritageFather
            [fathers[state.Parents.FatherIndex]] - 1)
        Items:AddList("Mom", mothers, state.Parents.MotherIndex, "Select your Mom", {},
            function(Index, onSelected, onListChange)
                if onListChange then
                    state.Parents.MotherIndex = Index
                    state.Parents.Mother = Config.Parents.Mom[mothers[state.Parents.MotherIndex]]
                    SetPedHeadBlendData(PlayerPedId(), state.Parents.Mother, state.Parents.Father, 0,
                        state.Parents.Mother,
                        state.Parents.Father, 0, state.Parents.MixChar, state.Parents.MixSkin, 0, false)
                end
            end)
        Items:AddList("Dad", fathers, state.Parents.FatherIndex, "Select your Dad", {},
            function(Index, onSelected, onListChange)
                if onListChange then
                    state.Parents.FatherIndex = Index
                    state.Parents.Father = Config.Parents.Dad[fathers[state.Parents.FatherIndex]]
                    SetPedHeadBlendData(PlayerPedId(), state.Parents.Mother, state.Parents.Father, 0,
                        state.Parents.Mother,
                        state.Parents.Father, 0, state.Parents.MixChar, state.Parents.MixSkin, 0, false)
                end
            end)
        Items:HeritageSlider("Resemblance", state.Parents.MixChar * 10,
            "Select if your features are influenced more by your Mother or Father",
            function(Index, onSelected, onListChange)
                if onListChange then
                    state.Parents.MixChar = Index / 10
                    SetPedHeadBlendData(PlayerPedId(), state.Parents.Mother, state.Parents.Father, 0,
                        state.Parents.Mother,
                        state.Parents.Father, 0, state.Parents.MixChar, state.Parents.MixSkin, 0, false)
                end
            end)
        Items:HeritageSlider("Skin Tone", state.Parents.MixSkin * 10,
            "Select if your skin tone is influenced more by your Mother or Father",
            function(Index, onSelected, onListChange)
                if onListChange then
                    state.Parents.MixSkin = Index / 10
                    SetPedHeadBlendData(PlayerPedId(), state.Parents.Mother, state.Parents.Father, 0,
                        state.Parents.Mother,
                        state.Parents.Father, 0, state.Parents.MixChar, state.Parents.MixSkin, 0, false)
                end
            end)
    end, function(Panels)
    end)
    end)

    apparelMenu:IsVisible(function(Items)
        for _, value in ipairs(Config.Menu.Apparel) do
            if value.type == "Component" then
                Items:AddList(value.displayName, nTable(GetNumberOfPedDrawableVariations(PlayerPedId(), value.name)),
                    GetPedDrawableVariation(PlayerPedId(), value.name),
                    "Total: " .. GetNumberOfPedDrawableVariations(PlayerPedId(), value.name), {},
                    function(Index, onSelected, onListChange)
                        if onListChange then
                            SetPedComponentVariation(PlayerPedId(), value.name, Index - 2, 0, 0)
                        end
                    end)
            else
                Items:AddList(value.displayName, nTable(GetNumberOfPedPropDrawableVariations(PlayerPedId(), value.name)),
                    GetPedPropIndex(PlayerPedId(), value.name),
                    "Total: " .. GetNumberOfPedPropDrawableVariations(PlayerPedId(), value.name), {},
                    function(Index, onSelected, onListChange)
                        if onListChange then
                            SetPedPropIndex(PlayerPedId(), value.name, Index - 2, 0, true)
                        end
                    end)
            end
        end
    end, function(Panels)

    end)
end

RegisterCommand("dump", function()
    print(json.encode(state))
end, false)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 11) then
            RageUI.Visible(menu, not RageUI.Visible(menu))
        end
    end
end)
