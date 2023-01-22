util.AddNetworkString("SWTOR.OpenCharMenuOnSpawn")

hook.Add("PlayerInitialSpawn", "SWTOR.OpenCharMenuOnSpawn", function(ply)
    net.Start("SWTOR.OpenCharMenuOnSpawn")
    net.Send(ply)
end) 