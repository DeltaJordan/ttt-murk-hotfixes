ROLE.Base = "ttt_role_base"
ROLE.index = ROLE_MINNOW
function ROLE:PreInitialize()
    self.color = Color(0, 255, 255, 255)
    self.abbr = "minnow"
    self.defaultTeam = TEAM_INNOCENT
    self.score.killsMultiplier = 0
    self.score.teamKillsMultiplier = 0
    self.unknownTeam = true
end

if SERVER then
    hook.Add("PlayerTakeDamage", "MinnowNoDamage", function(ply, inflictor, attacker, amount, dmginfo)
        if not IsValid(ply) or not IsValid(attacker) then return end
        if SpecDM and (ply.IsGhost and ply:IsGhost() or (attacker.IsGhost and attacker:IsGhost())) then return end
        if attacker:IsPlayer() and attacker:GetSubRole() == ROLE_MINNOW then
            print("Blocking " .. ROLE_MINNOW .. " damaging others")
            dmginfo:ScaleDamage(0)
            dmginfo:SetDamage(0)
        end
    end)
end