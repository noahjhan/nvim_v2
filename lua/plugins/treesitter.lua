local machine = require("config.machine")

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install(machine.treesitter_parsers())

    vim.api.nvim_create_autocmd("FileType", {
      pattern = machine.treesitter_filetypes(),
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
