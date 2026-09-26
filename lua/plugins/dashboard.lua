local machine = require("config.machine")
local garfield = require("config.ascii")

local header = {}
for _, line in ipairs(garfield.title) do
  table.insert(header, line)
end
for _, line in ipairs(garfield.image) do
  table.insert(header, line)
end

local center = {}

for _, dir in ipairs(machine.directories) do
  table.insert(center, {
    icon = dir.icon,
    icon_hl = "Title",
    desc = dir.desc,
    action = ":cd " .. dir.path .. " | Ex",
  })
end

-- table.insert(center, {
--   icon = " ",
--   icon_hl = "Title",
--   desc = "Lasagna Find",
--   action = ":cd " .. machine.home .. "/github_projects | Telescope find_files | Ex",
-- })

table.insert(center, {
  icon = " ",
  icon_hl = "Title",
  desc = "Lasagna Quit",
  action = ":q",
})

return {
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = header,
          center = center,
          footer = { garfield.quote },
        },
      })
    end,
  },
}
