return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    functions = { "italic" },
                },
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
            })
        end
    }
}
