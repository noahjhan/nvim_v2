-- ============================================================================
-- machine.lua
--
-- The single source of truth for anything that varies by machine or project:
--   * which languages you want LSP + treesitter + formatting support for
--   * quick-access directories used by :Command shortcuts and the dashboard
--
-- Edit THIS file when you switch machines, add a language, or add a project
-- folder. Nothing else (lsp.lua, treesitter.lua, conform.lua, autocmds.lua,
-- dashboard.lua) should need to change.
-- ============================================================================

local home = (vim.uv or vim.loop).os_homedir()

local M = {}

M.home = home

-- Each entry may set:
--   lsp        name of the language server (passed to mason-lspconfig / vim.lsp)
--   formatter  name of the conform.nvim formatter
--   filetype   override when the vim filetype differs from the table key
--              (e.g. bash files have filetype "sh", not "bash")
-- Any field can be omitted, e.g. `vim = {}` just gets a treesitter parser.
M.languages = {
  c          = { lsp = "clangd", formatter = "clang-format" },
  cpp        = { lsp = "clangd", formatter = "clang-format" },
  lua        = { lsp = "lua_ls", formatter = "stylua" },
  go         = { lsp = "gopls", formatter = "gofmt" },
  python     = { lsp = "pyright", formatter = "black" },
  rust       = { lsp = "rust_analyzer", formatter = "rustfmt" },
  haskell    = { lsp = "hls", formatter = "ormolu" },
  typescript = { lsp = "ts_ls", formatter = "prettier" },
  javascript = { lsp = "ts_ls", formatter = "prettier" },
  java       = { lsp = "jdtls", formatter = "google-java-format" },
  kotlin     = { lsp = "kotlin_language_server", formatter = "ktlint" },
  html       = { lsp = "html", formatter = "prettier" },
  json       = { lsp = "jsonls", formatter = "prettier" },
  bash       = { lsp = "bashls", filetype = "sh" },
  glsl       = { lsp = "glsl_analyzer", formatter = "glsl_format" },
  vim        = {},
}

-- Quick-access directories: each becomes a `:Command` (see autocmds.lua) and
-- a dashboard entry (see plugins/dashboard.lua).
M.directories = {
  { command = "Config",  path = home .. "/.config/nvim",               desc = "Lasagna Config",  icon = " " },
  { command = "Wezterm", path = home .. "/.config/wezterm",            desc = "Lasagna Wezterm", icon = " " },
  { command = "Tex",     path = home .. "/github_projects",            desc = "Lasagna Enter",   icon = " " },
  { command = "Rat",     path = home .. "/github_projects/rat/rat_rs", desc = "Lasagna Rat",     icon = " " },
}

--- Language server names for mason-lspconfig `ensure_installed` and vim.lsp.enable.
--- Deduplicated, since multiple languages can share one server (e.g. clangd, ts_ls).
function M.lsp_servers()
  local seen, servers = {}, {}
  for _, cfg in pairs(M.languages) do
    if cfg.lsp and not seen[cfg.lsp] then
      seen[cfg.lsp] = true
      table.insert(servers, cfg.lsp)
    end
  end
  return servers
end

--- conform.nvim's `formatters_by_ft` table, keyed by actual vim filetype.
function M.formatters_by_ft()
  local by_ft = {}
  for lang, cfg in pairs(M.languages) do
    if cfg.formatter then
      by_ft[cfg.filetype or lang] = { cfg.formatter }
    end
  end
  return by_ft
end

--- Parser names to install via nvim-treesitter.
function M.treesitter_parsers()
  local parsers = {}
  for lang in pairs(M.languages) do
    table.insert(parsers, lang)
  end
  return parsers
end

--- Vim filetypes to start treesitter highlighting on (may differ from parser names).
function M.treesitter_filetypes()
  local filetypes = {}
  for lang, cfg in pairs(M.languages) do
    table.insert(filetypes, cfg.filetype or lang)
  end
  return filetypes
end

return M
