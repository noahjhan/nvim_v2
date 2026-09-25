local machine = require("config.machine")

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

      local servers = machine.lsp_servers()

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      vim.lsp.config("pyright", {
        capabilities = capabilities,

        root_markers = {
          "pyproject.toml",
          "requirements.txt",
          "setup.py",
          "setup.cfg",
          "Pipfile",
          ".git",
        },

        before_init = function(_, config)
          local venv = vim.fn.findfile(".venv/bin/python", ".;")
          if venv ~= "" then
            config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
              python = { pythonPath = vim.fn.fnamemodify(venv, ":p") },
            })
          end
        end,

        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

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
