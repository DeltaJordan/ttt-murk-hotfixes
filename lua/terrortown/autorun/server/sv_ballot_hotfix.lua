local oldCollectMaps = MapVotePools.CollectMaps
MapVotePools.CollectMaps = function(prefix, current, limit) MapVotePools.CurrentMaps = oldCollectMaps(prefix, current, limit) end
MapVotePools.Ballot.HandleClientBallot = function(ply)
    net.Start("MVP_MapVotePoolsBallot")
    net.Send(ply)
    return true
end