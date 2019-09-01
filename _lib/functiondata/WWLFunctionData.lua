local magicLores = {};

local function GetLoreDataForSkill(skill)
    for loreKey, loreData in pairs(magicLores) do
        if Contains(loreData.InnateSkill, skill)
        or Contains(loreData.SignatureSpell, skill)
        or Contains(loreData.Level1DefaultSpells, skill) == true
        or Contains(loreData.Level3DefaultSpells, skill) == true
        or Contains(loreData.Level1DefaultSpellsLord, skill) == true
        or Contains(loreData.Level3DefaultSpellsLord, skill) == true then
            return loreData;
        end
    end
end

local otherSpellSkills = {
    "wh_main_skill_all_magic_all_06_evasion",
    "wh_main_skill_all_magic_all_07_earthing",
    "wh_main_skill_all_magic_all_08_power_drain",
    "wh_main_skill_all_magic_all_11_arcane_conduit",
    "wh2_dlc11_skill_vmp_bloodline_necrarch_magic_greater_arcane_conduit",
};
local function GetSpellIndex(loreData, skillKey, spellType)
    if spellType == "level1" then
        for index, spellKey in pairs(loreData.Level1DefaultSpells) do
            if spellKey == skillKey then
                return index;
            end
        end
        for index, spellKey in pairs(loreData.Level1DefaultSpellsLord) do
            if spellKey == skillKey then
                return index;
            end
        end
    elseif spellType == "level3" then
        for index, spellKey in pairs(loreData.Level3DefaultSpells) do
            if spellKey == skillKey then
                return index;
            end
        end
        for index, spellKey in pairs(loreData.Level3DefaultSpellsLord) do
            if spellKey == skillKey then
                return index;
            end
        end
    elseif spellType == "other" then
        for index, spellKey in pairs(otherSpellSkills) do
            if spellKey == skillKey then
                return index;
            end
        end
    end
end

local function GetLoreDataForWizardData(wizardData)
    local baseLore = magicLores[wizardData.Lore];
    if wizardData.IsLord == true then
        return {
            InnateSkill = baseLore.InnateSkill,
            SignatureSpell = baseLore.SignatureSpell,
            Level1DefaultSpells = baseLore.Level1DefaultSpellsLord,
            Level3DefaultSpells = baseLore.Level3DefaultSpellsLord,
        };
    else
        return {
            InnateSkill = baseLore.InnateSkill,
            SignatureSpell = baseLore.SignatureSpell,
            Level1DefaultSpells = baseLore.Level1DefaultSpells,
            Level3DefaultSpells = baseLore.Level3DefaultSpells,
        };
    end
end

local function IsInnateSkill(loreData, skill)
    return Contains(loreData.InnateSkill, skill);
end

local function IsSignatureSpell(loreData, skill)
    return Contains(loreData.SignatureSpell, skill);
end

local function IsLevel1DefaultSpell(loreData, skill)
    return Contains(loreData.Level1DefaultSpells, skill);
end

local function IsLevel3DefaultSpell(loreData, skill)
    return Contains(loreData.Level3DefaultSpells, skill);
end

local defaultWizardData = {};

local function GetWizardData(wizardKey)
    return defaultWizardData[wizardKey];
end

local function Initialise(listData)
    magicLores = listData["WWLWizardLores"];
    defaultWizardData = listData["WWLAgentSubtypesGeneric"];
end

WWLFunctionData = {
        GetCharacterSkillNodeTierBehaviour = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local tierValue = row[7];
            local skillKey = row[2];
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            local loreData = GetLoreDataForWizardData(wizardData);
            if wizardData.DefaultWizardLevel == 4 then
                if IsInnateSkill(loreData, skillKey) then
                    return 1;
                elseif IsSignatureSpell(loreData, skillKey) then
                    return 2;
                elseif IsLevel1DefaultSpell(loreData, skillKey) then
                    if tonumber(tierValue) < 2 then
                        return 3;
                    else
                        return 2 + GetSpellIndex(loreData, skillKey, "level1");
                    end
                elseif IsLevel3DefaultSpell(loreData, skillKey) then
                    return 5 + GetSpellIndex(loreData, skillKey, "level3");
                elseif skillKey == "wh_main_skill_all_magic_all_11_diviner"
                and not wizardData.IsLoreMaster then
                    return 8;
                elseif skillKey == wizardData.LoremasterCharacterSkillKey then
                    return 8;
                else
                    return 8 + GetSpellIndex(loreData, skillKey, "other");
                end
            elseif wizardData.DefaultWizardLevel == 3 then
                if IsInnateSkill(loreData, skillKey) then
                    return 1;
                elseif IsSignatureSpell(loreData, skillKey) then
                    return 2;
                elseif IsLevel1DefaultSpell(loreData, skillKey) then
                    if tonumber(tierValue) < 2 then
                        return 3;
                    else
                        return 2 + GetSpellIndex(loreData, skillKey, "level1");
                    end
                elseif IsLevel3DefaultSpell(loreData, skillKey) then
                    return 5 + GetSpellIndex(loreData, skillKey, "level3");
                elseif skillKey == "wh_main_skill_all_magic_all_11_diviner"
                and not wizardData.IsLoreMaster then
                    return 8;
                else
                    return 8 + GetSpellIndex(loreData, skillKey, "other");
                end
            elseif wizardData.DefaultWizardLevel == 1
            and wizardData.MaxLevel == 4 then

            elseif wizardData.DefaultWizardLevel == 2
            and wizardData.MaxLevel == 4 then

            elseif wizardData.DefaultWizardLevel == 1 then
                if IsInnateSkill(loreData, skillKey) then
                    return 1;
                elseif IsSignatureSpell(loreData, skillKey) then
                    return 2;
                elseif IsLevel1DefaultSpell(loreData, skillKey) then
                    if tonumber(tierValue) < 2 then
                        return 3;
                    else
                        return 2 + GetSpellIndex(loreData, skillKey, "level1");
                    end
                elseif IsLevel3DefaultSpell(loreData, skillKey) then
                    return 6 + GetSpellIndex(loreData, skillKey, "level3");
                else
                    if skillKey == "wh_main_skill_all_magic_all_11_diviner" then
                        return 8 + GetSpellIndex(loreData, "wh_main_skill_all_magic_all_06_evasion", "other");
                    end
                    return 8 + GetSpellIndex(loreData, skillKey, "other");
                end
            end
        end,
        GetUpgradedWizardLevelCharacterSkillKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel == 4 then
                if not wizardData.IsLoremaster then
                    return "wh_main_skill_all_magic_all_11_diviner";
                else
                    return wizardData.LoremasterCharacterSkillKey;
                end
            end
            return "wwl_skill_wizard_level_0"..(wizardData.DefaultWizardLevel + 1);
        end,
        GetUpgradedWizardLevelTier = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel < 3 then
                return "6";
            else
                return "8";
            end
        end,
        GetCharacterSkillNodePointsOnCreationBehaviour = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local pointsOnCreationValue = row[9];
            local skillKey = row[2];
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            local loreData = GetLoreDataForWizardData(wizardData);
            if IsSignatureSpell(loreData, skillKey) then
                return "1";
            elseif wizardData.DefaultWizardLevel >= 1
            and IsLevel1DefaultSpell(loreData, skillKey) then
                return "1";
            elseif wizardData.DefaultWizardLevel >= 3
            and IsLevel3DefaultSpell(loreData, skillKey) then
                return "1";
            elseif IsInnateSkill(loreData, skillKey) then
                return "1";
            else
                return pointsOnCreationValue;
            end
        end,
        GetDefaultWizardLevelKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            return "wwl_skill_wizard_level_0"..wizardData.DefaultWizardLevel;
        end,
        GetUpgradedWizardLevelKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel == 4 then
                if not wizardData.IsLoremaster then
                    return "wwl_diviner_"..agentSubTypeKey;
                else
                    return wizardData.LoremasterCharacterNodeSkillKey;
                end
            end
            return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
        end,
        GetSpellParentLinkKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local skillKey = previousRows["STEP5"][2];
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            local loreData = GetLoreDataForWizardData(wizardData);
            if wizardData.DefaultWizardLevel == 1
            or wizardData.DefaultWizardLevel == 2 then
                if IsLevel3DefaultSpell(loreData, skillKey) then
                    return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
                elseif IsLevel1DefaultSpell(loreData, skillKey)
                or IsSignatureSpell(loreData, skillKey)
                or IsInnateSkill(loreData, skillKey)
                or skillKey == "wh_main_skill_all_magic_all_11_diviner" then
                    return "wwl_default_wizard_level_"..agentSubTypeKey;
                else
                    if skillKey == "wh_main_skill_all_magic_all_06_evasion"
                    or skillKey == "wh_main_skill_all_magic_all_07_earthing"
                    or skillKey == "wh_main_skill_all_magic_all_08_power_drain"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_8"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_9"
                    then
                        return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
                    elseif skillKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
                    or skillKey == "wh2_dlc11_skill_vmp_bloodline_necrarch_magic_greater_arcane_conduit"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                        return "wwl_character_skill_node_"..row[3];
                    end
                end
            elseif wizardData.DefaultWizardLevel == 3 then
                if IsLevel1DefaultSpell(loreData, skillKey)
                or IsLevel3DefaultSpell(loreData, skillKey)
                or IsSignatureSpell(loreData, skillKey)
                or IsInnateSkill(loreData, skillKey)
                or skillKey == "wh_main_skill_all_magic_all_11_diviner" then
                    return "wwl_default_wizard_level_"..agentSubTypeKey;
                else
                    if (skillKey == "wh_main_skill_all_magic_all_06_evasion"
                    or skillKey == "wh_main_skill_all_magic_all_07_earthing"
                    or skillKey == "wh_main_skill_all_magic_all_08_power_drain"
                    or skillKey == "wh_main_skill_all_magic_all_11_diviner"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_8"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_9")
                    then
                        return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
                    elseif skillKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
                    or skillKey == "wh2_dlc11_skill_vmp_bloodline_necrarch_magic_greater_arcane_conduit"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                        return "wwl_character_skill_node_"..row[3];
                    end
                end
            elseif wizardData.DefaultWizardLevel == 4 then
                if IsLevel1DefaultSpell(loreData, skillKey)
                or IsLevel3DefaultSpell(loreData, skillKey)
                or IsSignatureSpell(loreData, skillKey)
                or IsInnateSkill(loreData, skillKey) then
                    return "wwl_default_wizard_level_"..agentSubTypeKey;
                else
                    if (skillKey == "wh_main_skill_all_magic_all_06_evasion"
                    or skillKey == "wh_main_skill_all_magic_all_07_earthing"
                    or skillKey == "wh_main_skill_all_magic_all_08_power_drain"
                    or skillKey == "wh_main_skill_all_magic_all_11_diviner"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_8"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_9")
                    then
                        if wizardData.IsLoremaster then
                            return wizardData.LoremasterCharacterNodeSkillKey;
                        else
                            return "wwl_diviner_"..agentSubTypeKey;
                        end
                    elseif skillKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
                    or skillKey == "wh2_dlc11_skill_vmp_bloodline_necrarch_magic_greater_arcane_conduit"
                    or skillKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                        return "wwl_character_skill_node_"..row[3];
                    end
                end
            end
            return "";
        end,
        GetWizardLevelChildKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel == 4 then
                if not wizardData.IsLoremaster then
                    return "wwl_diviner_"..agentSubTypeKey;
                else
                    return wizardData.LoremasterCharacterNodeSkillKey;
                end
            end
            return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
        end,
        IsUpgradedWizardLevelParent = function(row, previousRows, previousTransformedRows, listData)
            local skillKey = previousRows["STEP5"][2];
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            local loreData = GetLoreDataForWizardData(wizardData);
            if IsLevel1DefaultSpell(loreData, skillKey)
            or IsSignatureSpell(loreData, skillKey)
            or IsInnateSkill(loreData, skillKey) then
                return true;
            else
                return false;
            end
        end,
        IsValidUpgradedWizardLevelParent = function(row, previousRows, previousTransformedRows, listData)
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel == 4
            and not wizardData.IsLoremaster then
                return false;
            end
            return true;
        end,
        IsEvasion = function(row, previousRows, previousTransformedRows, listData)
            local skillKey = previousRows["STEP5"][2];
            return skillKey == "wh_main_skill_all_magic_all_06_evasion";
        end,
        IsArcaneConduit = function(row, previousRows, previousTransformedRows, listData)
            local spellKey = previousRows["STEP3"][2];
            if spellKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
            or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                return true;
            else
                return false;
            end
        end,
        IsNotArcaneConduit = function(row, previousRows, previousTransformedRows, listData)
            local spellKey = previousRows["STEP3"][2];
            if spellKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
            or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                return false;
            else
                return true;
            end
        end,
        GetClonedCharacterSkillNodeKey = function(row, previousRows, previousTransformedRows, listData)
            return "wwl_character_skill_node_"..row[6];
        end,
        GetSkillLinkType = function(row, previousRows, previousTransformedRows, listData)
            local skillKey = previousRows["STEP5"][2];
            if skillKey == "wh_main_skill_all_magic_all_11_arcane_conduit" then
                return "SUBSET_REQUIRED";
            end
            return "REQUIRED";
        end,
        IsValidStep5Key = function(row, previousRows, previousTransformedRows, listData)
            local step5CharacterNodeKey = previousRows["STEP5"][6];
            local skillKey = previousRows["STEP5"][2];
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            local loreData = GetLoreDataForWizardData(wizardData);
            if IsSignatureSpell(loreData, skillKey) then
                return true;
            elseif step5CharacterNodeKey == row[1] then
                return true;
            end
            return false;
        end,
        ShouldUpdateVanillaSkillOnce = function(row, previousRows, previousTransformedRows, listData)
            local skillKey = row[1];
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            local loreData = GetLoreDataForWizardData(wizardData);
            local step5SkillKey = previousRows["STEP5"][2];
            if IsSignatureSpell(loreData, step5SkillKey)
            or skillKey == "wh_main_skill_all_magic_all_06_evasion" then
                return true;
            end
            return false;
        end,
        isValidSkillNode = function(row, previousRows, previousTransformedRows, listData)
            local skillKey = row[2];
            if ((string.match(skillKey,  "_lore_") and not string.match(skillKey, "_loremaster_"))
            or (skillKey ~= "wh2_main_skill_skv_generic_magic_ward"
                and skillKey ~= "wh_dlc06_skill_grn_wurrzag_grants_magic_attacks"
                and skillKey ~= "wh_main_skill_grn_wizard_unique_night_goblin_shaman_magic_mushrooms"
                and string.match(skillKey,  "_magic_")
            )) then
                return true;
            end
            return false;
        end,
        IsValidNewSkillNode = function(row, previousRows, previousTransformedRows, listData)
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel == 4
            and row[2] == "wwl_skill_wizard_level_05" then
                return false;
            end
            return true;
        end
};