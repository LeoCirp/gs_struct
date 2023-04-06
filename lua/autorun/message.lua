hook.Add("GS_Console", "GS Console Message Color", function(objet)
    
end)




/*
local function HeadAddons(Objet, Version)
    MsgC( Color( 255, 0, 0), "Chargement : " )
    MsgC( Color( 140, 0, 255), Objet.Addons )
    MsgC( Color( 255, 255, 255), " - Version " )
    MsgC( Color( 255, 0, 0), Version )
    MsgC( Color( 255, 255, 255), " -" )
    MsgC( Color( 255, 153, 0), " by Finnwinch!\n" )
end

local function ConfigAddonsListe()
    MsgC( Color( 68, 255, 0), "Liste de configuration :\n" )
    for parametre, valeur in pairs(objet) do
        if type(valeur) == "table" && parametre == "Version" then continue end
        
        if type(valeur) == "boolean" then
            if valeur then
                valeur = "Activer" else valeur = "Désactiver"
            end
        end
        MsgC( Color( 17, 0, 255), parametre )
        MsgC( Color( 255, 255, 255), "\t" )
        if type(valeur) == "table" then
            MsgC( Color( 255, 255, 255), "\n" )
            for k,v in pairs(valeur) do
                if type(v) == "number" then
                    v = team.GetName(v) or v
                end
                if type(k) == "number" then k = team.GetName(k); end
                if type(v) == "boolean" then v = "" end
                MsgC( Color( 255, 255, 255), "\t" )
                MsgC( Color( 17, 0, 255), k )
                MsgC( Color( 255, 255, 255), "\t" )
                MsgC( Color( 255, 0, 251), v )
                MsgC( Color( 255, 255, 255), "\n" )
            end
        else
            MsgC( Color( 255, 0, 251), valeur )
            MsgC( Color( 255, 255, 255), "\n" )
        end
    end
end

local function GetLastUpdate()
    local control = 0
    for version in pairs(objet.Version) do
        if tonumber(version) > tonumber(control) then   // need te rewrite
            control = version
        end
    end
    local last_update = tostring(control)
    return last_update
end

local function UpdateLastListe()
    local last_update = GetLastUpdate()
    MsgC( Color( 68, 255, 0), "Dernière Mise a jour :\n" )
    MsgC( Color( 255, 255, 255), objet.Version[last_update] )
    MsgC( Color( 255, 255, 255), "\n" )
end
local function ConsoleMessage(Objet)
    HeadAddons(Objet, GetLastUpdate())
    ConfigAddonsListe()
    UpdateLastListe()
    if objet.Warning then MsgC( Color( 255, 153, 0), "\n[Disclaimer]\nthis addons is designed for humorous purposes only with dark humor, please don't take it to anyone\nthank you for your understanding\nFinnwinch📎\n\n" ) end
end
hook.Add("GS_Version", "GS get last update", GetLastUpdate)
hook.Add("GS_Console", "GS Console Message Color", ConsoleMessage)
*/