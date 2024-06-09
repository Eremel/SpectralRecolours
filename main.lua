--- STEAMODDED HEADER
--- MOD_NAME: Spectral Recolouring Shader
--- MOD_ID: SpecRec
--- PREFIX: specrec
--- MOD_AUTHOR: [Eremel_]
--- MOD_DESCRIPTION: Adds a shader to allow easy recolouring of spectral cards
--- BADGE_COLOUR: 3FC7EB
--- PRIORITY: 1

local differences = {
    0,1,0,1,
    1,1,1,1,1,
    1,0,0,0,0,
    1,1,1,0,0,
    0,1,0,0,0,
    0,0,
}

G.FUNCS.Spectral_color = function(args)
    for k,v in pairs(args) do
        sendDebugMessage(k..": "..tostring(v))
    end
    G.SETTINGS.selected_colours.Spectral = G.RECOLOR.Spectral[args.to_val]
    G:save_settings()
end

G.FUNCS.Planet_color = function(args)
    for k,v in pairs(args) do
        sendDebugMessage(k..": "..tostring(v))
    end
    G.SETTINGS.selected_colours.Planet = G.RECOLOR.Planet[args.to_val]
    G:save_settings()
end
G.FUNCS.Tarot_color = function(args)
    for k,v in pairs(args) do
        sendDebugMessage(k..": "..tostring(v))
    end
    G.SETTINGS.selected_colours.Tarot = G.RECOLOR.Tarot[args.to_val]
    G:save_settings()
end

-- SMODS.Shader({key = 'spectralRecolour', path = SMODS.current_mod.path.."/assets/shaders/spectralRecolour.fs"})
G.SHADERS['spectralRecolour'] = love.graphics.newShader(SMODS.current_mod.path.."/assets/shaders/spectralRecolour.fs")

G.RECOLOR = {}
G.RECOLOR.Tarot = {
    names = {},
    set_palette = 'Tarot_color'
}
G.RECOLOR.Planet = {
    names = {},
    set_palette = 'Planet_color'
}
G.RECOLOR.Spectral = {
    names = {},
    set_palette = 'Spectral_color'
}



function new_tarot(name, values)
    table.insert(G.RECOLOR.Tarot.names, tostring(name))
    G.RECOLOR.Tarot[name] = {
        name = name,
        order = #G.RECOLOR.Tarot.names,
        values = {}
    }
    for i=1,#values do
        G.RECOLOR.Tarot[name].values[i] = HEX(values[i])
    end
end

function new_planet(name, values)
    table.insert(G.RECOLOR.Planet.names, tostring(name))
    G.RECOLOR.Planet[name] = {
        name = name,
        order = #G.RECOLOR.Planet.names,
        values = {}
    }
    for i=1,#values do
        G.RECOLOR.Planet[name].values[i] = HEX(values[i])
    end
end

function new_spectral(name, values)
    table.insert(G.RECOLOR.Spectral.names, tostring(name))
    G.RECOLOR.Spectral[name] = {
        name = name,
        order = #G.RECOLOR.Spectral.names,
        values = {}
    }
    for i=1,#values do
        G.RECOLOR.Spectral[name].values[i] = HEX(values[i])
    end
end

new_spectral("Default", {
    "344245",    "4e5779",    "4f6367",    "918756",
    "8b8361",    "a79c67",    "c7b24a",    "dcc659",    "e8d67f",
    "5e7297",    "607192",    "637699",    "4d6ca4",    "5b7fc1",
    "638fe1",    "7fa5eb",    "7aa4f2",    "96aacb",    "d2bfd5",
    "e3bfde",    "b8d1ff",    "c0c0c0",    "dcdcdc",    "e2ebf9",
    "fdfdfd",    "ffffff"
    })

new_spectral("Green", {
    '317b17','4e7952','4f6753','918756',
    '8b8361','a79c67','c7b24a','dcc659','e8d67f',
    '5e9768','609260','639976','6ba44d','5bc164',
    '63e18f','b7eb7f','b9f27a','cbbf96','d2bfd5',
    'e3bfde','c4ffb8','c0c0c0','dcdcdc','e2ebf9',
    'fdfdfd','ffffff'
    })
    
new_spectral("Trans", {
    "344245",    "516e92",    "4f6367",    "fb6d80",
    "fb7183",    "f98899",    "f5b9a8",    "f8c4cb",    "f9d1d5",
    "5d8db5",    "607192",    "637699",    "4d6ca4",    "5b7fc1",
    "5eb5f0",    "64c4f6",    "5bcefa",    "96aacb",    "d2bfd5",
    "e3bfde",    "a1d0fe",    "c0c0c0",    "dcdcdc",    "e2ebf9",
    "fdfdfd",    "ffffff"
    })

new_planet("Default", {"4f6367","a58547","74849f","5b9baa","84c5d2","dff5fc","ffffff"})
new_planet("Purple", {"6f1688","9147a5","b64cd3","8b5baa","ba84d2","f8dffc","ffffff"})

new_tarot("Default", {"4f6367","a58547","dab772","ffe5b4","ffffff"})
new_tarot("Burnt Orange", {"611708","a34f3d","e98854","fbc4a7","ffffff"})
new_tarot("Persona 5", {"4f0a0a","2d1515","c11646","726663","b0b0b0"})

G.SETTINGS.selected_colours = {
    Tarot = G.RECOLOR.Tarot["Default"],
    Planet = G.RECOLOR.Planet["Default"],
    Spectral = G.RECOLOR.Spectral["Default"]
}