-- ScriptManager - Script Repository

local SCRIPT_VERSION = "0.13"

local scripts_repository = {
    {
        name = "AcjokerScript",
        author = "Acjoker",
        description = "Super fun script with tons of options, lovingly crafted by Acjoker. Jesus cage those griefing sinners!",
        project_url = "https://github.com/acjoker8818/AcjokerScript",
        discord_url = "https://discord.gg/fn4uBbFNnA",
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
        name="HornSongs",
        author="Hexarobi",
        description="Play musical song files using your vehicle horn.",
        project_url = "https://github.com/hexarobi/stand-lua-hornsongs",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="Jinxscript",
        author="Prisuhm",
        description="A must-have script full of great options.",
        discord_url = "https://discord.gg/7AYFEtCXwm",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-script-repository/main/JinxScript.lua",
            script_relpath="JinxScript.lua",
        }
    },
    {
        name="LanceLoadout",
        author="Lance",
        description="A bite-sized loadout manager for GTA V. Quickly save, clear, and load your loadouts from file. Share .loadout files with your friends and load them with no hassle.",
        project_url = "https://github.com/xSetrox/lance-loadout",
    },
    {
        name="mehScript",
        author="akat0zi",
        description="Meh lua Script for Stand",
        project_url = "https://github.com/akat0zi/mehScript",
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
        project_url="https://github.com/xSetrox/next-translate",
    },
    {
        name="NovaMeter",
        author="NovaPlays",
        description="A fully customizable speedometer for Gta with stand mod",
        project_url="https://github.com/NovaPlays134/NovaMeter",
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
        name="SlotBot",
        author="Hexarobi",
        description="Automatic spinning of casino slot machine to make a quick $50mil per day.",
        project_url = "https://github.com/hexarobi/stand-lua-slotbot",
        discord_url = "https://discord.gg/2u5HbHPB9y",
    },
    {
        name="Scriptcat Utilities",
        author="Kerami",
        description="Scriptcat Utilities.",
        project_url = "https://github.com/Keramis/scriptcat-utilities",
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
