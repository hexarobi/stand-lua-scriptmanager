-- ScriptManager
-- by Hexarobi
-- A Lua Script for the Stand mod menu for GTA5
-- Manages installing and updating other Lua Scripts
-- https://github.com/hexarobi/stand-lua-scriptmanager

local SCRIPT_VERSION = "0.2"
local AUTO_UPDATE_BRANCHES = {
    { "main", {}, "More stable, but updated less often.", "main", },
    { "dev", {}, "Cutting edge updates, but less stable.", "dev", },
}
local SELECTED_BRANCH_INDEX = 1
local selected_branch = AUTO_UPDATE_BRANCHES[SELECTED_BRANCH_INDEX][1]

---
--- Auto-Updater Lib Install
---

-- Auto Updater from https://github.com/hexarobi/stand-lua-auto-updater
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
            function(result, headers, status_code)
                local function parse_auto_update_result(result, headers, status_code)
                    local error_prefix = "Error downloading auto-updater: "
                    if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                    if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                    filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                    local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                    if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                    file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
                end
                auto_update_complete = parse_auto_update_result(result, headers, status_code)
            end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

---
--- Config
---

local config = {
    auto_update = true,
    debug_mode = true,
    debug_toast = true,
}

---
--- Auto-Update
---

local auto_update_config = {
    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-scriptmanager/main/ScriptManager.lua",
    script_relpath=SCRIPT_RELPATH,
    switch_to_branch=selected_branch,
    verify_file_begins_with="--",
}
local update_success
if config.auto_update then
    update_success = auto_updater.run_auto_update(auto_update_config)
end

---
--- Data
---

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

---
--- Utils
---

local function t(msg)
    return msg
end

local function debug_log(message)
    if config.debug_mode then
        util.log("[ScriptManager] "..message)
        if config.debug_toast then
            util.toast(message)
        end
    end
end

---
--- Managed Scripts
---

local CONFIG_DIR = filesystem.store_dir() .. 'ScriptManager\\'
filesystem.mkdirs(CONFIG_DIR)
local MANAGED_SCRIPTS_FILE = CONFIG_DIR .. "managed_scripts.json"

local function clean_managed_scripts(managed_scripts)
    for _, managed_script in pairs(managed_scripts) do
        managed_script.menus = {}
    end
    return managed_scripts
end

local function save_managed_scripts(managed_scripts)
    local file = io.open(MANAGED_SCRIPTS_FILE, "wb")
    if file == nil then util.toast("Error opening file for writing: "..MANAGED_SCRIPTS_FILE, TOAST_ALL) return end
    file:write(soup.json.encode(clean_managed_scripts(managed_scripts)))
    file:close()
end

local function load_managed_scripts()
    local file = io.open(MANAGED_SCRIPTS_FILE)
    if file then
        local content = file:read()
        file:close()
        if content == nil or content == "" then return {} end
        local load_file_status, managed_scripts = pcall(soup.json.decode, content)
        if not load_file_status then error("Could not decode file contents") end
        return managed_scripts
    else
        return {}
    end
end

local function add_managed_script(script)
    local managed_scripts = load_managed_scripts()
    for _, managed_script in pairs(managed_scripts) do
        if managed_script.name == script.name then
            return
        end
    end
    table.insert(managed_scripts, script)
    save_managed_scripts(managed_scripts)
    debug_log("Added script to managed script list "..script.name)
end

local function remove_managed_script(script)
    local managed_scripts = load_managed_scripts()
    for index, managed_script in pairs(managed_scripts) do
        if managed_script.name == script.name then
            debug_log("Removing script from managed script list "..script.name)
            table.remove(managed_scripts, index)
            save_managed_scripts(managed_scripts)
            return true
        end
    end
    debug_log("Script not found in managed script list "..script.name)
    return false
end

---
--- Functions
---

local function process_curated_scripts()
    for _, script in pairs(scripts_repository) do
        script.script_filepath = filesystem.scripts_dir() .. script.install_config.script_relpath:gsub("\\", "/")
    end
end
process_curated_scripts()

local function install_script(script)
    debug_log("Installing "..script.name)
    script.install_config.auto_restart = false
    update_success = auto_updater.run_auto_update(script.install_config)
    debug_log("Install complete. "..tostring(update_success))
    add_managed_script(script)
end

local function uninstall_script(script)
    if not filesystem.exists(script.script_filepath) then return end
    debug_log("Uninstalling "..script.name)
    os.remove(script.script_filepath)
    remove_managed_script(script)
end

local function get_version_string(script)
    --debug_log("Reading script "..script.script_filepath)
    if not filesystem.exists(script.script_filepath) then return end
    local file = io.open(script.script_filepath)
    if file then
        local file_content = file:read("*a")
        file:close()
        local version = file_content:match('SCRIPT_VERSION = "([^ ]+)"')
        if version then
            return version
        else
            return "Unknown Ver"
        end
    end
end

---
--- Menu Utils
---

local function delete_menus(menus)
    for _, menu_handle in pairs(menus) do
        if menu_handle:isValid() then
            menu.delete(menu_handle)
        end
    end
end

local function init_menus(root, menu_key)
    if type(root) ~= "table" then
        error("Cannot init menu on a non-table")
    end
    if root[menu_key] == nil then root[menu_key] = {} else delete_menus(root[menu_key]) end
end

---
--- Menus
---

local function build_script_menu(script)
    init_menus(script.menus, "main_list")
    script.menus.main_list.title = menu.divider(script.menus.main, script.name)
    if not filesystem.exists(script.script_filepath) then
        script.menus.main_list.install = menu.action(script.menus.main, t("Install"), {}, t("Download and install or update this script."), function()
            local main_menu_ref = script.menus.main
            install_script(script)
            script.menus.main = main_menu_ref
            menu.trigger_command(script.menus.main)
        end)
    else

        script.menus.main_list.version = menu.readonly(script.menus.main, t("Installed Version"), get_version_string(script))

        script.menus.main_list.run = menu.action(script.menus.main, t("Run"), {}, "Run the installed script", function()
            menu.trigger_commands("lua"..script.name)
        end)

        script.menus.main_list.update = menu.action(script.menus.main, t("Update"), {}, t("Check for updates."), function()
            script.install_config.check_interval = 0
            local main_menu_ref = script.menus.main
            install_script(script)
            script.menus.main = main_menu_ref
            menu.trigger_command(script.menus.main)
        end)
        script.menus.main_list.uninstall = menu.action(script.menus.main, t("Uninstall"), {}, t("Delete script file."), function()
            local main_menu_ref = script.menus.main
            uninstall_script(script)
            script.menus.main = main_menu_ref
            menu.trigger_command(script.menus.main)
        end)

        if script.project_url ~= nil then
            menu.hyperlink(script.menus.main, t("Homepage"), script.project_url)
        end
        if script.discord_url ~= nil then
            menu.hyperlink(script.menus.main, t("Discord"), script.discord_url)
        end

    end
end

local menus = {}

menus.installed_scripts = menu.list(menu.my_root(), t("Installed Scripts"))

for _, script in pairs(load_managed_scripts()) do
    init_menus(script, "menus")
    script.menus.main = menu.list(menus.installed_scripts, script.name, {}, script.name.."\nby "..script.author.."\n"..script.description, function()
        build_script_menu(script)
    end)
end

menus.scripts = menu.list(menu.my_root(), t("Browse Scripts"), {}, "", function()
    for _, script in pairs(scripts_repository) do
        init_menus(script, "menus")
        script.menus.main = menu.list(menus.scripts, script.name, {"scriptmanager"..script.name}, script.name.."\nby "..script.author.."\n"..script.description, function()
            build_script_menu(script)
        end)
    end
end)

--menus.add_script = menu.text_input(menu.my_root(), t("Add Script"), {"addluagit"}, t("Paste a GitHub link to a script repository to manage it"), function(source_url)
--    debug_log("Adding script "..source_url)
--end)

---
--- Script Meta Menu
---

local script_meta_menu = menu.list(menu.my_root(), t("About ScriptManager"), {}, t("Information and options about the script itself."))
menu.divider(script_meta_menu, t("ScriptManager"))
menu.readonly(script_meta_menu, t("Version"), SCRIPT_VERSION)
menu.toggle(script_meta_menu, t("Auto-Update"), {}, t("Automatically install updates as they are released. Disable if you cannot successfully fetch updates as normal."), function()  end, config.auto_update)
menu.list_select(script_meta_menu, t("Release Branch"), {}, t("Switch from main to dev to get cutting edge updates, but also potentially more bugs."), AUTO_UPDATE_BRANCHES, SELECTED_BRANCH_INDEX, function(index, menu_name, previous_option, click_type)
    if click_type ~= 0 then return end
    auto_update_config.switch_to_branch = AUTO_UPDATE_BRANCHES[index][1]
    auto_update_config.check_interval = 0
    auto_updater.run_auto_update(auto_update_config)
end)
menu.action(script_meta_menu, t("Check for Update"), {}, t("The script will automatically check for updates at most daily, but you can manually check using this option anytime."), function()
    auto_update_config.check_interval = 0
    if auto_updater.run_auto_update(auto_update_config) then
        util.toast(t("No updates found"))
    end
end)
menu.action(script_meta_menu, t("Clean Reinstall"), {}, t("Force an update to the latest version, regardless of current version."), function()
    auto_update_config.clean_reinstall = true
    auto_updater.run_auto_update(auto_update_config)
end)
menu.hyperlink(script_meta_menu, t("Github Source"), "https://github.com/hexarobi/stand-lua-scriptmanager", t("View source files on Github"))
menu.hyperlink(script_meta_menu, t("Discord"), "https://discord.gg/2u5HbHPB9y", t("Open Discord Server"))
