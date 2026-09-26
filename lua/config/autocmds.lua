local machine = require("config.machine")

for _, entry in ipairs(machine.directories) do
  vim.api.nvim_create_user_command(entry.command, function()
    vim.cmd.cd(entry.path)
    vim.cmd.edit(".")
  end, {})
end

vim.api.nvim_create_user_command("W", function() vim.cmd.write() end, {})
vim.api.nvim_create_user_command("Wq", function() vim.cmd.wq() end, {})

local numbering_group = vim.api.nvim_create_augroup("ToggleRelativeNumber", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = numbering_group,
  callback = function() vim.o.relativenumber = false end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = numbering_group,
  callback = function() vim.o.relativenumber = true end,
})

vim.api.nvim_create_user_command("This", function()
  vim.cmd("cd %:p:h")
end, {})
