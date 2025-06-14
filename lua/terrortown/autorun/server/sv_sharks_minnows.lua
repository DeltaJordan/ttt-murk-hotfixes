CreateConVar("ttt2_sharks_minnows", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
cvars.AddChangeCallback("ttt2_sharks_minnows", function(convarName, oldValue, newValue)
    if newValue == 0 then
        GetConVar("ttt2_max_melee_slots"):SetInt(1)
        GetConVar("ttt2_max_secondary_slots"):SetInt(0)
        GetConVar("ttt2_max_primary_slots"):SetInt(0)
        GetConVar("ttt2_max_nade_slots"):SetInt(0)
        GetConVar("ttt2_max_carry_slots"):SetInt(0)
        GetConVar("ttt2_max_unarmed_slots"):SetInt(1)
        GetConVar("ttt2_max_special_slots"):SetInt(0)
    else
        GetConVar("ttt2_max_melee_slots"):SetInt(1)
        GetConVar("ttt2_max_secondary_slots"):SetInt(1)
        GetConVar("ttt2_max_primary_slots"):SetInt(1)
        GetConVar("ttt2_max_nade_slots"):SetInt(1)
        GetConVar("ttt2_max_carry_slots"):SetInt(1)
        GetConVar("ttt2_max_unarmed_slots"):SetInt(1)
        GetConVar("ttt2_max_special_slots"):SetInt(2)
    end
end)

hook.Add("TTT2ModifyFinalRoles", "MURKSharksMinnows", function(finalRoles)
    if not GetConVar("ttt2_sharks_minnows"):GetBool() then return end
    local traitor_roles = {}
    local troles = roles.GetByIndex(ROLE_TRAITOR):GetSubRoles()
    for _, role in ipairs(troles) do
        table.insert(traitor_roles, role.index)
    end

    local IsTraitor = function(roleIndex) return table.HasValue(traitor_roles, roleIndex) end
    local players = player.GetAll()
    table.Shuffle(players)
    for _, ply in pairs(players) do
        if IsTraitor(finalRoles[ply]) or finalRoles[ply] == ROLE_SERIALKILLER or finalRoles[ply] == ROLE_INFECTED then
            finalRoles[ply] = ROLE_SHARK
        else
            finalRoles[ply] = ROLE_MINNOW
        end
    end
end)

hook.Add("TTTBeginRound", "MURK_SMRemoveCrowbar", function()
    GetConVar("ttt2_max_melee_slots"):SetInt(0)
    for _, ply in pairs(player.GetAll()) do
        if ply:GetSubRole() == ROLE_MINNOW then ply:RemoveEquipmentWeapon("weapon_zm_improvised") end
    end
end)

hook.Add("TTTEndRound", "MURK_SMResetLoadout", function() GetConVar("ttt2_max_melee_slots"):SetInt(1) end)