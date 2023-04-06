-- lua n'as pas de structure en tant que telle poo, faut la cree avec une table
local projet = {}
-- faire comprendre le lien
projet.__index = projet

function projet.new(name_of_projet)
    -- etape pour rendre la possibilite de la poo. fait la construction
    local self = setmetatable({}, projet)
    -- les attribues lier
    self.main = name_of_projet
    self.cfg = {}
    self.version = {}
    return self
end

-- dériver de la classe projet
local contribution = {}
contribution.__index = contribution
setmetatable(contribution,projet)

function contribution.new(name_of_projet,mod)
    local self = projet.new(name_of_projet) -- equivalence d'un super dans java
    setmetatable(self,contribution) -- permet de faire le lien entre le comparant et le comparer (fait l'ajout dans la construction)
    self.mod = mod
    return self
end



-- methode 1  ( setters )   projet
function projet:configurer(config_with_table_struct)
    for k,v in pairs(config_with_table_struct) do
        self.cfg[k] = v
    end
end
-- methode 2 ( setters )   projet
function projet:mise_a_jour(update_liste)
    for k,v in pairs(update_liste) do
        self.version[k] = v
    end
end
-- methode 3 ( getters )
function projet:get_main()
return self.main
end

-- methode 4 ( getters )    projet
function projet:get_config(key)
return self.cfg[key]
end
-- methode 5 ( getters )   projet
function projet:get_version(key)
return self.version[key]
end


-- application theorique
local maison_p = projet.new("maison")
maison_p:configurer({
    amount = 55,
    boolean = true,
    string = "hello everyone"
})
maison_p:mise_a_jour({
    ["1.0a"] = "Initiale Update",
    ["1.1"] = [["the litte
    big update_liste"]]
})
-- call
print(maison_p.main) 
print(maison_p.cfg.amount)
print(maison_p.version["1.0a"])


for k,v in pairs (maison_p.version) do
    print(k,v)
end

-- application de bonne pratique ( avec : getters )
print(maison_p:get_main())
print(maison_p:get_config("amount"))
print(maison_p:get_version("1.0a"))



