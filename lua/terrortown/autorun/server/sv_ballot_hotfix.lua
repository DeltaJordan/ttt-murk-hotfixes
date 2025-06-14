MapVotePools.Ballot.HandleClientBallot = function(ply)
    net.Start("MVP_MapVotePoolsBallot")
    net.Send(ply)
    return true
end