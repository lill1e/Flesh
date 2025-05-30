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

local hairs = { {}, {} }

for k, v in pairs(Config.Hair[1]) do
    table.insert(hairs[1], v)
end

for k, v in pairs(Config.Hair[2]) do
    table.insert(hairs[2], v)
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

local colCache = {
    hairOne = 1,
    hairTwo = 1,
}

local save = {}
local state = {
    Sex = RandomSex(),
    Parents = {
        Mother = -1,
        Father = -1,
        MixChar = 0.5,
        MixSkin = 0.5,
    },
    Features = {
        [0] = 0.5,
        [1] = 0.5,
        [2] = 0.5,
        [3] = 0.5,
        [4] = 0.5,
        [5] = 0.5,
        [6] = 0.5,
        [7] = 0.5,
        [8] = 0.5,
        [9] = 0.5,
        [10] = 0.5,
        [11] = 0.5,
        [12] = 0.5,
        [13] = 0.5,
        [14] = 0.5,
        [15] = 0.5,
        [16] = 0.5,
        [17] = 0.5,
        [18] = 0.5
    },
    Overlays = {
        Blemishes = {
            overlay = 0,
            opacity = 0
        },
        FacialHair = {
            overlay = 1,
            colour = math.random(GetPedHeadOverlayNum(1) + 1) - 1,
            opacity = 0
        },
        Eyebrows = {
            overlay = 2,
            colour = math.random(GetPedHeadOverlayNum(2) + 1) - 1,
            opacity = 0
        },
        Ageing = {
            overlay = 3,
            opacity = 0
        },
        Makeup = {
            overlay = 4,
            colour = math.random(GetPedHeadOverlayNum(4) + 1) - 1,
            opacity = 0
        },
        Blush = {
            overlay = 5,
            opacity = 0
        },
        Complexion = {
            overlay = 6,
            opacity = 0
        },
        SunDamage = {
            overlay = 7
        },
        Lipstick = {
            overlay = 8,
            colour = math.random(GetPedHeadOverlayNum(8) + 1) - 1,
            opacity = 0
        },
        MolesFreckles = {
            overlay = 9,
            opacity = 0
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
    Components = {},
    Props = {},
    EyeColour = 1,
    HairColour = { GetPedHairColor(PlayerPedId()) - 1, GetPedHairHighlightColor(PlayerPedId()) - 1 }
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
            [0] = 0.5,
            [1] = 0.5,
            [2] = 0.5,
            [3] = 0.5,
            [4] = 0.5,
            [5] = 0.5,
            [6] = 0.5,
            [7] = 0.5,
            [8] = 0.5,
            [9] = 0.5,
            [10] = 0.5,
            [11] = 0.5,
            [12] = 0.5,
            [13] = 0.5,
            [14] = 0.5,
            [15] = 0.5,
            [16] = 0.5,
            [17] = 0.5,
            [18] = 0.5
        },
        Overlays = {
            Blemishes = {
                overlay = 0,
                index = math.random(GetPedHeadOverlayNum(0) + 1) - 1,
                opacity = 0
            },
            FacialHair = {
                overlay = 1,
                index = math.random(GetPedHeadOverlayNum(1) + 1) - 1,
                opacity = 0
            },
            Eyebrows = {
                overlay = 2,
                index = math.random(GetPedHeadOverlayNum(2) + 1) - 1,
                colour = 0,
                opacity = 0
            },
            Ageing = {
                overlay = 3,
                index = math.random(GetPedHeadOverlayNum(3) + 1) - 1,
                opacity = 0
            },
            Makeup = {
                overlay = 4,
                index = math.random(GetPedHeadOverlayNum(4) + 1) - 1,
                colour = 0,
                opacity = 0
            },
            Blush = {
                overlay = 5,
                index = math.random(GetPedHeadOverlayNum(5) + 1) - 1,
                opacity = 0
            },
            Complexion = {
                overlay = 6,
                index = math.random(GetPedHeadOverlayNum(6) + 1) - 1,
                opacity = 0
            },
            SunDamage = {
                overlay = 7,
                index = math.random(GetPedHeadOverlayNum(7) + 1) - 1,
            },
            Lipstick = {
                overlay = 8,
                index = math.random(GetPedHeadOverlayNum(8) + 1) - 1,
                colour = 0,
                opacity = 0
            },
            MolesFreckles = {
                overlay = 9,
                index = math.random(GetPedHeadOverlayNum(9) + 1) - 1,
                opacity = 0
            },
            ChestHair = {
                overlay = 10,
                index = math.random(GetPedHeadOverlayNum(10) + 1) - 1
            },
            BodyBlemishes = {
                overlay = 11,
                index = math.random(GetPedHeadOverlayNum(11) + 1) - 1
            },
            AddBodyBlemishes = {
                overlay = 12,
                index = math.random(GetPedHeadOverlayNum(12) + 1) - 1
            }
        },
        Components = {},
        Props = {},
        EyeColour = 1,
        HairColour = { GetPedHairColor(PlayerPedId()) - 1, GetPedHairHighlightColor(PlayerPedId()) - 1 }
    }
end

function apply()
    local model = Config.Models[state.Sex]
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    SetPedDefaultComponentVariation(PlayerPedId())
    for n, component in pairs(Config.Components) do
        if n ~= "Hair" then
            state.Components[component] = {
                GetPedDrawableVariation(PlayerPedId(), component) + 2,
                GetPedTextureVariation(PlayerPedId(), component) + 1
            }
        end
    end
    state.Components[Config.Components.HairStyle] = { 0, nil } -- TODO: set hair randomly from sex-based pool
    SetPedComponentVariation(PlayerPedId(), Config.Components.HairStyle, state.Components[Config.Components.HairStyle]
        [1], 0, 0)
    for _, prop in pairs(Config.Props) do
        state.Props[prop] = {
            GetPedPropIndex(PlayerPedId(), prop) + 2,
            GetPedPropTextureIndex(PlayerPedId(), prop) + 1
        }
    end
    for feature, featureData in pairs(Config.Features) do
        for i, featureNum in ipairs(featureData.features) do
            SetPedFaceFeature(PlayerPedId(), featureNum,
                (state.Features[featureNum] * 2 - 1) *
                ((i == 1 and featureData.inverseX or featureData.inverseY) and -1 or 1))
        end
    end
    SetPedEyeColor(PlayerPedId(), state.EyeColour)
    SetPedHairTint(PlayerPedId(), state.HairColour[1], state.HairColour[2])
    SetPedHeadBlendData(PlayerPedId(), state.Parents.Mother, state.Parents.Father, 0, state.Parents.Mother,
        state.Parents.Father, 0, state.Parents.MixChar, state.Parents.MixSkin, 0, false)
end

function TableEmpty(tbl)
    for _, _ in pairs(tbl) do
        return false
    end
    return true
end

if TableEmpty(save) or true then
    RandomizeAppearance()
else
    state = save
end

apply()

function GetFeatureValue(value, inverseHuh)
    return (value * 2 - 1) * (inverseHuh and -1 or 1)
end

function RageUI.PoolMenus:Skin()
    menu:IsVisible(function(Items)
        Items:AddList("Sex", { "Male", "Female" }, state.Sex, "", {}, function(Index, onSelected, onListChange)
            if onListChange then
                state.Sex = Index
                RandomizeAppearance()
                apply()
            end
        end)
        Items:AddButton("Heritage", "", { RightLabel = "→→→" }, function(onSelected) end, heritageMenu)
        Items:AddButton("Features", "", { RightLabel = "→→→" }, function(onSelected) end, featuresMenu)
        Items:AddButton("Appearance", "", { RightLabel = "→→→" }, function(onSelected) end, appearanceMenu)
        Items:AddButton("Apparel", "", { RightLabel = "→→→" }, function(onSelected) end, apparelMenu)
    end, function(Panels)
    end)

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

    featuresMenu:IsVisible(function(Items)
        for _, v in ipairs(Config.Menu.Features) do
            Items:AddButton(v.displayName, "Make changes to your Features", {}, function(_)

            end)
        end
    end, function(Panels)
        for i, v in ipairs(Config.Menu.Features) do
            local data = Config[v.type][v.name]
            if data.gridType == 0 then
                Panels:GridHorizontal(state[v.type][data.features[1]], Config[v.type][v.name].gridLabels[1],
                    Config[v.type][v.name].gridLabels[2], function(X, _, _, _)
                        state.Features[data.features[1]] = X
                        SetPedFaceFeature(PlayerPedId(), data.features[1],
                            (state.Features[data.features[1]] * 2 - 1) * (data.inverseX and -1 or 1))
                    end, i)
            elseif data.gridType == 1 then
                Panels:Grid(state[v.type][data.features[1]], state[v.type][data.features[2]],
                    Config[v.type][v.name].gridLabels[3], Config[v.type][v.name].gridLabels[4],
                    Config[v.type][v.name].gridLabels[1], Config[v.type][v.name].gridLabels[2],
                    function(X, Y, _, _)
                        state.Features[data.features[1]] = X
                        state.Features[data.features[2]] = Y
                        SetPedFaceFeature(PlayerPedId(), data.features[1],
                            (state.Features[data.features[1]] * 2 - 1) * (data.inverseX and -1 or 1))
                        SetPedFaceFeature(PlayerPedId(), data.features[2],
                            (state.Features[data.features[2]] * 2 - 1) * (data.inverseY and -1 or 1))
                    end, i)
            end
        end
    end)

    appearanceMenu:IsVisible(function(Items)
        for i, v in ipairs(Config.Menu.Appearance) do
            if v.type == "Component" then
                Items:AddList("Hair", Config.Hair[state.Sex], GetPedDrawableVariation(PlayerPedId(), v.name) + 1, nil, {},
                    function(Index, onSelected, onListChange)
                        if onListChange then
                            state.Components[v.name] = { Index, 0 }
                            SetPedComponentVariation(PlayerPedId(), v.name, Index - 1, 0, 0)
                        end
                    end)
            elseif v.type == "EyeColour" then
                Items:AddList("Eye Color", Config.EyeColours, GetPedEyeColor(PlayerPedId()),
                    "Make changes to your Appearance", {}, function(Index, onSelected, onListChange)
                        if onListChange then
                            state.EyeColour = Index
                            SetPedEyeColor(PlayerPedId(), state.EyeColour)
                        end
                    end)
            end
        end
    end, function(Panels)
        for i, v in ipairs(Config.Menu.Appearance) do
            if v.type == "Component" then
                Panels:ColourPanel("Hair Color", RageUI.PanelColour.HairCut, colCache.hairOne,
                    GetPedHairColor(PlayerPedId()) + 1, function(Hovered, Selected, MinimumIndex, CurrentIndex)
                        if Selected then
                            colCache.hairOne = MinimumIndex
                            state.HairColour[1] = CurrentIndex - 1
                            SetPedHairTint(PlayerPedId(), CurrentIndex - 1, state.HairColour[2])
                        end
                    end, i)
                Panels:ColourPanel("Hair Color (Highlight)", RageUI.PanelColour.HairCut, colCache.hairTwo,
                    GetPedHairHighlightColor(PlayerPedId()) + 1,
                    function(Hovered, Selected, MinimumIndex, CurrentIndex)
                        if Selected then
                            colCache.hairTwo = MinimumIndex
                            state.HairColour[2] = CurrentIndex - 1
                            SetPedHairTint(PlayerPedId(), state.HairColour[1], CurrentIndex - 1)
                        end
                    end, i)
            end
        end
    end)

    apparelMenu:IsVisible(function(Items)
        for _, value in ipairs(Config.Menu.Apparel) do
            if value.type == "Component" then
                Items:AddList(value.displayName,
                    nTable(GetNumberOfPedDrawableVariations(PlayerPedId(), value.name), true),
                    GetPedDrawableVariation(PlayerPedId(), value.name) + 2,
                    "Total: " .. GetNumberOfPedDrawableVariations(PlayerPedId(), value.name), {},
                    function(Index, onSelected, onListChange)
                        if onListChange then
                            state.Components[value.name] = { Index, 0 }
                            SetPedComponentVariation(PlayerPedId(), value.name, Index - 2, 0, 0)
                        end
                    end)
                if GetNumberOfPedTextureVariations(PlayerPedId(), value.name, GetPedDrawableVariation(PlayerPedId(), value.name)) > 1 then
                    Items:AddList(value.displayName .. " (Style)",
                        nTable(
                            GetNumberOfPedTextureVariations(PlayerPedId(), value.name,
                                GetPedDrawableVariation(PlayerPedId(), value.name)), false),
                        GetPedTextureVariation(PlayerPedId(), value.name) + 1,
                        "Total: " ..
                        GetNumberOfPedTextureVariations(PlayerPedId(), value.name,
                            GetPedDrawableVariation(PlayerPedId(), value.name)), {},
                        function(Index, onSelected, onListChange)
                            if onListChange then
                                state.Components[value.name] = { state.Components[value.name][1], Index }
                                SetPedComponentVariation(PlayerPedId(), value.name,
                                    GetPedDrawableVariation(PlayerPedId(), value.name), Index - 1, 0)
                            end
                        end)
                end
            else
                Items:AddList(value.displayName,
                    nTable(GetNumberOfPedPropDrawableVariations(PlayerPedId(), value.name), true),
                    GetPedPropIndex(PlayerPedId(), value.name) + 2,
                    "Total: " .. GetNumberOfPedPropDrawableVariations(PlayerPedId(), value.name), {},
                    function(Index, onSelected, onListChange)
                        if onListChange then
                            if Index == 1 then
                                state.Props[value.name] = { -1, 0 }
                                ClearPedProp(PlayerPedId(), value.name)
                            else
                                state.Props[value.name] = { Index, 0 }
                                SetPedPropIndex(PlayerPedId(), value.name, Index - 2, 0, true)
                            end
                        end
                    end)
                if GetNumberOfPedPropTextureVariations(PlayerPedId(), value.name, GetPedPropIndex(PlayerPedId(), value.name)) > 1 then
                    Items:AddList(value.displayName .. " (Style)",
                        nTable(
                            GetNumberOfPedPropTextureVariations(PlayerPedId(), value.name,
                                GetPedPropIndex(PlayerPedId(), value.name)), false),
                        GetPedPropTextureIndex(PlayerPedId(), value.name) + 1,
                        "Total: " ..
                        GetNumberOfPedPropTextureVariations(PlayerPedId(), value.name,
                            GetPedPropIndex(PlayerPedId(), value.name)), {},
                        function(Index, onSelected, onListChange)
                            if onListChange then
                                state.Props[value.name] = { state.Props[value.name][1], Index }
                                SetPedPropIndex(PlayerPedId(), value.name, GetPedPropIndex(PlayerPedId(), value.name),
                                    Index - 1, true)
                            end
                        end)
                end
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
