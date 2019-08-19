local magicLores = {};

local function GetLoreDataForSkill(skill)
    for loreKey, loreData in pairs(magicLores) do
        if Contains(loreData.InnateSkill, skill)
        or Contains(loreData.SignatureSpell, skill)
        or Contains(loreData.Level1DefaultSpells, skill) == true
        or Contains(loreData.Level3DefaultSpells, skill) == true then
            return loreData;
        end
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
            local spellKey = previousRows["STEP7"][3];
            local loreData = GetLoreDataForSkill(spellKey);
            -- if the lore data is nil then either we have an invalid skill
            -- or we have an innate lore skill. The innate lore skills
            -- are mapped to the character skill because they don't all
            -- have abilities
            if loreData == nil then
                spellKey = row[2];
                loreData = GetLoreDataForSkill(spellKey);
            end
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel < 3 then
                -- If we still don't have a lore then it isn't a spell
                -- and is an ability like evasion or arcane conduit
                if loreData == nil then
                    return tonumber(tierValue) + 2;
                elseif IsInnateSkill(loreData, spellKey) then
                    return tierValue;
                elseif IsSignatureSpell(loreData, spellKey) then
                    return tonumber(tierValue) + 2;
                elseif IsLevel1DefaultSpell(loreData, spellKey) then
                    return tonumber(tierValue) + 1;
                elseif IsLevel3DefaultSpell(loreData, spellKey) then
                    return tonumber(tierValue) + 2;
                else
                    return tonumber(tierValue) + 2;
                end
            else
                -- If we still don't have a lore then it isn't a spell
                -- and is an ability like evasion or arcane conduit
                if loreData == nil then
                    if spellKey == "wh_main_skill_all_magic_all_06_evasion"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5" then
                        return tonumber(tierValue) + 4;
                    else
                        return tonumber(tierValue) + 2;
                    end
                elseif IsInnateSkill(loreData, spellKey) then
                    return tierValue;
                elseif IsSignatureSpell(loreData, spellKey) then
                    return tonumber(tierValue) + 2;
                elseif IsLevel1DefaultSpell(loreData, spellKey) then
                    return tonumber(tierValue) + 1;
                elseif IsLevel3DefaultSpell(loreData, spellKey) then
                    return tonumber(tierValue);
                else
                    return tonumber(tierValue) + 2;
                end
            end
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
            local spellKey = previousRows["STEP7"][3];
            local loreData = GetLoreDataForSkill(spellKey);
            -- if the lore data is nil then either we have an invalid skill
            -- or we have an innate lore skill. The innate lore skills
            -- are mapped to the character skill because they don't all
            -- have abilities
            if loreData == nil then
                spellKey = row[2];
                loreData = GetLoreDataForSkill(spellKey);
            end
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            -- If we still don't have a lore then it isn't a spell
            if wizardData == nil
            or loreData == nil then
                return pointsOnCreationValue;
            elseif IsSignatureSpell(loreData, spellKey) then
                return "1";
            elseif wizardData.DefaultWizardLevel >= 1
            and IsLevel1DefaultSpell(loreData, spellKey) then
                return "1";
            elseif wizardData.DefaultWizardLevel >= 3
            and IsLevel3DefaultSpell(loreData, spellKey) then
                return "1";
            elseif IsInnateSkill(loreData, spellKey) then
                return "1";
            else
                return "0";
            end
        end,
        GetRequiredNumberofParentsBehaviour = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local numberOfParents = row[10];
            local spellKey = previousRows["STEP7"][3];
            local loreData = GetLoreDataForSkill(spellKey);
            -- if the lore data is nil then either we have an invalid skill
            -- or we have an innate lore skill. The innate lore skills
            -- are mapped to the character skill because they don't all
            -- have abilities
            if loreData == nil then
                spellKey = row[2];
                loreData = GetLoreDataForSkill(spellKey);
            end
            -- If we still don't have a lore then it isn't a spell
            if loreData == nil then
                if spellKey == "wh_main_skill_all_magic_all_06_evasion"
                or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5" then
                    return '0';
                else
                    return tostring(numberOfParents);
                end
            elseif IsInnateSkill(loreData, spellKey)
            or IsSignatureSpell(loreData, spellKey)
            or IsLevel1DefaultSpell(loreData, spellKey)
            then
                return '0';
            end
            return '0';
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
            return "wwl_skill_wizard_level_0"..(wizardData.DefaultWizardLevel + 1);
        end,
        GetSpellParentLinkKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local spellKey = previousRows["STEP7"][3];
            local loreData = GetLoreDataForSkill(spellKey);
            if loreData == nil then
                spellKey = previousRows["STEP5"][1];
                loreData = GetLoreDataForSkill(spellKey);
                if loreData == nil then
                    spellKey = previousRows["STEP3"][2];
                    loreData = GetLoreDataForSkill(spellKey);
                end
            end
            local agentSubTypeKey = previousRows["STEP1"][1];
            local wizardData = GetWizardData(agentSubTypeKey);
            if wizardData.DefaultWizardLevel < 3 then
                if loreData == nil then
                    if spellKey == "wh_main_skill_all_magic_all_06_evasion"
                    or spellKey == "wh_main_skill_all_magic_all_07_earthing"
                    or spellKey == "wh_main_skill_all_magic_all_08_power_drain"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_8"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_9"
                    then
                        return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
                    elseif spellKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                        return row[3];
                    end
                elseif IsLevel3DefaultSpell(loreData, spellKey) then
                    return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
                elseif IsLevel1DefaultSpell(loreData, spellKey)
                or IsSignatureSpell(loreData, spellKey)
                or IsInnateSkill(loreData, spellKey) then
                    return "wwl_default_wizard_level_"..agentSubTypeKey;
                end
            else
                if loreData == nil then
                    if spellKey == "wh_main_skill_all_magic_all_06_evasion"
                    or spellKey == "wh_main_skill_all_magic_all_07_earthing"
                    or spellKey == "wh_main_skill_all_magic_all_08_power_drain"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_8"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_9"
                    then
                        return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
                    elseif spellKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
                    or spellKey == "wh2_dlc09_skill_tmb_liche_priest_lore_10" then
                        return row[3];
                    end
                elseif IsLevel1DefaultSpell(loreData, spellKey)
                or IsLevel3DefaultSpell(loreData, spellKey)
                or IsSignatureSpell(loreData, spellKey)
                or IsInnateSkill(loreData, spellKey) then
                    return "wwl_default_wizard_level_"..agentSubTypeKey;
                end
            end
            return "";
        end,
        GetWizardLevelChildKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local agentSubTypeKey = previousRows["STEP1"][1];
            return "wwl_upgraded_wizard_level_"..agentSubTypeKey;
        end,
        GetWizardLevelParentLinkKey = function(row, previousRows, previousTransformedRows, listData)
            Initialise(listData);
            local parentKey = previousRows["STEP9"][1];
            return parentKey;
        end,
        IsUpgradedWizardLevelParent = function(row, previousRows, previousTransformedRows, listData)
            local spellKey = previousRows["STEP7"][3];
            local loreData = GetLoreDataForSkill(spellKey);
            if loreData == nil then
                spellKey = previousRows["STEP5"][1];
                loreData = GetLoreDataForSkill(spellKey);
                if loreData == nil then
                    spellKey = previousRows["STEP3"][2];
                    loreData = GetLoreDataForSkill(spellKey);
                end
            end
            if loreData == nil then
                return false;
            end
            return IsLevel1DefaultSpell(loreData, spellKey)
            or IsSignatureSpell(loreData, spellKey)
            or IsInnateSkill(loreData, spellKey);
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
        IsMatchingOrWhitelistedEffect = function(row, previousRows, previousTransformedRows, listData)
            local spellKey = previousRows["STEP5"][2];
            local abilityKey = previousRows["STEP5"][1];
            if row[1] == spellKey then
                return true;
            elseif abilityKey == "wh_main_skill_all_magic_all_07_earthing"
            or abilityKey == "wh_main_skill_all_magic_all_08_power_drain"
            or abilityKey == "wh_main_skill_all_magic_all_11_arcane_conduit"
            or abilityKey == "wh2_dlc09_skill_tmb_liche_priest_lore_5"
            or abilityKey == "wh2_dlc09_skill_tmb_liche_priest_lore_8"
            or abilityKey == "wh2_dlc09_skill_tmb_liche_priest_lore_9"
            -- These are spells which are setup differently, we use one of their effects
            -- to whitelist them
            or spellKey == "wh_dlc05_effect_magic_life_cooldown_awakening_of_the_wood"
            or spellKey == "wh2_main_effect_magic_dark_cooldown_chillwind"
            or spellKey == "wh2_main_effect_magic_high_cooldown_apotheosis"
            or spellKey == "wh_main_effect_magic_lil_waaagh_cooldown_sneaky_stabbin"
            or spellKey == "wh_main_effect_magic_lil_waaagh_cooldown_itchy_nuisance"
            or spellKey == "wh_main_effect_magic_lil_waaagh_cooldown_gorkll_fix_it" then
                return true;
            end
            return false;
        end,
};