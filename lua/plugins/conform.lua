local machine = require("config.machine")

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },

  opts = {
    formatters_by_ft = machine.formatters_by_ft(),

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
