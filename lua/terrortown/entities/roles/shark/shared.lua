ROLE.Base = "ttt_role_base"
ROLE.index = ROLE_SHARK
function ROLE:PreInitialize()
    self.color = Color(255, 0, 75, 255)
    self.abbr = "shark"
    self.defaultTeam = TEAM_TRAITOR
    self.score.killsMultiplier = 2
    self.score.teamKillsMultiplier = -16
    self.isOmniscientRole = true
    self.notSelectable = true
end