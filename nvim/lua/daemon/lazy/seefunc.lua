return {
    {
        dir = "~/.config/nvim/lua/seefunc",
        name = "seefunc",
        config = function ()
            vim.api.nvim_set_keymap("n", "<leader>gD", ':lua require"seefunc".see_implementation()<CR>', { noremap = true, silent = true })
        end
    },
}
