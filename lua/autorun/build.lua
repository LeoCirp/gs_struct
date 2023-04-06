/*
    --@ Implémentation
*/
local Projet = {} ; Projet.__index = Projet
function Projet.new(name)
    local self = setmetatable({}, Projet)
    self.Addons = name

    function self:cfg(config)
        for k, v in pairs(config) do
            self.k = v
        end
    end

    if not (file.Exists("cfg.lua","lua") || file.Exists("update.lua","lua")) then
        MsgC( Color( 255, 0, 0), "Erreur : " )
        MsgC( Color( 140, 0, 255), "Need more file (cfg or update) " )
        MsgC( Color( 0, 255, 0), self.Addons.."\n" )
        return 
    end

    hook.Add("PostGamemodeLoaded","buiderWait",function()
        include("cfg.lua")
        AddCSLuaFile("cfg.lua")
        include("update.lua")
        AddCSLuaFile("update.lua")
        if SERVER then
            hook.Call("GS_Console", nil, self)
        end
    end)

    return self
end
hook.Add("GS_Projet", "Create new addon", function(name)
    return Projet.new(name)
end)