return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "lua",
      "go",
      "python",
      "rust",
      "haskell",
      "typescript",
      "javascript",
      "java",
      "kotlin",
      "vim",
      "html",
      "json",
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "cpp",
        "lua",
        "go",
        "python",
        "rust",
        "haskell",
        "typescript",
        "javascript",
        "java",
        "kotlin",
        "vim",
        "html",
        "json",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
