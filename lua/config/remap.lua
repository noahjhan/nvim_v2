vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

for _, key in ipairs({ "y", "p", "d" }) do
  vim.keymap.set({ "n", "v" }, key, '"+' .. key, { noremap = true, silent = true })
end

vim.keymap.set("x", "<leader>p", [["_d"+P]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
