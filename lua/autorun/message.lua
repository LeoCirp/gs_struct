local function HeadAddons(Objet)
    MsgC( Color( 255, 0, 0), "Chargement : " )
    MsgC( Color( 140, 0, 255), Objet.main )
    MsgC( Color( 255, 255, 255), " - Version " )
    MsgC( Color( 255, 0, 0), Objet:GetLastNumberUPT() )
    MsgC( Color( 255, 255, 255), " -" )
    MsgC( Color( 255, 153, 0), " by Finnwinch!\n" )
end
local function ConfigAddonsListe(Objet)
    MsgC( Color( 68, 255, 0), "Liste de configuration :\n" )
    for parametre, valeur in pairs(Objet.cfg) do
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
local function UpdateLastListe(Objet)
    MsgC( Color( 68, 255, 0), "Dernière Mise a jour :\n" )
    MsgC( Color( 255, 255, 255), Objet:GetLastUPT() )
    MsgC( Color( 255, 255, 255), "\n" )
end

hook.Add("Message Console GS", "GS Console Message Color", function(self)
    if self.skipSV then
        HeadAddons(self)
        ConfigAddonsListe(self)
        UpdateLastListe(self)
        if self.warning then 
            MsgC( Color( 255, 153, 0), "\n[Disclaimer]\nthis addons is designed for humorous purposes only with dark humor, please don't take it to anyone\nthank you for your understanding\nFinnwinch📎\n\n" ) 
        end
    else
        if SERVER then
            HeadAddons(self)
            ConfigAddonsListe(self)
            UpdateLastListe(self)
            if self.warning then 
                MsgC( Color( 255, 153, 0), "\n[Disclaimer]\nthis addons is designed for humorous purposes only with dark humor, please don't take it to anyone\nthank you for your understanding\nFinnwinch📎\n\n" ) 
            end
        end
    end
end)