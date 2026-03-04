return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",           -- c, cpp
          "lua_ls",           -- lua
          "gopls",            -- go
          "pyright",          -- python
          "rust_analyzer",    -- rust
          "hls",              -- haskell
          "ts_ls",            -- typescript, javascript
          "jdtls",            -- java
          "kotlin_language_server", -- kotlin
          "html",             -- html
          "jsonls",           -- json
          "bashls",           -- bash
        },
        automatic_installation = true,
      })

      vim.lsp.enable({
        "clangd",
        "lua_ls",
        "gopls",
        "pyright",
        "rust_analyzer",
        "hls",
        "ts_ls",
        "jdtls",
        "kotlin_language_server",
        "html",
        "jsonls",
        "bashls",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, silent = true })
          end
          map("gd", vim.lsp.buf.definition)
          map("K", vim.lsp.buf.hover)
          map("gr", vim.lsp.buf.references)
          map("<leader>rn", vim.lsp.buf.rename)
        end,
      })
    end,
  },
}
