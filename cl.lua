local menu = RageUI.CreateMenu("Character", "~d~New Character")
local heritageMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Heritage")
local featuresMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Features")
local appearanceMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Appearance")
local apparelMenu = RageUI.CreateSubMenu(menu, "Character", "~d~Apparel")

featuresMenu.EnableMouse = true
appearanceMenu.EnableMouse = true

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

for _, v in pairs(Config.Parents.Mom) do
    table.insert(mothers, v)
end
for _, v in pairs(Config.Parents.Dad) do
    table.insert(fathers, v)
end

local state = {
    Sex = RandomSex(),
    Parents = {
        Mother = math.random(#mothers),
        Father = math.random(#fathers),
        MixChar = math.random(0, 10) / 10,
        MixSkin = math.random(0, 10) / 10,
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
    state = {
        Sex = state.Sex,
        Parents = {
            Mother = -1,
            Father = -1,
            MixChar = 0,
            MixSkin = 0,
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
