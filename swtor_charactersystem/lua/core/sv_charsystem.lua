util.AddNetworkString("SWTOR.OpenCharMenu")

hook.Add("PlayerSpawn", "SWTOR.OpenChar", function(ply)
    net.Start("SWTOR.OpenCharMenu")
    net.Send(ply)
end)