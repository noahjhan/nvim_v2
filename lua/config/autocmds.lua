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
