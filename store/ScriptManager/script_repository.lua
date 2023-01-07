-- ScriptManager - Script Repository

local scripts_repository = {
    {
        name = "AcJokerScript",
        author = "AcJoker",
        description = "Turns any vehicle into a police vehicle, with controllable flashing lights and sirens.",
        project_url = "https://github.com/acjoker8818/AcjokerScript",
        discord_url = "https://discord.gg/fn4uBbFNnA",
        install_config = {
            source_url = "https://raw.githubusercontent.com/acjoker8818/AcjokerScript/main/AcjokerScript.lua",
            script_relpath = "AcjokerScript.lua",
            verify_file_begins_with = "   --",
        },
    },
    {
        name = "Policify",
        author = "Hexarobi",
        description = "Turns any vehicle into a police vehicle, with controllable flashing lights and sirens.",
        project_url = "https://github.com/hexarobi/stand-lua-policify",
        discord_url = "https://discord.gg/2u5HbHPB9y",
        install_config = {
            source_url = "https://raw.githubusercontent.com/hexarobi/stand-lua-policify/main/Policify.lua",
            script_relpath = "Policify.lua",
            verify_file_begins_with = "--",
        },
    },
    {
        name="Constructor",
        author="Hexarobi",
        description="Load, edit, and create custom vehicles, maps and skins.",
        project_url = "https://github.com/hexarobi/stand-lua-constructor",
        discord_url = "https://discord.gg/2u5HbHPB9y",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-constructor/main/Constructor.lua",
            script_relpath="Constructor.lua",
            verify_file_begins_with="--",
        },
    },
    {
        name="Andy's Script",
        author="Andy",
        description="AndyScript for Stand GTA V mod menu",
        project_url="https://github.com/Lancito01/AndyScript",
        discord_url="https://discord.gg/9vzATnaM9c",
        install_config={
            source_url="https://raw.githubusercontent.com/Lancito01/AndyScript/main/AndyScript.lua",
            script_relpath="AndyScript.lua",
            verify_file_begins_with="local",
        }
    },
    {
        name="next-translate",
        author="Lance",
        description="Next-Translate is a chat translator script that is as simple and intelligent as possible",
        project_url="https://github.com/xSetrox/next-translate",
        install_config={
            source_url="https://raw.githubusercontent.com/xSetrox/next-translate/main/next_translate.lua",
            script_relpath="next_translate.lua",
            verify_file_begins_with="--",
        }
    },

    {
        name="SlotBot",
        author="Hexarobi",
        description="Automatic spinning of casino slot machine to make a quick $50mil per day.",
        project_url = "https://github.com/hexarobi/stand-lua-slotbot",
        discord_url = "https://discord.gg/2u5HbHPB9y",
        install_config={
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-slotbot/main/SlotBot.lua",
            script_relpath="SlotBot.lua",
            verify_file_begins_with="--",
        },
    },
}

return scripts_repository
