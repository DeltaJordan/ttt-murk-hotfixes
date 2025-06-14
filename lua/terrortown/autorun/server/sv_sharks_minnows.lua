CreateConVar("ttt2_sharks_minnows", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})
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
            ply:SetRole(ROLE_TRAITOR)
        else
            ply:SetRole(ROLE_INNOCENT)
        end
    end
end)