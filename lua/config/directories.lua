local home = os.getenv("HOME")

local dirs = {
  { path = home .. "/.config/nvim/lua", command = "Config" },
  { path = home .. "/.config/wezterm", command = "Wezterm" },
  { path = home .. "/github_projects", command = "Tex" },
  { path = home .. "/stapl-developer/benchmarks/cuda", command = "Tex" }
}
-- -- Line number toggle on Insert mode --

local function dir_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  else
    return false
  end
end

local filtered_dirs = {}
for _, entry in ipairs(dirs) do
  if dir_exists(entry.path) then
    table.insert(filtered_dirs, entry)
  end
end

return filtered_dirs
