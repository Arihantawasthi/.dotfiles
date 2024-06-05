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
                style = "night",
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
