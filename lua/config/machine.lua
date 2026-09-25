local home = (vim.uv or vim.loop).os_homedir()

local M = {}

M.home = home

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

M.directories = {
  { command = "Config",  path = home .. "/.config/nvim",               desc = "Lasagna Config",  icon = " " },
  { command = "Wezterm", path = home .. "/.config/wezterm",            desc = "Lasagna Wezterm", icon = " " },
  { command = "Tex",     path = home .. "/github_projects",            desc = "Lasagna Enter",   icon = " " },
  { command = "Rat",     path = home .. "/github_projects/rat/rat_rs", desc = "Lasagna Rat",     icon = " " },
}

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

function M.formatters_by_ft()
  local by_ft = {}
  for lang, cfg in pairs(M.languages) do
    if cfg.formatter then
      by_ft[cfg.filetype or lang] = { cfg.formatter }
    end
  end
  return by_ft
end

function M.treesitter_parsers()
  local parsers = {}
  for lang in pairs(M.languages) do
    table.insert(parsers, lang)
  end
  return parsers
end

function M.treesitter_filetypes()
  local filetypes = {}
  for lang, cfg in pairs(M.languages) do
    table.insert(filetypes, cfg.filetype or lang)
  end
  return filetypes
end

return M
