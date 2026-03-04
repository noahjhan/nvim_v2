-- leader + pv opens Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- yank to system clipboard
vim.keymap.set("n", "y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "y", '"+y', { noremap = true, silent = true })

-- paste from system clipboard
vim.keymap.set("n", "p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"+p', { noremap = true, silent = true })

-- delete to system clipboard
vim.keymap.set("n", "d", '"+d', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"+d', { noremap = true, silent = true })

-- paste/delete into black hole register
vim.keymap.set("x", "<leader>p", [["_d+P]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- escape in terminal mode to return to Normal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- centers cursor after scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
