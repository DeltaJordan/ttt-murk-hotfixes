local function oldCanPrimaryAttack(self)
    if self:Clip1() <= 0 then
        self:EmitSound("Weapon_Pistol.Empty")
        self:SetNextPrimaryFire(CurTime() + 0.2)
        self:Reload()
        return false
    end
    return true
end

hook.Add("PostInitPostEntity", "MURKFixGoldenDeagle", function()
    local SWEP = weapons.GetStored("weapon_ttt_powerdeagle")
    function SWEP:CanPrimaryAttack()
        local owner = self:GetOwner()
        if IsValid(owner) and (owner:GetTeam() == TEAM_JESTER or owner:GetSubRole() == ROLE_RETIRED) then
            self:EmitSound("Weapon_Pistol.Empty")
            self:SetNextPrimaryFire(CurTime() + 0.2)
            return false
        end
        return oldCanPrimaryAttack(self)
    end
end)