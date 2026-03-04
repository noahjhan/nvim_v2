local ascii_art = require('config.ascii')
local directories = dofile(vim.fn.stdpath("config") .. "/lua/config/directories.lua")

math.randomseed(os.time())
local garfield_quotes = {
  "I'm not overweight. I'm undertall.",
  "Diet is 'die' with a 't'.",
  "Love me, feed me, never leave me.",
  "I'll rise, but I won't shine.",
  "If you are patient… and wait long enough… Nothing will happen!",
  "I hate Mondays.",
  "I love lasagna!",
  "Show me a good mouser, and I'll show you a cat with bad breath.",
}
local random_index = math.random(#garfield_quotes)
print(garfield_quotes[random_index])

local project_dir = nil
for _, entry in ipairs(directories) do
  if entry.path:match("github_projects$") then
    project_dir = entry.path
    break
  end
end
if not project_dir then
  for _, entry in ipairs(directories) do
    if entry.path:match("cuda$") then
      project_dir = entry.path
      break
    end
  end
end

local enter_action = project_dir
  and (":cd " .. project_dir .. " | Ex")
  or ":Ex"

return {
  { 
    'nvim-tree/nvim-web-devicons' 
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup { 
        theme = 'doom',
        config = {
          header = ascii_art.neogarf,
          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Lasagna Enter',
              action = enter_action,
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Lasagna Config',
              action = ':cd ~/.config/nvim | Ex',
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Lasagna Find',
              action = (project_dir and (":cd " .. project_dir .. " | Telescope find_files | Ex") 
                        or ':Telescope find_files')
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Lasagna Quit',
              action = ':q',
            },
          },
          footer = { garfield_quotes[random_index] },
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  }
}
