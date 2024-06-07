--- STEAMODDED HEADER
--- MOD_NAME: Spectral Recolouring Shader
--- MOD_ID: SpecRec
--- PREFIX: specrec
--- MOD_AUTHOR: [Eremel_]
--- MOD_DESCRIPTION: Adds a shader to allow easy recolouring of spectral cards
--- BADGE_COLOUR: 3FC7EB

G.base_spectral = {
    "344245",    "4e5779",    "4f6367",    "918756",
    "8b8361",    "a79c67",    "c7b24a",    "dcc659",    "e8d67f",
    "5e7297",    "607192",    "637699",    "4d6ca4",    "5b7fc1",
    "638fe1",    "7fa5eb",    "7aa4f2",    "96aacb",    "d2bfd5",
    "e3bfde",    "b8d1ff",    "c0c0c0",    "dcdcdc",    "e2ebf9",
    "fdfdfd",    "ffffff"
}

local test_colour = { 
'317b17','4e7952','4f6753','918756',
'8b8361','a79c67','c7b24a','dcc659','e8d67f',
'5e9768','609260','639976','6ba44d','5bc164',
'63e18f','b7eb7f','b9f27a','cbbf96','d2bfd5',
'e3bfde','c4ffb8','c0c0c0','dcdcdc','e2ebf9',
'fdfdfd','ffffff','4e7952'
}

-- Use this framework to add your hex values
local colour_template = {
    "",    "",    "",    "",
    "",    "",    "",    "",    "",
    "",    "",    "",    "",    "",
    "",    "",    "",    "",    "",
    "",    "",    "",    "",    "",
    "",    ""
}

-- set this value to be the colour you want to use for spectral cards
G.selected_spectral_colour = test_colour


-- SMODS.Shader({key = 'spectralRecolour', path = SMODS.current_mod.path.."/assets/shaders/spectralRecolour.fs"})
G.SHADERS['spectralRecolour'] = love.graphics.newShader(SMODS.current_mod.path.."/assets/shaders/spectralRecolour.fs")