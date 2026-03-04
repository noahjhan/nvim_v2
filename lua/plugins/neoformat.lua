return {
  "sbdchd/neoformat",
  config = function()
    vim.g.neoformat_enabled_c = { "clangformat" }
    vim.g.neoformat_enabled_cpp = { "clangformat" }
    vim.g.neoformat_enabled_go = { "gofmt" }
    vim.g.neoformat_enabled_lua = { "stylua" }
    vim.g.neoformat_enabled_haskell = { "ormolu" }
    vim.g.neoformat_enabled_kotlin = { "ktlint" }
    vim.g.neoformat_enabled_python = { "black" }
    vim.g.neoformat_enabled_rust = { "rustfmt" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_javascript = { "prettier" }
    vim.g.neoformat_enabled_java = { "google-java-format" }
    vim.g.neoformat_enabled_html = { "prettier" }
    vim.g.neoformat_enabled_json = { "prettier" }

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = {
        "*.c", "*.cpp", "*.h", "*.hpp",
        "*.go",
        "*.lua",
        "*.hs",
        "*.kt",
        "*.py",
        "*.rs",
        "*.ts",
        "*.js",
        "*.java",
        "*.html",
        "*.json",
      },
      command = "Neoformat",
    })
  end,
}
