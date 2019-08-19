-- Note: We also use this in the function data file to define custom behaviour
WWLWizardLores = {
    -- Battle Lores
    Beasts = {
        InnateSkill = {"wh_dlc03_skill_magic_beasts_wild_heart",},
        SignatureSpell = {"wh_dlc03_spell_beasts_wyssans_wildform", "wh_dlc03_skill_magic_beasts_dummy_wyssans_wildform"},
        Level1DefaultSpells = {"wh_dlc03_spell_beasts_flock_of_doom", "wh2_main_skill_magic_beasts_flock_of_doom_lord", "wh_dlc03_spell_beasts_panns_impenetrable_pelt", "wh2_main_skill_magic_beasts_panns_impenetrable_pelt_lord", "wh_dlc03_spell_beasts_the_amber_spear", "wh2_main_skill_magic_beasts_the_amber_spear_lord",},
        Level3DefaultSpells = {"wh_dlc03_spell_beasts_the_curse_of_anraheir", "wh2_main_skill_magic_beasts_the_curse_of_anraheir_lord", "wh_dlc03_spell_beasts_transformation_of_kadon", "wh2_main_skill_magic_beasts_transformation_of_kadon_lord",},    },
    Death = {
        InnateSkill = {"wh_main_skill_all_magic_death_03_life_leeching",},
        SignatureSpell = {"wh_main_spell_death_spirit_leech", },
        Level1DefaultSpells = {"wh_main_spell_death_aspect_of_the_dreadknight", "wh_main_spell_death_doom_and_darkness", "wh_main_spell_death_soulblight"},
        Level3DefaultSpells = {"wh_main_spell_death_the_fate_of_bjuna", "wh_main_spell_death_the_purple_sun_of_xereus"},
    },
    Fire = {
        InnateSkill = {"wh_main_skill_all_magic_fire_04_kindleflame",},
        SignatureSpell = {"wh_main_spell_fire_fireball",},
        Level1DefaultSpells = {"wh_main_spell_fire_the_burning_head", "wh_main_spell_fire_flaming_sword_of_rhuin", "wh_main_spell_fire_cascading_fire_cloak"},
        Level3DefaultSpells = {"wh_main_spell_fire_flame_storm", "wh_main_spell_fire_piercing_bolts_of_burning"},
    },
    Heavens = {
        InnateSkill = {"wh_main_skill_all_magic_heavens_03_rolling_skies",},
        SignatureSpell = {"wh_main_spell_heavens_harmonic_convergence",},
        Level1DefaultSpells = {"wh_main_spell_heavens_wind_blast", "wh_main_spell_heavens_curse_of_the_midnight_wind", "wh_main_spell_heavens_urannons_thunderbolt"},
        Level3DefaultSpells = {"wh_main_spell_heavens_comet_of_casandora", "wh_main_spell_heavens_chain_lightning",},
    },
    Life = {
        InnateSkill = {"wh_dlc05_lore_passive_life_bloom",},
        SignatureSpell = {"wh_dlc05_spell_life_awakening_of_the_wood", "wh_dlc05_skill_magic_life_wizard_awakening_of_the_wood", },
        Level1DefaultSpells = {"wh_dlc05_spell_life_earth_blood", "wh_dlc05_spell_life_shield_of_thorns", "wh_dlc05_spell_life_flesh_to_stone"},
        Level3DefaultSpells = {"wh_dlc05_spell_life_regrowth", "wh_dlc05_spell_life_the_dwellers_below"},
    },
    Light = {
        InnateSkill = {"wh_main_skill_all_magic_light_03_exorcism",},
        SignatureSpell = {"wh_main_spell_light_shems_burning_gaze",},
        Level1DefaultSpells = {"wh_main_spell_light_phas_protection", "wh_main_spell_light_net_of_amyntok", "wh_main_spell_light_light_of_battle"},
        Level3DefaultSpells = {"wh_main_spell_light_bironas_timewarp", "wh_main_spell_light_banishment"},
    },
    Metal = {
        InnateSkill = {"wh_main_skill_all_magic_metal_03_metalshifting",},
        SignatureSpell = {"wh_main_spell_metal_searing_doom",},
        Level1DefaultSpells = {"wh_main_spell_metal_transmutation_of_lead", "wh_main_spell_metal_glittering_robe", "wh_main_spell_metal_plague_of_rust"},
        Level3DefaultSpells = {"wh_main_spell_metal_final_transmutation", "wh_main_spell_metal_gehennas_golden_hounds"},
    },
    Shadows = {
        InnateSkill = {"wh_dlc05_skill_magic_shadow_smoke_and_mirrors", },
        SignatureSpell = {"wh_dlc05_spell_shadow_melkoths_mystifying_miasma",},
        Level1DefaultSpells = {"wh_dlc05_spell_shadow_the_penumbral_pendulum", "wh_dlc05_spell_shadow_the_enfeebling_foe", "wh_dlc05_spell_shadow_the_withering"},
        Level3DefaultSpells = {"wh_dlc05_spell_shadow_pit_of_shades", "wh_dlc05_spell_shadow_okkams_mindrazor"},
    },
    -- Unique lores
    Vampires = {
        InnateSkill = {"wh_main_skill_vmp_magic_vampires_03_the_curse_of_undeath",},
        SignatureSpell = {"wh_main_spell_vampires_invocation_of_nehek", },
        Level1DefaultSpells = {"wh_main_spell_vampires_gaze_of_nagash", "wh_main_spell_vampires_raise_dead", "wh_main_spell_vampires_vanhels_danse_macabre"},
        Level3DefaultSpells = {"wh_main_spell_vampires_curse_of_years", "wh_main_spell_vampires_wind_of_death"},
    },
    High = {
        InnateSkill = {"wh2_main_skill_all_magic_high_03_lore_attribute",},
        SignatureSpell = {"wh2_main_spell_high_magic_apotheosis", "wh2_main_skill_all_magic_high_02_apotheosis",},
        Level1DefaultSpells = {"wh2_main_spell_high_magic_hand_of_glory", "wh2_main_spell_high_magic_soul_quench", "wh2_main_spell_high_magic_tempest"},
        Level3DefaultSpells = {"wh2_main_spell_high_magic_arcane_unforging", "wh2_main_spell_high_magic_fiery_convocation"},
    },
    Dark = {
        InnateSkill = {"wh2_main_skill_magic_dark_lore_attribute",},
        SignatureSpell = {"wh2_main_spell_dark_magic_chillwind", "wh2_main_skill_magic_dark_chillwind", },
        Level1DefaultSpells = {"wh2_main_spell_dark_magic_power_of_darkness", "wh2_main_spell_dark_magic_bladewind", "wh2_main_spell_dark_magic_word_of_pain"},
        Level3DefaultSpells = {"wh2_main_spell_dark_magic_doombolt", "wh2_main_spell_dark_magic_soul_stealer"},
    },
    Deep = {
        InnateSkill = {"wh2_dlc11_skill_all_magic_deep_03_lore_attribute",},
        SignatureSpell = {"wh2_dlc11_spell_deep_tidecall",},
        Level1DefaultSpells = {"wh2_dlc11_spell_deep_spiteful_shot", "wh2_dlc11_spell_deep_fog_of_the_damned", "wh2_dlc11_spell_deep_denizens_of_the_deep"},
        Level3DefaultSpells = {"wh2_dlc11_spell_deep_krakens_pull", "wh2_dlc11_spell_deep_krakens_pull"},
    },
    Nehekhara = {
        InnateSkill = {"wh2_dlc09_skill_tmb_nehekhara_lore_1_passive",},
        SignatureSpell = {"wh2_dlc09_spell_nehekhara_djafs_incantation_of_cursed_blades",},
        Level1DefaultSpells = {"wh2_dlc09_spell_nehekhara_nerus_incantation_of_protection", "wh2_dlc09_spell_nehekhara_ptras_incantation_of_righteous_smiting", "wh2_dlc09_spell_nehekhara_usirians_incantation_of_vengeance"},
        Level3DefaultSpells = {"wh2_dlc09_spell_nehekhara_usekhps_incantation_of_desiccation", "wh2_dlc09_spell_nehekhara_sakhmets_incantation_of_the_skullstorm"},
    },
    BigWaaagh = {
        InnateSkill = {"wh_main_skill_grn_magic_big_waaagh_04_power_of_da_waaagh",},
        SignatureSpell = {"wh_main_spell_big_waaagh_gaze_of_mork",},
        Level1DefaultSpells = {"wh_main_spell_big_waaagh_fists_of_gork", "wh_main_spell_big_waaagh_eadbutt", "wh_main_spell_big_waaagh_brain_bursta"},
        Level3DefaultSpells = {"wh_main_spell_big_waaagh_foot_of_gork", "wh_main_spell_big_waaagh_ere_we_go"},
    },
    LilWaaagh = {
        InnateSkill = {"wh_main_skill_grn_magic_little_waaagh_03_sneaky_stealin", },
        SignatureSpell = {"wh_main_spell_lil_waaagh_sneaky_stabbin", "wh_main_skill_grn_magic_little_waaagh_01_sneaky_stabbin",},
        Level1DefaultSpells = {"wh_main_spell_lil_waaagh_gorkll_fix_it", "wh2_main_skill_grn_magic_little_waaagh_05_gorkll_fix_it_lord", "wh_main_spell_lil_waaagh_itchy_nuisance", "wh2_main_skill_grn_magic_little_waaagh_04_itchy_nuisance_lord", "wh_main_spell_lil_waaagh_vindictive_glare", "wh2_main_skill_grn_magic_little_waaagh_02_vindictive_glare_lord", },
        Level3DefaultSpells = {"wh_main_spell_lil_waaagh_night_shroud", "wh2_main_skill_grn_magic_little_waaagh_09_night_shroud_lord", "wh_main_spell_lil_waaagh_curse_of_da_bad_moon", "wh2_main_skill_grn_magic_little_waaagh_10_curse_of_da_bad_moon_lord",},
    },
    Wild = {
        InnateSkill = {"wh_dlc03_lore_passive_bestial_surge",},
        SignatureSpell = {"wh_dlc03_spell_wild_viletide",},
        Level1DefaultSpells = {"wh_dlc03_spell_wild_bray_scream", "wh_dlc03_spell_wild_devolve", "wh_dlc03_spell_wild_traitor_kin"},
        Level3DefaultSpells = {"wh_dlc03_spell_wild_mantle_of_ghorok", "wh_dlc03_spell_wild_savage_dominion"},
    },
    Plague = {
        InnateSkill = {"wh2_main_skill_all_magic_plague_03_lore_attribute",},
        SignatureSpell = {"wh2_main_spell_plague_pestilent_breath",},
        Level1DefaultSpells = {"wh2_main_spell_plague_bless_with_filth", "wh2_main_spell_plague_wither", "wh2_main_spell_plague_vermintide"},
        Level3DefaultSpells = {"wh2_main_spell_plague_plague", "wh2_main_spell_plague_pestilent_birth"},
    },
    Ruin = {
        InnateSkill = {"wh2_main_skill_all_magic_ruin_03_lore_attribute",},
        SignatureSpell = {"wh2_main_spell_ruin_warp_lightning",},
        Level1DefaultSpells = {"wh2_main_spell_ruin_howling_warpgale", "wh2_main_spell_ruin_scorch", "wh2_main_spell_ruin_death_frenzy"},
        Level3DefaultSpells = {"wh2_main_spell_ruin_cracks_call", "wh2_main_spell_ruin_skitterleap"},
    },
};