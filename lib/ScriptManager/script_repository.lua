-- ScriptManager - Script Repository

local SCRIPT_VERSION = "0.23"

local scripts_repository = {
    --{
    --    name = "AcjokerScript",
    --    author = "Acjoker",
    --    description = "Super fun script with tons of options, lovingly crafted by Acjoker. Jesus cage those griefing sinners!",
    --    project_url = "https://github.com/acjoker8818/AcjokerScript",
    --    discord_url = "https://discord.gg/fn4uBbFNnA",
    --},
    {
        name="AggressionScript",
        author = "Axhov",
        description = "Some of the attacker options from Lance Script TEOF in their own script, as well as improved.",
        project_url = "https://github.com/Arysr/AggressionScript",
    },
    {
        name="Andy's Script",
        author="Andy",
        description="AndyScript for Stand GTA V mod menu",
        project_url="https://github.com/Lancito01/AndyScript",
        discord_url="https://discord.gg/9vzATnaM9c",
    },
    {
        name="BallDrop",
        author="BigTuna76",
        description="A silly little script that allows you to unleash a torrent of oversized soccer balls from above on yourself or another player",
        project_url="https://github.com/BigTuna76/stand-lua-balldrop",
    },
    {
        name="Constructor",
        author="Hexarobi",
        description="Load, edit, and create custom vehicles, maps and skins.",
        project_url = "https://github.com/hexarobi/stand-lua-constructor",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="ClearTraffic",
        author="Hexarobi",
        description="Clears traffic from all roads for easy driving and drifting. Syncs to all players in lobby.",
        project_url = "https://github.com/hexarobi/stand-lua-cleartraffic",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="CollectibleHelper",
        author="aaronlink127",
        description="Shows blips on the map for collectibles.",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/CollectibleHelper.lua",
            script_relpath="CollectibleHelper.lua",
        }
    },
    --{
    --    name="Copyify",
    --    author=" JayMontana36",
    --    description="real.",
    --    project_url = "https://github.com/JayMontana36/JM36_Copify",
    --    discord_url = "https://discord.gg/zaCVjtVP6x",
    --},
    {
        name="FOV Linear Interpolation",
        author="Skylar",
        description="Smooth Field-of-View Linear-Interpolation for people that use a different FOV on foot/in vehicles and don't like the jarring pop effect that it creates.",
        project_url = "https://github.com/skywur/stand-fov-lerp",
    },
    {
        name="GameCrunchScript",
        author="GameCrunch",
        description="real.",
        project_url = "https://github.com/Game-Crunch/GameCrunchScript",
        discord_url = "https://discord.gg/8eGrTbQYce",
    },
    {
        name="HeistControl",
        author="IceDoomfist",
        description="Complete your heists with ease.",
        project_url = "https://github.com/IceDoomfist/Stand-Heist-Control",
        discord_url = "https://discord.gg/KTFAYQn5Xz",
    },
    {
        name="HexaScript",
        author="Hexarobi",
        description="Makes chat commands easier to use for everyone in the lobby.",
        project_url = "https://github.com/hexarobi/stand-lua-hexascript",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="HornSongs",
        author="Hexarobi",
        description="Play musical song files using your vehicle horn.",
        project_url = "https://github.com/hexarobi/stand-lua-hornsongs",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="InfOverlay",
        author="lev",
        description="An additional overlay window containing details about selected player.",
        project_url = "https://github.com/Lev200501/InfOverlay",
    },
    --{
    --    name="Jinxscript",
    --    author="Prisuhm",
    --    description="A must-have script full of great options.",
    --    discord_url = "https://discord.gg/7AYFEtCXwm",
    --    install_config={
    --        source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/JinxScript.lua",
    --        script_relpath="JinxScript.lua",
    --    }
    --},
    {
        name="KD Editor",
        author="Kreeako",
        description="Edit your kills and death stats to whatever value you want.",
        project_url="https://github.com/Kreeako/KD-Editor",
    },
    {
        name="LanceLoadout",
        author="Lance",
        description="A bite-sized loadout manager for GTA V. Quickly save, clear, and load your loadouts from file. Share .loadout files with your friends and load them with no hassle.",
        project_url = "https://github.com/xSetrox/lance-loadout",
    },
    {
        name = "LanceScript Reloaded",
        author = "Lance",
        description = "The latest version of LanceScript, tho it has since been abandoned by the author.",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/LanceScriptReloaded.lua",
            script_relpath="LanceScript Reloaded.lua",
            dependencies={
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/lib/all_labels.lua",
                    script_relpath="lib/all_labels.lua",
                },
            }
        }
    },
    {
        name="Meteor",
        author="NovaPlays",
        description="Meteor is originally an 2take1 script i recoded everything i could or was not risky for online",
        project_url = "https://github.com/NovaPlays134/Meteor",
    },
    {
        name="mehScript",
        author="akat0zi",
        description="Meh lua Script for Stand",
        project_url = "https://github.com/akat0zi/mehScript",
    },
    {
        name="Mors Mutual",
        author="Mr. Robot",
        description="Instantly reclaim your personal vehicles whether they were destroyed and need to be claimed through Mors Mutual Insurance or have been impounded.",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/Mors_Mutual.lua",
            script_relpath="Mors_Mutual.lua",
            script_run_name="MorsMutual"
        }
    },
    {
        name="MusinessBanagement",
        author="ICYPhoenix and Ren",
        description="Original MB project file, slightly different from the version now found in Stand repo.",
        discord_url = "https://discord.gg/KYav78KmNc",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/MusinessBanagersource.lua",
            script_relpath="MusinessBanagersource.lua",
            script_run_name="MusinessBanagersource"
        }
    },
    {
        name="next-translate",
        author="Lance",
        description="Next-Translate is a chat translator script that is as simple and intelligent as possible",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/next_translate.lua",
            script_relpath="next_translate.lua",
            script_run_name="nexttranslate"
        }

    },
    {
        name="NovaMeter",
        author="NovaPlays",
        description="A fully customizable speedometer for Gta with stand mod",
        project_url="https://github.com/NovaPlays134/NovaMeter",
        discord_url="https://discord.gg/ZHpE9YpkZG",
    },
    {
        name="NovaScript",
        author="NovaPlays",
        description="A fun trolling script for Gta v mod Stand with lots of self, vehicle, weapons, trolling and player vehicle options",
        project_url="https://github.com/NovaPlays134/NovaScript",
        discord_url="https://discord.gg/ZHpE9YpkZG",
    },
    {
        name = "Policify",
        author = "Hexarobi",
        description = "Turns any vehicle into a police vehicle, with controllable flashing lights and sirens.",
        project_url = "https://github.com/hexarobi/stand-lua-policify",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name = "RTL: REPLICA Theme Loader",
        author = "ukn",
        description = "Load a Stand menu theme from several that replicate other menus look and feel.",
        project_url = "https://github.com/ukn-repos/rtl",
        discord_url = "https://discord.gg/N43aKNDJyF",
    },
    {
        name = "Ryze",
        author = "Pichocles",
        description = "Pichocles's collection of scripted options",
        project_url = "https://github.com/XxpichoclesxX/GtaVScripts",
        discord_url = "https://discord.com/invite/BNbSHhunPv",
        install_config={
            source_url="https://raw.githubusercontent.com/XxpichoclesxX/GtaVScripts/Ryze-Scripts/Stand/Translations/RyzeStand_ENG.lua",
            script_relpath="RyzeStand.lua",
        }
    },
    {
        name="SlotBot",
        author="Hexarobi",
        description="Automatic spinning of casino slot machine to make a quick $50mil per day.",
        project_url = "https://github.com/hexarobi/stand-lua-slotbot",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="SoulScript",
        author="SoulReaper",
        description="SoulReapers collection of sweet features.",
        project_url = "https://github.com/epickeatongamer/SoulScript",
        discord_url = "https://discord.gg/JSJhFg8whC",
    },
    {
        name="Scriptcat Utilities",
        author="Kerami",
        description="Scriptcat Utilities.",
        project_url = "https://github.com/Keramis/scriptcat-utilities",
        discord_url = "https://discord.gg/Bfapnxx34V",
        install_config={
            source_url="https://raw.githubusercontent.com/Keramis/scriptcat-utilities/main/scriptcat_utilities.lua",
            script_relpath="scriptcat_utilities.lua",
            dependencies={
                {
                    source_url="https://raw.githubusercontent.com/Keramis/scriptcat-utilities/main/Universal_objects_list.lua",
                    script_relpath="lib/Universal_objects_list.lua",
                },
                {
                    source_url="https://raw.githubusercontent.com/Keramis/scriptcat-utilities/main/Universal_ped_list.lua",
                    script_relpath="lib/Universal_ped_list.lua",
                },
            }
        }
    },
    {
        name="Stand Watermark Reloaded",
        author="Аpзyзеhыw",
        description="Updated version of watermark from IMXNOOBX.",
        project_url = "https://github.com/BluetoothWiFi/Stand-watermark/",
    },
    {
        name="Undefined",
        author="Undefined Pony",
        description="The script mainly features aim actions, aim teleport, aim beam, online players list and player ESP, but it also has other cool features.",
        project_url="https://gitlab.com/undefinedscripts/undefined-for-stand",
        install_config={
            source_url="https://gitlab.com/undefinedscripts/undefined-for-stand/-/raw/main/Undefined.lua",
            script_relpath="Undefined.lua",
        }
    },
}

local function build_natives_script()
    local natives_versions = {
        "1627063482",
        "1640181023",
        "1651208000",
        "1660775568",
        "1660775568-uno",
        "1663599433",
        "1663599433-uno",
        "1672190175",
    }
    local natives_script = {
        name="Natives",
        author="Stand",
        description="Library files for scripts to interface with GTA.",
    }
    for _, natives_version in pairs(natives_versions) do
        local native = {
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/lib/natives-"..natives_version..".lua",
            script_relpath="lib/natives-"..natives_version..".lua",
        }
        if natives_script.install_config == nil then
            natives_script.install_config = native
            natives_script.install_config.dependencies = {}
        else
            table.insert(natives_script.install_config.dependencies, native)
        end
    end
    return natives_script
end
table.insert(scripts_repository, build_natives_script())

return scripts_repository
