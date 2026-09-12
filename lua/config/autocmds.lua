-- quick access commands -- 
local directories = dofile(vim.fn.stdpath("config") .. "/lua/config/directories.lua")

for _, entry in ipairs(directories) do
    vim.api.nvim_create_user_command(entry.command, function()
        vim.cmd("cd " .. entry.path)
        vim.cmd("e .")
    end, {})
end

-- typo correction commands --

vim.api.nvim_create_user_command("W", function() vim.cmd("w") end, {})
vim.api.nvim_create_user_command("Wq", function() vim.cmd("wq") end, {})

-- line number commands --

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.o.number = true
        vim.o.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.o.number = true
        vim.o.relativenumber = true
    end,
})

-- local last_dir = nil
-- local home = vim.loop.os_homedir()
--
-- local function set_project_root()
--   local filepath = vim.api.nvim_buf_get_name(0)
--   if filepath == "" then return end
--
--   local dir = vim.fn.fnamemodify(filepath, ":p:h")
--
--   -- Check git repo
--   local git_root = vim.fn.systemlist(
--     "git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel"
--   )[1]
--
--   local target = nil
--
--   if vim.v.shell_error == 0 and git_root and git_root ~= "" then
--     target = git_root
--   else
--     if not vim.startswith(dir, home) then
--       return
--     end
--
--     local current = dir
--     while true do
--       local parent = vim.fn.fnamemodify(current, ":h")
--
--       if parent == home then
--         target = current
--         break
--       end
--
--       if current == home then
--         target = home
--         break
--       end
--
--       if parent == current then
--         target = current
--         break
--       end
--
--       current = parent
--     end
--   end
--
--   if target and target ~= last_dir then
--     last_dir = target
--     vim.cmd("cd " .. vim.fn.fnameescape(target))
--   end
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = set_project_root,
-- })
