local home = os.getenv("HOME")

return {
  { path = home .. "/.config/nvim/lua", command = "Config" },
  { path = home .. "/.config/wezterm", command = "Wezterm" },
  { path = home .. "/github_projects", command = "Tex" },
}
