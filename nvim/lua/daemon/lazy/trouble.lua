return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup()

        vim.keymap.set("n", "<leader>tt", ":Trouble diagnostics toggle<CR>")
        vim.keymap.set("n", "<leader>TT", ":Trouble diagnostics toggle filter.buf=0<CR>")
        vim.keymap.set("n", "<leader>tq", ":Trouble qflist toggle<CR>")
        vim.keymap.set("n", "<leader>tl", ":Trouble lsp toggle focus=false win.position=right<CR>")

        vim.keymap.set("n", "tn", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "tp", function()
            require("trouble").prev({ skip_groups = true, jump = true })
        end)
    end
}
