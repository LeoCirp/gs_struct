local GSaddons = {}
GSaddons.__index = GSaddons

function depandanceGM()
    if not (file.Exists("cfg.lua","lua") || file.Exists("update.lua","lua")) then
        MsgC( Color( 255, 0, 0), "Erreur : " )
        MsgC( Color( 140, 0, 255), "Need more file (cfg or update) " )
        MsgC( Color( 0, 255, 0), self.main.."\n" )
        return 
    end
    hook.Add("PostGamemodeLoaded","buiderWait",function()
        if SERVER then
            hook.Call("GS_Console", nil, self)
        end
    end)
end

function GSaddons.new( name_of_projet )
    local self = setmetatable( {}, GSaddons )
    self.main = name_of_projet
    self.cfg = {}
    self.upt = {}
    return self
end

function GSaddons:CFG( struct_table )
    for k,v in pairs ( struct_table ) do
        self.cfg[k] = v
    end
end

function GSaddons:UPT( struct_table )
    for k,v in pairs ( struct_table ) do
        self.upt[k] = v
    end
end

function GSaddons:GetUPT()
    env = ""
    for k,v in pairs(self.upt) do 
        env = env .. tostring(k) .. " : \n\t" ..tostring(v) .. "\n"
    end
    return env
end

function GSaddons:GetSpecificUPT(Index)
    return self.upt[Index]
end

function GSaddons:GetLastUPT()
    for k in pairs(self.upt) do
        last = k
    end
    return self.upt[last]
end

function GSaddons:GetLastNumberUPT()
    for k in pairs(self.upt) do
        last = k
    end
    return last
end

function GSaddons:GetCFG()
    env = ""
    for k,v in pairs(self.cfg) do 
        env = env .. tostring(k) .. " : \n\t" ..tostring(v) .. "\n"
    end
    return env
end

function GSaddons:GetSpecificCFG(Index)
    return self.cfg[Index]
end

function GSaddons:Warning()
    self.warning = true
end


hook.Add("Constructeur Projet GS", "Create new addon", function(name)
    return GSaddons.new(name)
end)
hook.Add("Dependance GS","call force file",function()
    include("cfg.lua")
    include("update.lua")
end)
hook.Add("Dependance GM","call restrictions abour gmod",function(self)
    if not (file.Exists("cfg.lua","lua") || file.Exists("update.lua","lua")) then
        MsgC( Color( 255, 0, 0), "Erreur : " )
        MsgC( Color( 140, 0, 255), "Need more file (cfg or update) " )
        MsgC( Color( 0, 255, 0), self.main.."\n" )
        return false
    end
    return true
end)