-- fuzzy finding --
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function(_, opts)
    require("telescope").setup(opts)
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
  end,
}
