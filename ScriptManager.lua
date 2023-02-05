-- ScriptManager
-- by Hexarobi
-- A Lua Script for the Stand mod menu for GTA5
-- Manages installing and updating other Lua Scripts
-- https://github.com/hexarobi/stand-lua-scriptmanager

local SCRIPT_VERSION = "0.9"
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
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/dev/auto-updater.lua",
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
    debug_toast = false,
}

---
--- Auto-Update
---

local auto_update_config = {
    source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-scriptmanager/main/ScriptManager.lua",
    script_relpath=SCRIPT_RELPATH,
    switch_to_branch=selected_branch,
    verify_file_begins_with="--",
    dependencies={
        {
            name="scripts_repository",
            source_url="https://raw.githubusercontent.com/hexarobi/stand-lua-scriptmanager/main/lib/ScriptManager/script_repository.lua",
            script_relpath="lib/ScriptManager/script_repository.lua",
        }
    }
}
local update_success
if config.auto_update then
    update_success = auto_updater.run_auto_update(auto_update_config)
end

local load_status, script_repository = pcall(require, "ScriptManager/script_repository")
if not load_status then error("Could not load script repository. "..script_repository) end

local status_crypto, crypto = pcall(require, "crypto")
if not status_crypto then util.log("Could not load crypto lib") end

--local status_inspect, inspect = pcall(require, "inspect")
--if not status_inspect then error("Could not load inspect lib. This should have been auto-installed.") end

---
--- Data
---

local menus = {}

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
        local content = file:read("*a")
        file:close()
        if content == nil or content == "" then return {} end
        --debug_log("Read file contents "..content)
        local load_file_status, managed_scripts = pcall(soup.json.decode, content)
        if not load_file_status then error("Could not decode file contents") end
        --debug_log("loaded managed scripts "..inspect(managed_scripts))
        return managed_scripts
    else
        return {}
    end
end

local function add_managed_script(script)
    local managed_scripts = load_managed_scripts()
    for key, managed_script in pairs(managed_scripts) do
        if managed_script.name == script.name then
            debug_log("Updated already managed script "..script.name)
            managed_scripts[key] = script
            save_managed_scripts(managed_scripts)
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

local function default_script_parameters(script)
    if script.is_folder then
        for _, child_script in pairs(script.contents) do
            default_script_parameters(child_script)
        end
    else
        if script.install_config == nil then
            script.install_config = {}
        end
        if script.install_config.source_url == nil and script.install_config.project_url == nil and script.project_url ~= nil then
            script.install_config.project_url = script.project_url
        end
        if script.install_config.name == nil and script.name ~= nil then
            script.install_config.name = script.name
        end
        auto_updater.expand_auto_update_config(script.install_config)
        if script.name == nil and script.install_config.name ~= nil then
            script.name = script.install_config.name
        end
        if script.description == nil then script.description = "" end
        if script.author == nil then script.author = script.install_config.author end
        if script.filepath == nil then
            if script.install_config.script_filepath ~= nil then
                script.script_filepath = script.install_config.script_filepath
            else
                script.script_filepath = filesystem.scripts_dir() .. script.install_config.script_relpath:gsub("\\", "/")
            end
        end
    end
end

local function process_curated_scripts()
    for _, script in pairs(script_repository) do
        default_script_parameters(script)
    end
end
process_curated_scripts()

local function install_script(script)
    debug_log("Installing "..script.name)
    script.install_config.auto_restart = false
    update_success = auto_updater.run_auto_update(script.install_config)
    debug_log("Install complete. "..tostring(update_success))
    if script.name == nil and script.install_config.script_run_name ~= nil then
        script.name = script.install_config.script_run_name
    end
    add_managed_script(script)
end

local function uninstall_script(script)
    auto_updater.uninstall(script.install_config)
    remove_managed_script(script)
    menu.trigger_command(menu.ref_by_path("Stand>Lua Scripts>ScriptManager>Manage Installed Scripts"))
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
            return crypto.md5(file_content):sub(1, 8)
        end
    end
end

---
--- Menu Utils
---

local function delete_menus(menus)
    for _, menu_handle in pairs(menus) do
        --debug_log("Deleting menu "..key.." type "..type(menu_handle))
        if menu_handle ~= nil and menu_handle:isValid() then
            pcall(menu.delete, menu_handle)
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

local function clear_menu(script)
    local main_menu_ref = script.menus.main
    delete_menus(script.menus.main_list)
    return main_menu_ref
end

local function rebuild_menu(script, main_menu_ref)
    script.menus.main = main_menu_ref
    if menu.is_ref_valid(script.menus.main) then
        menu.trigger_command(script.menus.main)
    end
end

local function build_script_menu(script)
    --debug_log("Building script menu "..script.name)
    if not menu.is_ref_valid(script.menus.main) then
        debug_log("Invalid main menu")
        return
    end
    init_menus(script.menus, "main_list")
    script.menus.main_list.title = menu.divider(script.menus.main, script.name)
    if not filesystem.exists(script.install_config.script_path) then
        script.menus.main_list.install = menu.action(script.menus.main, t("Install"), {}, t("Download and install or update this script."), function()
            local main_menu_ref = clear_menu(script)
            install_script(script)
            rebuild_menu(script, main_menu_ref)
        end)
    else
        --debug_log("File exists " .. script.install_config.script_path)

        script.menus.main_list.version = menu.readonly(script.menus.main, t("Installed Version"), get_version_string(script))

        script.menus.main_list.run = menu.action(script.menus.main, t("Run"), {}, "Run the installed script", function()
            local run_name = script.name
            if script.install_config.script_run_name ~= nil then
                run_name = script.install_config.script_run_name
            end
            menu.focus(menu.ref_by_path("Stand>Lua Scripts"))
            util.yield(100)
            menu.focus(menu.ref_by_path("Stand>Lua Scripts>Repository"))
            util.yield(100)
            menu.trigger_commands("lua"..run_name)
        end)

        script.menus.main_list.update = menu.action(script.menus.main, t("Update"), {}, t("Check for updates."), function()
            script.install_config.check_interval = 0
            local main_menu_ref = clear_menu(script)
            install_script(script)
            rebuild_menu(script, main_menu_ref)
        end)
        script.menus.main_list.clean_reinstall = menu.action(script.menus.main, t("Clean Reinstall"), {}, t("Force an update to the latest version, regardless of current version."), function()
            script.install_config.check_interval = 0
            script.install_config.clean_reinstall = true
            local main_menu_ref = clear_menu(script)
            install_script(script)
            rebuild_menu(script, main_menu_ref)
        end)

        if script.install_config.extracted_files then
            script.menus.main_list.installed_files_list = menu.list(script.menus.main, t("Installed Files", {}, t("View installed files")))
            debug_log("scripts path "..filesystem.scripts_dir())
            for _, filepath in script.install_config.extracted_files do
                debug_log("installed file "..filepath)
                menu.readonly(script.menus.main_list.installed_files_list, filepath:gsub(filesystem.scripts_dir(), ""))
            end
        end

        script.menus.main_list.uninstall = menu.action(script.menus.main, t("Uninstall"), {}, t("Delete script file."), function()
            local main_menu_ref = clear_menu(script)
            uninstall_script(script)
            util.yield(500)
            rebuild_menu(script, main_menu_ref)
        end)

        if script.project_url ~= nil then
            script.menus.main_list.project_url = menu.hyperlink(script.menus.main, t("Homepage"), script.project_url)
        end
        if script.discord_url ~= nil then
            script.menus.main_list.discord_url = menu.hyperlink(script.menus.main, t("Discord"), script.discord_url)
        end

    end
end

local function build_script_repository_item_menu(script, root)
    init_menus(script, "menus")
    if script.is_folder then
        script.menus.list = menu.list(root, script.name, {}, script.description or "")
        for _, child_script in pairs(script.contents) do
            build_script_repository_item_menu(child_script, script.menus.list)
        end
    else
        script.menus.main = menu.list(root, script.name, {"scriptmanager"..script.name}, script.name.."\nby "..script.author.."\n"..script.description, function()
            build_script_menu(script)
        end)
    end
end

menus.install_scripts = menu.list(menu.my_root(), t("Install Scripts"), {}, "")
menus.add_script = menu.text_input(menus.install_scripts, t("Add Script by URL"), {"addluagit"}, t("Paste a GitHub project homepage URL to automatically download and install it."), function(source_url)
    debug_log("Adding script "..source_url)
    local script = {
        project_url=source_url
    }
    default_script_parameters(script)
    install_script(script)
    menu.trigger_command(menus.installed_scripts)
    util.yield(50)
    menu.trigger_command(menu.ref_by_path("Stand>Lua Scripts>ScriptManager>Manage Installed Scripts>"..script.name))
end)
menu.divider(menus.install_scripts, "Browse")
for _, script in pairs(script_repository) do
    build_script_repository_item_menu(script, menus.install_scripts)
end

local manage_installed_scripts_menus = {}
menus.installed_scripts = menu.list(menu.my_root(), t("Manage Installed Scripts"), {}, "", function()
    delete_menus(manage_installed_scripts_menus)
    for _, script in pairs(load_managed_scripts()) do
        init_menus(script, "menus")
        script.menus.main = menu.list(menus.installed_scripts, script.name, {}, script.name.."\nby "..script.author.."\n"..script.description, function()
            build_script_menu(script)
        end)
        table.insert(manage_installed_scripts_menus, script.menus.main)
    end
end)


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
