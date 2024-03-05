-- ScriptManager - Script Repository

local SCRIPT_VERSION = "0.38"

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
        name="Animation",
        author="Rachmad",
        description="Animations that can be seen by other players, including hands up & crouch",
        project_url="https://github.com/Rachmad42/Emote-Stand-Lua",
    },
    {
        name="AR-GPS",
        author="Murten and MasterPepe",
        description="Adds a 3D waypoint path to the game for following a route without taking your eyes off the road.",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/AR-GPS.pluto",
            script_relpath="AR-GPS.pluto",
            script_run_name="ARGPS"
        }
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
        name="Custom Loadout",
        author="Davus",
        description="A weapon management Lua for Stand.",
        install_config={
            source_url="https://raw.githubusercontent.com/Davus0717/custom-loadouts/master/src/custom-loadout.pluto",
            script_relpath="custom-loadout.pluto",
            dependencies={
                {
                    source_url="https://raw.githubusercontent.com/Davus0717/custom-loadouts/master/src/lib/custom-loadout/component_resources.lua",
                    script_relpath="lib/custom-loadout/component_resources.lua",
                }
            }
        }
    },
    {
        name="DOLOS",
        author="Lance",
        description="DOLOS, named after the Greek spirit of trickery, is an advanced trolling Lua that includes many enhanced classic trolling options as well as many new, never before-seen ones.",
        project_url = "https://github.com/thebitwise/dolos",
        discord_url = "https://discord.gg/zZ2eEjj88v",
    },
    {
        name="FlightRedux",
        author="Lance",
        description="FlightRedux completely revamps GTA V's huds for jets and offers additional functionality and realism, including an implementation of the Ground Proximity Warning System, missile warnings, missile markings on the map, altitude, pitch, heading, and roll indicators, better lock-on indicators, and much, much more. Plus, it looks a lot better than GTA V's default HUD.",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/flightredux.lua",
            script_relpath="flightredux.lua",
            dependencies={
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/lib/aalib.dll",
                    script_relpath="lib/aalib.dll",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/altimeter.png",
                    script_relpath="resources/flightredux/altimeter.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/boresight.png",
                    script_relpath="resources/flightredux/boresight.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/circle.png",
                    script_relpath="resources/flightredux/circle.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/contact.png",
                    script_relpath="resources/flightredux/contact.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/line.png",
                    script_relpath="resources/flightredux/line.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/trajectory.png",
                    script_relpath="resources/flightredux/trajectory.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/missile.wav",
                    script_relpath="store/flightredux/missile.wav",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/terrain.wav",
                    script_relpath="store/flightredux/terrain.wav",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/missile.txt",
                    script_relpath="store/flightredux/missile.txt",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/flightredux/terrain.txt",
                    script_relpath="store/flightredux/terrain.txt",
                },
            }
        }
    },
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
    --{
    --    name="JM36 Elements",
    --    author="JayMontana36",
    --    description="A set of scripts/modules made for JM36 Lua Modularity Framework (based upon JM36 Lua Plugin)",
    --    project_url = "https://github.com/JayMontana36/JM36_Elements-Public",
    --    install_config={
    --        project_url = "https://github.com/JayMontana36/JM36_Elements-Public",
    --        dependencies={
    --            {
    --                source_url="https://raw.githubusercontent.com/JayMontana36/JM36_Lua_Modularity_Framework-Stand/main/JM36_Lua_Modularity_Framework-Stand.lua",
    --                script_relpath="JM36_Lua_Modularity_Framework-Stand.lua",
    --            },
    --        }
    --    }
    --},
    --{
    --    name="Keplar",
    --    author="Lance",
    --    description="A successor to LanceScript, Kepler is an experimental, reimagined megascript for the Stand mod menu.",
    --    install_config={
    --        source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/Kepler.lua",
    --        script_relpath="Kepler.lua",
    --        dependencies={
    --            {
    --                source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/kepler/logo.png",
    --                script_relpath="resources/kepler/logo.png",
    --            },
    --            {
    --                source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/kepler/notification.wav",
    --                script_relpath="resources/kepler/notification.wav",
    --            },
    --            {
    --                source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/kepler/startup.wav",
    --                script_relpath="resources/kepler/startup.wav",
    --            },
    --        }
    --    }
    --},
    {
        name="KD Editor",
        author="Kreeako",
        description="Edit your kills and death stats to whatever value you want.",
        project_url="https://github.com/Kreeako/KD-Editor",
    },
    {
        name = "KeramiScript",
        author = "Keramis",
        description = "A utility/pvp script for the Stand Mod Menu for GTAV.",
        project_url = "https://github.com/Keramis/Sneaky-Explosions-STANDAPI",
        install_config={
            source_url="https://raw.githubusercontent.com/Keramis/Sneaky-Explosions-STANDAPI/main/KeramiScript%20V.10.lua",
            script_relpath="KeramiScript.lua",
            dependencies={
                {
                    source_url="https://raw.githubusercontent.com/Keramis/Sneaky-Explosions-STANDAPI/main/KeramiScriptLib.lua",
                    script_relpath="lib/KeramiScriptLib.lua",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/lib/Universal_objects_list.lua",
                    script_relpath="lib/Universal_objects_list.lua",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/lib/Universal_ped_list.lua",
                    script_relpath="lib/Universal_ped_list.lua",
                },
            }
        }
    },
    --{
    --    name="LanceLoadout",
    --    author="Lance",
    --    description="A bite-sized loadout manager for GTA V. Quickly save, clear, and load your loadouts from file. Share .loadout files with your friends and load them with no hassle.",
    --    project_url = "https://github.com/xSetrox/lance-loadout",
    --},
    {
        name="LanceScript v11",
        author="Lance",
        description="LanceScript is a swiss-army knife for everything Stand and GTA V. There are options for folks of all levels of toxicity, and even if you don't troll, you will find a lot of use and fun out of LanceScript.",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/LanceScript.lua",
            script_relpath="LanceScript.lua",
            dependencies={
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/resources/lancescript/lancescript_logo.png",
                    script_relpath="resources/lancescript/lancescript_logo.png",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/store/lancescript/translations/english.lua",
                    script_relpath="store/lancescript/translations/english.lua",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/store/lancescript/translations/last_version.txt",
                    script_relpath="store/lancescript/translations/last_version.txt",
                },
                {
                    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/store/lancescript/translations/selected_language.txt",
                    script_relpath="store/lancescript/translations/selected_language.txt",
                },
            }
        }
    },
    {
        name = "LanceScript v10",
        author = "Lance",
        description = "LanceScript Reloaded has since been updated to LanceScript v11",
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
        name="LolaScript",
        author="LolaTheSquishy",
        description="Lola's fun options.",
        project_url = "https://github.com/LolaThePretty/LolaScript",
    },
    {
        name="Magnet-Helis",
        author="DynastySheep",
        description="Lets you spawn cargobob and skylift with functioning magnets.",
        project_url = "https://github.com/DynastySheep/Magnet-Helis",
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
    --{
    --    name="Mors Mutual",
    --    author="Mr. Robot",
    --    description="Instantly reclaim your personal vehicles whether they were destroyed and need to be claimed through Mors Mutual Insurance or have been impounded.",
    --    install_config={
    --        source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/Mors_Mutual.lua",
    --        script_relpath="Mors_Mutual.lua",
    --        script_run_name="MorsMutual"
    --    }
    --},
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
        name="MrRobot",
        author="MrRobot",
        description="MrRobot's modular script",
        project_url = "https://github.com/4d72526f626f74/MrRobot",
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
        name="PlayerSearch",
        author="Parci",
        description="Social Club Player Browser",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/PlayerSearch.lua",
            script_relpath="PlayerSearch.lua",
            script_run_name="playersearch"
        }
    },
    {
        name = "Policify",
        author = "Hexarobi",
        description = "Turns any vehicle into a police vehicle, with controllable flashing lights and sirens.",
        project_url = "https://github.com/hexarobi/stand-lua-policify",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name = "PolyglotTranslator",
        author = "Totoro-Li",
        description = "This script provides translations between different languages by interfacing with external translation APIs like Google Translate and ChatGPT.",
        project_url = "https://github.com/Totoro-Li/PolyglotTranslator",
    },
    --{
    --    name = "RTL: REPLICA Theme Loader",
    --    author = "ukn",
    --    description = "Load a Stand menu theme from several that replicate other menus look and feel.",
    --    project_url = "https://github.com/ukn-repos/rtl",
    --    discord_url = "https://discord.gg/N43aKNDJyF",
    --},
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
        name="Stand: Focus Link Creator",
        author="Kodama",
        description="This tool will enable you to copy any Stand address and convert it into a clickable link.",
        install_config={
            source_url="https://cdn.discordapp.com/attachments/1123098388418797568/1123098432580632578/get-focus-link.pluto",
            script_relpath="get-focus-link.pluto",
        }
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
        name="Theme Loader",
        author="SoulReaper",
        description="Basic theme loader for stand.",
        project_url = "https://github.com/epickeatongamer/Theme_Loader",
        discord_url = "https://discord.gg/JSJhFg8whC",
    },
    {
        name="Theme Repo",
        author="Stagnate",
        description="Lua script to apply headers and themes blazingly fast.",
        project_url = "https://github.com/stagnate6628/stand-themerepo",
        install_config={
            source_url="https://raw.githubusercontent.com/stagnate6628/stand-themerepo/main/ThemeRepo.pluto",
            script_relpath="ThemeRepo.pluto",
        },
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
