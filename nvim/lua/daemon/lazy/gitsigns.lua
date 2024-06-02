return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()

        vim.keymap.set("n", "]c", ":Gitsigns prev_hunk<CR>")
        vim.keymap.set("n", "[c", ":Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "gb", ":Gitsigns toggle_current_line_blame<CR>")
        vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>")
    end
}
