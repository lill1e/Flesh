Config = {
    Models = { "mp_m_freemode_01", "mp_f_freemode_01" },
    Parents = {
        OrderDad = {
            "Benjamin",
            "Daniel",
            "Joshua",
            "Noah",
            "Andrew",
            "Joan",
            "Alex",
            "Isaac",
            "Evan",
            "Ethan",
            "Vincent",
            "Angel",
            "Diego",
            "Adrian",
            "Gabriel",
            "Michael",
            "Santiago",
            "Kevin",
            "Louis",
            "Samuel",
            "Anthony",
            "John",
            "Niko",
            "Claude"
        },
        OrderMom = {
            "Hannah",
            "Audrey",
            "Jasmine",
            "Giselle",
            "Amelia",
            "Isabella",
            "Zoe",
            "Ava",
            "Camilla",
            "Violet",
            "Sophia",
            "Eveline",
            "Nicole",
            "Ashley",
            "Grace",
            "Brianna",
            "Natalie",
            "Olivia",
            "Elizabeth",
            "Charlotte",
            "Emma",
            "Misty"
        },
        Dad = {
            Benjamin = 0,
            Daniel = 1,
            Joshua = 2,
            Noah = 3,
            Andrew = 4,
            Joan = 5,
            Alex = 6,
            Isaac = 7,
            Evan = 8,
            Ethan = 9,
            Vincent = 10,
            Angel = 11,
            Diego = 12,
            Adrian = 13,
            Gabriel = 14,
            Michael = 15,
            Santiago = 16,
            Kevin = 17,
            Louis = 18,
            Samuel = 19,
            Anthony = 20,
            John = 42,
            Niko = 43,
            Claude = 44
        },
        Mom = {
            Hannah = 21,
            Audrey = 22,
            Jasmine = 23,
            Giselle = 24,
            Amelia = 25,
            Isabella = 26,
            Zoe = 27,
            Ava = 28,
            Camilla = 29,
            Violet = 30,
            Sophia = 31,
            Eveline = 32,
            Nicole = 33,
            Ashley = 34,
            Grace = 35,
            Brianna = 36,
            Natalie = 37,
            Olivia = 38,
            Elizabeth = 39,
            Charlotte = 40,
            Emma = 41,
            Misty = 45
        }
    },
    Features = {
        -- A Feature is:
        -- feature: Number
        -- gridType: H (0) | H+V (1) | nil
        -- gridLabels: String[left, right, top?, bottom?]
        Nose = {
            gridType = 1,
            features = { 0, 1 },
            gridLabels = {}
        },
        NoseProfile = {
            gridType = 1,
            features = { 2, 3 },
            gridLabels = {}
        },
        NoseTip = {
            gridType = 1,
            features = { 4, 5 },
            gridLabels = {}
        },
        Brow = {
            gridType = 1,
            features = { 6, 7 },
            gridLabels = {}
        },
        Cheekbones = {
            gridType = 1,
            features = { 8, 9 },
            gridLabels = {}
        },
        Cheeks = {
            gridType = 0,
            features = { 10 },
            gridLabels = {}
        },
        Eyes = {
            gridType = 0,
            features = { 11 },
            gridLabels = {}
        },
        Lips = {
            gridType = 0,
            features = { 12 },
            gridLabels = {}
        },
        Jaw = {
            gridType = 1,
            features = { 13, 14 },
            gridLabels = {}
        },
        ChinProfile = {
            gridType = 1,
            features = { 15, 16 },
            gridLabels = {}
        },
        ChinShape = {
            gridType = 1,
            features = { 17, 18 },
            gridLabels = {}
        }
    },
    Overlays = {
        -- An Overlay is:
        -- overlay: Number
        -- colour: Boolean
        -- opacity: Boolean
        Blemishes = {
            overlay = 0,
            colour = false,
            opacity = true
        },
        FacialHair = {
            overlay = 1,
            colour = true,
            opacity = true
        },
        Eyebrows = {
            overlay = 2,
            colour = true,
            opacity = true
        },
        Ageing = {
            overlay = 3,
            colour = false,
            opacity = true
        },
        Makeup = {
            overlay = 4,
            colour = true,
            opacity = true
        },
        Blush = {
            overlay = 5,
            colour = false,
            opacity = true
        },
        Complexion = {
            overlay = 6,
            colour = false,
            opacity = true
        },
        SunDamage = {
            overlay = 7,
            colour = false,
            opacity = true
        },
        Lipstick = {
            overlay = 8,
            colour = true,
            opacity = true
        },
        MolesFreckles = {
            overlay = 9,
            colour = false,
            opacity = true
        },
        ChestHair = {
            overlay = 10,
            colour = false,
            opacity = false
        },
        BodyBlemishes = {
            overlay = 11,
            colour = false,
            opacity = false
        },
        AddBodyBlemishes = {
            overlay = 12,
            colour = false,
            opacity = false
        }
    },
    Components = {
        -- A Component is a Number
        -- component: Number
        Head = 0,
        Mask = 1,
        HairStyle = 2,
        Arms = 3,
        Pants = 4,
        Bags = 5,
        Shoes = 6,
        Chains = 7,
        Undershirt = 8,
        Vest = 9,
        Decals = 10,
        Overshirt = 11
    },
    Props = {
        Hats = 0,
        Glasses = 1,
        Ears = 2,
        Watches = 6,
        Bracelets = 7
    },
    Menu = {
        Features = {
            { displayName = "Brow",         type = "Features", name = "Brow" },
            { displayName = "Eyes",         type = "Features", name = "Eyes" },
            { displayName = "Nose",         type = "Features", name = "Nose" },
            { displayName = "Nose Profile", type = "Features", name = "NoseProfile" },
            { displayName = "Nose Tip",     type = "Features", name = "NoseTip" },
            { displayName = "Cheekbones",   type = "Features", name = "Cheekbones" },
            { displayName = "Cheeks",       type = "Features", name = "Cheeks" },
            { displayName = "Lips",         type = "Features", name = "Lips" },
            { displayName = "Jaw",          type = "Features", name = "Jaw" },
            { displayName = "Chin Profile", type = "Features", name = "ChinProfile" },
            { displayName = "Chin Shape",   type = "Features", name = "ChinShape" }
        },
        Appearance = {
            { displayName = "Hair",             type = "Components", name = "HairStyle" },
            { displayName = "Eyebrows",         type = "Overlays",   name = "Eyebrows" },
            { displayName = "Facial Hair",      type = "Overlays",   name = "FacialHair" },
            { displayName = "Skin Blemishes",   type = "Overlays",   name = "Blemishes" },
            { displayName = "Skin Aging",       type = "Overlays",   name = "Ageing" },
            { displayName = "Skin Complexion",  type = "Overlays",   name = "Complexion" },
            { displayName = "Moles & Freckles", type = "Overlays",   name = "MolesFreckles" },
            { displayName = "Skin Damage",      type = "Overlays",   name = "SunDamage" },
            { displayName = "Eye Color",        type = "EyeColour",  name = "" },
            { displayName = "Eye Makeup",       type = "Overlays",   name = "Makeup" },
            { displayName = "Blusher",          type = "Overlays",   name = "Blush" },
            { displayName = "Lipstick",         type = "Overlays",   name = "Lipstick" },
        },
        Apparel = {
            { displayName = "Mask",       type = "Component", name = 1 },
            { displayName = "Arms",       type = "Component", name = 3 },
            { displayName = "Pants",      type = "Component", name = 4 },
            { displayName = "Bags",       type = "Component", name = 5 },
            { displayName = "Shoes",      type = "Component", name = 6 },
            { displayName = "Chain",      type = "Component", name = 7 },
            { displayName = "Undershirt", type = "Component", name = 8 },
            { displayName = "Vest",       type = "Component", name = 9 },
            { displayName = "Overshirt",  type = "Component", name = 11 },
            { displayName = "Hat",        type = "Prop",      name = 0 },
            { displayName = "Glasses",    type = "Prop",      name = 1 },
            { displayName = "Ears",       type = "Prop",      name = 2 },
            { displayName = "Left Arm",   type = "Prop",      name = 6 },
            { displayName = "Right Arm",  type = "Prop",      name = 7 }
        }
    }
}
