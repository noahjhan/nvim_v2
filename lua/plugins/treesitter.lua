-- parsers --
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup {
      ensure_installed = {
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
        "bash",
      },
    }
  end
}
