-- fuzzy finding --
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    pickers = {
      find_files = {
        file_ignore_patterns = {
          "%.o$",
          "%.a$",
          "%.so$",
          "%.dylib$",
          "%.dll$",
          "%.exe$",
          "%.bin$",
          "%.out$",
          "%.class$",

          "%.rmeta$",
          "%.rlib$",
          "%.d$",

          "%.lock$",
          "%.tagset$",

          "node_modules/",
          "vendor/",
          "target/",
          ".venv/",
          "venv/",
          "__pycache__/",

          "build/",
          "dist/",
          "out/",
          "bin/",
          "obj/",
          ".gradle/",
          ".idea/",

          ".cache/",
          ".pytest_cache/",
          ".mypy_cache/",
          ".ruff_cache/",
          ".npm/",
          ".yarn/",
          ".cargo/registry/",
          ".cargo/git/",

          "coverage/",
          ".coverage",

          ".git/",
          ".DS_Store",
          "tags$",

          "Music/",
          "Videos/",
          "Pictures/",
        },
      },
    },
  },

  config = function(_, opts)
    require("telescope").setup(opts)

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
  end,
}
