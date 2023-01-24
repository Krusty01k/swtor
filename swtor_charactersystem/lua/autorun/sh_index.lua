SWTOR = SWTOR or {}
SWTOR.CHARACTER = SWTOR.CHARACTER or {}

-- For Server files
if (SERVER) then 

    AddCSLuaFile("core/cl_charsystem.lua")
    AddCSLuaFile("sh_charsys_config.lua")

    include("core/sv_charsystem.lua")

end

-- For Client files
if (CLIENT) then
    include("core/cl_charsystem.lua")
end

-- For Shared files 
include("sh_charsys_config.lua")