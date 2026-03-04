return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
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
        },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "clangd", "gopls", "pyright", "rust_analyzer",
        "hls", "ts_ls", "jdtls", "kotlin_language_server",
        "html", "jsonls", "bashls",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        update_in_insert = false,
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
