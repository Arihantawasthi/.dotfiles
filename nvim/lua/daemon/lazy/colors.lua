function ColorMyPencils(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    functions = {},
                    variables = {},
                    sidebars = "dark",
                    floats = "dark"
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                variant = "moon",
                dim_inactive_windows = false,
                disable_background = true,
                extend_background_behind_borders = true,

                emable = {
                    terminal = true,
                    migrations = true
                },

                styles = {
                    bold = true,
                    italic = false,
                    transparency = false
                },

                highlight_groups = {
                    Comment = { italic = true }
                }
            })
        end
    },

    {
        "navarasu/onedark.nvim",
        name = "onedark",
        config = function()
            require("onedark").setup({
                style = "darker",
                transparent = true,
                term_colors = true,

                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none"
                },

                lualine = {
                    transparent = false
                },
            })
        end
    }
}
